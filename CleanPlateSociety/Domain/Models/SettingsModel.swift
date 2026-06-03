//
//  SettingsModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 05.03.2026.
//
import SwiftData

@Model
final class SettingsModel: Codable {
  var difficultyLevel: DifficultyLevelEnum
  var haptic: Bool
  var sticker: StickerEnum
  var theme: Theme

  enum CodingKeys: String, CodingKey {
    case difficultyLevel
    case haptic
    case sticker
    case theme
  }

  init(difficultyLevel: DifficultyLevelEnum, haptic: Bool, sticker: StickerEnum, theme: Theme) {
    self.difficultyLevel = difficultyLevel
    self.haptic = haptic
    self.sticker = sticker
    self.theme = theme
  }

  required init(from decoder: Decoder) throws {
    let container: KeyedDecodingContainer<CodingKeys> = try decoder.container(
      keyedBy: CodingKeys.self)
    self.difficultyLevel = try container.decode(
      DifficultyLevelEnum.self,
      forKey: .difficultyLevel
    )
    self.haptic = try container.decode(Bool.self, forKey: .haptic)
    self.sticker = try container.decode(StickerEnum.self, forKey: .sticker)
    self.theme = try container.decode(Theme.self, forKey: .theme)
  }

  func encode(to encoder: Encoder) throws {
    var container: KeyedEncodingContainer<CodingKeys> = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(difficultyLevel, forKey: .difficultyLevel)
    try container.encode(haptic, forKey: .haptic)
    try container.encode(sticker, forKey: .sticker)
    try container.encode(theme, forKey: .theme)
  }
}

extension SettingsModel {
  static var sampleFormalLow = SettingsModel(
    difficultyLevel: .low,
    haptic: true,
    sticker: .standard,
    theme: .formal,
  )
  static var sampleFormalLowBadgers = SettingsModel(
    difficultyLevel: .low,
    haptic: true,
    sticker: .badgers,
    theme: .formal,
  )
  static var sampleFormalMedium = SettingsModel(
    difficultyLevel: .medium,
    haptic: true,
    sticker: .standard,
    theme: .formal,
  )
  static var sampleFormalHigh = SettingsModel(
    difficultyLevel: .high,
    haptic: true,
    sticker: .standard,
    theme: .formal,
  )
  static var sampleRoyalLow = SettingsModel(
    difficultyLevel: .low,
    haptic: true,
    sticker: .standard,
    theme: .royal,
  )
  static var sampleRoyalMedium = SettingsModel(
    difficultyLevel: .medium,
    haptic: true,
    sticker: .standard,
    theme: .royal,
  )
  static var sampleRoyalHigh = SettingsModel(
    difficultyLevel: .high,
    haptic: true,
    sticker: .standard,
    theme: .royal,
  )
  static var sampleForestLow = SettingsModel(
    difficultyLevel: .low,
    haptic: true,
    sticker: .standard,
    theme: .forest,
  )
  static var sampleForestMedium = SettingsModel(
    difficultyLevel: .medium,
    haptic: true,
    sticker: .standard,
    theme: .forest,
  )
  static var sampleForestHigh = SettingsModel(
    difficultyLevel: .high,
    haptic: true,
    sticker: .standard,
    theme: .forest,
  )
  static var sampleHarvestLow = SettingsModel(
    difficultyLevel: .low,
    haptic: true,
    sticker: .standard,
    theme: .harvest,
  )
  static var sampleHarvestMedium = SettingsModel(
    difficultyLevel: .medium,
    haptic: true,
    sticker: .standard,
    theme: .harvest,
  )
  static var sampleHarvestHigh = SettingsModel(
    difficultyLevel: .high,
    haptic: true,
    sticker: .standard,
    theme: .harvest,
  )
  static var sampleMidnightLow = SettingsModel(
    difficultyLevel: .low,
    haptic: true,
    sticker: .standard,
    theme: .midnight,
  )
  static var sampleMidnightMedium = SettingsModel(
    difficultyLevel: .medium,
    haptic: true,
    sticker: .standard,
    theme: .midnight,
  )
  static var sampleMidnightHigh = SettingsModel(
    difficultyLevel: .high,
    haptic: true,
    sticker: .standard,
    theme: .midnight,
  )
}
