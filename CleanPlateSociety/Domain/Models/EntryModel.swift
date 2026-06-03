//
//  EntryModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 06.03.2026.
//

import Foundation
import SwiftData

@Model
final class EntryModel: Equatable {
  var uuid: UUID
  var profileUUID: UUID {
    get { UUID(uuidString: profileUUIDRawValue) ?? UUID() }
    set { profileUUIDRawValue = newValue.uuidString }
  }
  var profileUUIDRawValue: String
  var stickerRawValue: String
  var sticker: StickerEnum {
    get { StickerEnum(rawValue: stickerRawValue) ?? .standard }
    set { stickerRawValue = newValue.rawValue }
  }
  var timestamp: Date

  init(
    uuid: UUID = UUID(),
    profileUUID: UUID = UUID(),
    sticker: StickerEnum,
    timestamp: Date
  ) {
    self.uuid = uuid
    self.profileUUIDRawValue = profileUUID.uuidString
    self.stickerRawValue = sticker.rawValue
    self.timestamp = timestamp
  }
}

extension EntryModel {
  static var sampleData: [EntryModel] {
    return generateSampleData(
      profileUUID: UUID.sampleProfileUUID,
      difficultyLevel: DifficultyLevelEnum.low,
      stickers: [StickerEnum.standard],
    )
  }

  static func generateSampleData(
    profileUUID: UUID,
    difficultyLevel: DifficultyLevelEnum,
    stickers: [StickerEnum],
    date: Date = Date.timeZonedNow,
  ) -> [EntryModel] {
    let choosenLevel: Int = difficultyLevel.progress
    var days: Int
    var samples: [EntryModel] = []
    var currentDate: Date = date

    for sticker in stickers {
      let maxEntries: Int = sticker.amount

      days = maxEntries

      if let date = Date.normalisedCalendar.date(
        byAdding: .day,
        value: -days,
        to: date
      ) {
        currentDate = date

        for _ in (0..<choosenLevel * maxEntries) {
          currentDate = currentDate.getBreakpoint(difficultyLevel)
          samples.append(
            EntryModel(
              profileUUID: profileUUID,
              sticker: sticker,
              timestamp: currentDate,
            )
          )
        }
      }
    }

    return samples
  }
}
