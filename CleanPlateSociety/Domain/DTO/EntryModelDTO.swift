//
//  EntryModelDTO.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 06.03.2026.
//

import Foundation

struct EntryModelDTO {
  let uuid: UUID
  let profileUUID: UUID
  let sticker: StickerEnum
  let timestamp: Date

  init(
    uuid: UUID = UUID(),
    profileUUID: UUID = UUID(),
    sticker: StickerEnum,
    timestamp: Date
  ) {
    self.uuid = uuid
    self.profileUUID = profileUUID
    self.sticker = sticker
    self.timestamp = timestamp
  }
}
