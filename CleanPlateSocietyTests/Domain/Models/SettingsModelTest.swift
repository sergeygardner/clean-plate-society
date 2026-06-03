//
//  SettingsModelTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 24.04.2026.
//

import Foundation
import SwiftData
import Testing

@testable import CleanPlateSociety

@Suite(.tags(.model))
@MainActor
struct SettingsModelTest {
  @Test func testInit() async throws {
    #expect(throws: Never.self) {
      let model: SettingsModel = SettingsModel.sampleFormalLow
      let expectedDifficultyLevel: DifficultyLevelEnum = DifficultyLevelEnum.medium
      let expectedHaptic: Bool = false
      let expectedSticker: StickerEnum = StickerEnum.badgers
      let expectedTheme: Theme = Theme.forest

      #expect(model.difficultyLevel != expectedDifficultyLevel)
      #expect(model.haptic != expectedHaptic)
      #expect(model.sticker != expectedSticker)
      #expect(model.theme != expectedTheme)

      let encoder: JSONEncoder = JSONEncoder()
      let encoded: Data = try encoder.encode(model)
      let decoder: JSONDecoder = JSONDecoder()
      let decoded: SettingsModel = try decoder.decode(SettingsModel.self, from: encoded)

      decoded.difficultyLevel = expectedDifficultyLevel
      decoded.haptic = expectedHaptic
      decoded.sticker = expectedSticker
      decoded.theme = expectedTheme

      #expect(decoded.difficultyLevel == expectedDifficultyLevel)
      #expect(decoded.haptic == expectedHaptic)
      #expect(decoded.sticker == expectedSticker)
      #expect(decoded.theme == expectedTheme)
    }
  }
}
