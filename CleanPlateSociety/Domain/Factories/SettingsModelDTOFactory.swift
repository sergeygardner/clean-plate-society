//
//  File.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 23.04.2026.
//

import Foundation

struct SettingsModelDTOFactory {
  func fromModel(_ model: SettingsModel) -> SettingsModelDTO {
    return SettingsModelDTO(
      difficultyLevel: model.difficultyLevel,
      haptic: model.haptic,
      sticker: model.sticker,
      theme: model.theme
    )
  }

  func toModel(_ dto: SettingsModelDTO) -> SettingsModel {
    return SettingsModel(
      difficultyLevel: dto.difficultyLevel,
      haptic: dto.haptic,
      sticker: dto.sticker,
      theme: dto.theme
    )
  }
}
