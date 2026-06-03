//
//  SettingsModelDTO.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 05.03.2026.
//
import Foundation

struct SettingsModelDTO: Equatable {
  let difficultyLevel: DifficultyLevelEnum
  let haptic: Bool
  let sticker: StickerEnum
  let theme: Theme

  init(difficultyLevel: DifficultyLevelEnum, haptic: Bool, sticker: StickerEnum, theme: Theme) {
    self.difficultyLevel = difficultyLevel
    self.haptic = haptic
    self.sticker = sticker
    self.theme = theme
  }

  static func == (lhs: SettingsModelDTO, rhs: SettingsModelDTO) -> Bool {
    return lhs.difficultyLevel == rhs.difficultyLevel
      && lhs.haptic == rhs.haptic
      && lhs.sticker == rhs.sticker
      && lhs.theme == rhs.theme
  }
}
