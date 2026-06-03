//
//  File.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 23.04.2026.
//

import Foundation

struct EntryModelDTOFactory {
  func fromModel(_ model: EntryModel) -> EntryModelDTO {
    return EntryModelDTO(
      uuid: model.uuid,
      profileUUID: model.profileUUID,
      sticker: model.sticker,
      timestamp: model.timestamp
    )
  }

  func toModel(_ dto: EntryModelDTO) -> EntryModel {
    return EntryModel(
      uuid: dto.uuid,
      profileUUID: dto.profileUUID,
      sticker: dto.sticker,
      timestamp: dto.timestamp
    )
  }
}
