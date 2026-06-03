//
//  StickerDownloadViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 01.04.2026.
//

import CryptoKit
import Foundation
import PhotosUI
import SwiftData
import SwiftUI

extension StickerUploadView {
  func activated() -> Bool {
    profile.profileModelDTO?.settings.sticker == sticker
  }

  func upload(from items: [PhotosPickerItem]) async {
    await viewModel.upload(
      items: items,
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

        if error == nil, let filename = filename {
          dataContainer.context.insert(
            StickerModel(
              index: index + 1,
              url: imageURL,
              sticker: sticker,
              filename: filename,
              timestamp: Date.timeZonedNow
            )
          )
        }
      },
      sticker: sticker,
    )
  }

  @Observable
  class ViewModel: SocietyRepositoryModel {
    enum LoadingStateEnum {
      case idle
      case indexing
      case error
      case completed
    }

    var actualAmount: Int = 0
    var selectedItems: [PhotosPickerItem] = []
    var status: LoadingStateEnum = .idle

    let stickerManager: StickerManager

    init(
      stickerManager: StickerManager = StickerManager()
    ) {
      self.stickerManager = stickerManager
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

    func upload(
      items: [PhotosPickerItem],
      complete: @escaping () throws -> Void,
      failed: @escaping () -> Void,
      filter: @escaping (_ imageURL: String) -> Bool,
      insert:
        @escaping (_ index: Int, _ imageURL: String, _ data: Data) ->
        Void,
      sticker: StickerEnum,
    ) async {
      status = .indexing
      do {
        let amount: Int = sticker.amount
        var index: Int = 0

        for item in items {
          if amount >= index + 1,
            let data = try? await item.loadTransferable(type: Data.self)
          {
            let imageURL: String = SHA256.hash(data: data).description

            if filter(imageURL) {
              insert(index, imageURL, data)

              index += 1
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
