//
//  StickerDownloadViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 01.04.2026.
//

import Foundation
import SwiftData

extension StickerDownloadView {
  func activated() -> Bool {
    profile.profileModelDTO?.settings.sticker == sticker
  }

  func download() async {
    await viewModel.download(
      complete: {
        try dataContainer.context.save()

        viewModel.completed()
      },
      failed: {
        viewModel.failed()
      },
      filter: { imageURL in
        let savedModel: [StickerModel] = stickerModels.filter { sticker in
          sticker.url == imageURL
        }

        return savedModel.isEmpty
      },
      insert: { index, imageURL, data in
        let (filename, error) = viewModel.stickerManager.saveSticker(data: data)

        if error == nil {
          if let filename = filename {
            dataContainer.context.insert(
              StickerModel(
                index: index + 1,
                url: imageURL,
                sticker: sticker,
                filename: filename,
                timestamp: Date.timeZonedNow
              )
            )
          } else {
            viewModel.notificationRepository.send(errorDTO: ErrorDTO(error: .undefined))
          }
        } else {
          viewModel.notificationRepository.send(errorDTO: ErrorDTO(error: .sticker(error)))
        }
      },
      sticker: sticker,
    )
  }

  @Observable
  class ViewModel {
    enum LoadingStateEnum {
      case idle
      case fetching
      case indexing
      case error
      case completed
    }

    var actualAmount: Int = 0
    var imageURLs: [String] = []
    var status: LoadingStateEnum = .idle

    let imageRepository: ImageRepository
    let notificationRepository: NotificationRepository
    let societyRepository: SocietyRepository
    let stickerManager: StickerManager

    init(
      imageRepository: ImageRepository = ImageRepository(),
      notificationRepository: NotificationRepository = NotificationRepository(),
      societyRepository: SocietyRepository = SocietyRepository(),
      stickerManager: StickerManager = StickerManager()
    ) {
      self.imageRepository = imageRepository
      self.notificationRepository = notificationRepository
      self.societyRepository = societyRepository
      self.stickerManager = stickerManager
    }

    func fetchImageUrls(_ sticker: StickerEnum) async {
      do {
        status = .fetching
        imageURLs = try await imageRepository.find(
          sticker: sticker
        ).stickers
      } catch {
        failed()
      }
    }

    func fetchImageData(_ url: String) async -> Data? {
      do {
        status = .indexing

        return try await imageRepository.fetchData(url)
      } catch {
        failed()

        return nil
      }
    }

    func completed() {
      status = .completed
    }

    func failed() {
      status = .error
    }

    func setStatus(sticker: StickerEnum, actualAmount: Int) {
      let expectedAmount: Int = sticker.amount

      if actualAmount == 0 {
        status = .idle

        return
      }

      if expectedAmount > actualAmount {
        status = .error

        return
      }

      if expectedAmount == actualAmount {
        status = .completed

      }
    }

    func download(
      complete: @escaping () throws -> Void,
      failed: @escaping () -> Void,
      filter: @escaping (_ imageURL: String) -> Bool,
      insert:
        @escaping (_ index: Int, _ imageURL: String, _ data: Data) ->
        Void,
      sticker: StickerEnum,
    ) async {
      do {
        await fetchImageUrls(sticker)

        let amount: Int = sticker.amount

        for (index, imageURL) in imageURLs.enumerated() {
          if amount >= index + 1 {
            if filter(imageURL) {
              if let data = await fetchImageData(imageURL) {
                insert(index, imageURL, data)
              }
            }
          }
        }

        try complete()
      } catch {
        failed()
      }
    }
  }
}
