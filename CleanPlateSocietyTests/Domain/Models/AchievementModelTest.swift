//
//  AwardModelTest.swift
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
struct AwardModelTest {
  let context: ModelContext

  init() throws {
    switch DataContainer.shared {
    case .success(let dataContainer):
      context = dataContainer.context
    case .failure(let error):
      throw error
    }
  }

  @Test func testInit() async throws {
    let model = AwardModel.sampleData.first!
    let expectedProfileUUID = UUID()
    let expectedSticker = StickerEnum.badgers

    context.insert(model)

    #expect(model.profileUUID != expectedProfileUUID)
    #expect(model.profileUUIDRawValue != expectedProfileUUID.uuidString)
    #expect(model.sticker != expectedSticker)
    #expect(model.stickerRawValue != expectedSticker.rawValue)

    model.profileUUID = expectedProfileUUID
    model.sticker = expectedSticker

    #expect(model.profileUUID == expectedProfileUUID)
    #expect(model.profileUUIDRawValue == expectedProfileUUID.uuidString)
    #expect(model.sticker == expectedSticker)
    #expect(model.stickerRawValue == expectedSticker.rawValue)
  }
}
