//
//  File.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 23.04.2026.
//

import Foundation

struct ProfileModelDTOFactory {
  let settingsModelDTOFactory: SettingsModelDTOFactory

  init(settingsModelDTOFactory: SettingsModelDTOFactory = SettingsModelDTOFactory()) {
    self.settingsModelDTOFactory = settingsModelDTOFactory
  }

  func fromModel(_ model: ProfileModel) -> ProfileModelDTO {
    return ProfileModelDTO(
      uuid: model.uuid,
      name: model.name,
      settings: settingsModelDTOFactory.fromModel(model.settings),
      createdAt: model.createdAt,
      updatedAt: model.updatedAt
    )
  }

  func toModel(_ dto: ProfileModelDTO) -> ProfileModel {
    return ProfileModel(
      uuid: dto.uuid,
      name: dto.name,
      settings: settingsModelDTOFactory.toModel(dto.settings),
      createdAt: dto.createdAt,
      updatedAt: dto.updatedAt
    )
  }
}
