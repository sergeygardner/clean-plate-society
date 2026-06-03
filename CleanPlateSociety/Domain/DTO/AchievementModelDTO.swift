//
//  AwardModelDTO.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 02.04.2026.
//

import Foundation

struct AwardModelDTO {
  var uuid: UUID
  var profileUUID: UUID
  var sticker: StickerEnum
  var value: AwardEnum
  var timestamp: Date

  init(
    uuid: UUID = UUID(),
    profileUUID: UUID,
    value: AwardEnum,
    sticker: StickerEnum,
    timestamp: Date
  ) {
    self.uuid = uuid
    self.profileUUID = profileUUID
    self.value = value
    self.sticker = sticker
    self.timestamp = timestamp
  }
}
