//
//  StickerModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 06.03.2026.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class StickerModel {
  var id: UUID
  var index: Int
  var url: String
  var stickerRawValue: String
  var sticker: StickerEnum {
    get { StickerEnum(rawValue: stickerRawValue) ?? .standard }
    set { stickerRawValue = newValue.rawValue }
  }
  var filename: String
  var timestamp: Date

  init(
    id: UUID = UUID(),
    index: Int,
    url: String,
    sticker: StickerEnum,
    filename: String,
    timestamp: Date
  ) {
    self.id = id
    self.index = index
    self.url = url
    self.stickerRawValue = sticker.rawValue
    self.filename = filename
    self.timestamp = timestamp
  }
}

extension StickerModel {
  static var sampleData: [StickerModel] {
    return generateSampleData(
      stickers: [.standard],
    )
  }

  static func generateSampleData(
    stickers: [StickerEnum]
  ) -> [StickerModel] {
    var samples: [StickerModel] = []

    for sticker in stickers {
      let maxEntries: Int = sticker.amount

      for i in (1...maxEntries) {
        let (filename, error) = StickerManager.shared.saveSticker(
          data: UIImage(systemName: "photo")!.pngData()!
        )

        if error == nil, let filename = filename {
          samples.append(
            StickerModel(
              index: i,
              url: "\(sticker.rawValue)-\(i).png",
              sticker: sticker,
              filename: filename,
              timestamp: Date.timeZonedNow,
            )
          )
        }
      }
    }

    return samples
  }
}
