//
//  FileManager.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 12.05.2026.
//

import Foundation
import UIKit

class StickerManager {
  static var shared: StickerManager = StickerManager()

  enum DirnameEnum: String {
    case stickers = "Stickers"
  }

  let fileRepository: FileRepository
  let imageCacheManager: ImageCacheManagerProtocol
  let imageRepository: ImageRepository

  init(
    fileRepository: FileRepository = FileRepository(),
    imageCacheManager: ImageCacheManagerProtocol = ImageCacheManager.shared,
    imageRepository: ImageRepository = ImageRepository(),
  ) {
    self.fileRepository = fileRepository
    self.imageCacheManager = imageCacheManager
    self.imageRepository = imageRepository
  }

  func saveSticker(data: Data, type: FileRepository.FileTypeEnum = .webp) -> (
    String?, FileErrorEnum?
  ) {
    return fileRepository.save(DirnameEnum.stickers.rawValue, data, type)
  }

  func loadSticker(_ filename: String) -> (UIImage?, FileErrorEnum?) {
    let (folderURL, error) = fileRepository.getFullPath(
      dirname: DirnameEnum.stickers.rawValue, filename: filename)

    if error == nil, let folderURL = folderURL {
      return (UIImage(contentsOfFile: folderURL.path), nil)
    } else {
      return (nil, error)
    }
  }

  func loadSticker(_ sticker: StickerEnum) async -> (UIImage?, FileErrorEnum?) {
    do {
      let stickerURL = try await imageRepository.findURLForSticker(sticker: sticker)
      let stickerData = try await imageRepository.fetchData(stickerURL)

      return (UIImage(data: stickerData), nil)
    } catch {
      return (nil, .core(error))
    }
  }

  func getCachedSticker(_ filename: String) -> UIImage? {
    return imageCacheManager.get(forKey: filename)
  }

  func getCachedSticker(_ sticker: StickerEnum) -> UIImage? {
    return imageCacheManager.get(forKey: sticker.rawValue)
  }

  func cacheSticker(_ filename: String) -> (UIImage?, FileErrorEnum?) {
    let (image, error) = loadSticker(filename)

    if error == nil, let image = image {
      imageCacheManager.set(image, forKey: filename)

      return (image, nil)
    } else {
      return (nil, error)
    }
  }

  func cacheSticker(_ sticker: StickerEnum) async -> (UIImage?, FileErrorEnum?) {
    let (image, error) = await loadSticker(sticker)

    if error == nil, let image = image {
      imageCacheManager.set(image, forKey: sticker.rawValue)

      return (image, nil)
    } else {
      return (nil, error)
    }
  }
}
