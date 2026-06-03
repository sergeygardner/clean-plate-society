//
//  AchievmentModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 02.04.2026.
//

import Foundation
import SwiftData

@Model
class AwardModel {
  var uuid: UUID
  var profileUUID: UUID {
    get { UUID(uuidString: profileUUIDRawValue) ?? UUID() }
    set { profileUUIDRawValue = newValue.uuidString }
  }
  var profileUUIDRawValue: String
  var rawValue: String
  var stickerRawValue: String
  var sticker: StickerEnum {
    get { StickerEnum(rawValue: stickerRawValue) ?? .standard }
    set { stickerRawValue = newValue.rawValue }
  }
  var value: AwardEnum {
    get { AwardEnum(rawValue: rawValue) ?? .level1 }
    set { rawValue = newValue.rawValue }
  }
  var timestamp: Date

  init(
    uuid: UUID = UUID(),
    profileUUID: UUID,
    value: AwardEnum,
    sticker: StickerEnum,
    timestamp: Date
  ) {
    self.uuid = uuid
    self.profileUUIDRawValue = profileUUID.uuidString
    self.rawValue = value.rawValue
    self.stickerRawValue = sticker.rawValue
    self.timestamp = timestamp
  }
}

extension AwardModel {
  static var sampleData: [AwardModel] {
    return generateSampleData(
      stickers: [.standard],
      awards: AwardEnum.allCases,
    )
  }

  static func generateSampleData(
    stickers: [StickerEnum],
    awards: [AwardEnum],
    date: Date = Date.timeZonedNow,
  ) -> [AwardModel] {
    var samples: [AwardModel] = []

    for sticker in stickers {
      var max: Double = Double(-100 * awards.count)

      for award in awards {
        samples.append(
          AwardModel(
            profileUUID: UUID.sampleProfileUUID,
            value: award,
            sticker: sticker,
            timestamp: date.advanced(by: max)
          )
        )

        max -= 100
      }
    }

    return samples
  }
}
