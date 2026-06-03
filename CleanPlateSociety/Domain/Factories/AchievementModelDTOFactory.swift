//
//  File.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 23.04.2026.
//

import Foundation

struct AwardModelDTOFactory {
  func fromModel(_ model: AwardModel) -> AwardModelDTO {
    return AwardModelDTO(
      uuid: model.uuid,
      profileUUID: model.profileUUID,
      value: model.value,
      sticker: model.sticker,
      timestamp: model.timestamp
    )
  }

  func toModel(_ dto: AwardModelDTO) -> AwardModel {
    return AwardModel(
      uuid: dto.uuid,
      profileUUID: dto.profileUUID,
      value: dto.value,
      sticker: dto.sticker,
      timestamp: dto.timestamp
    )
  }
}
