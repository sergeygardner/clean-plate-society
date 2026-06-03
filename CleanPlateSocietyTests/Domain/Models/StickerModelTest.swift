//
//  StickerModelTest.swift
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
struct StickerModelTest {
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
    let model = StickerModel.sampleData.first!
    let expectedSticker = StickerEnum.badgers

    context.insert(model)

    #expect(model.sticker != expectedSticker)
    #expect(model.stickerRawValue != expectedSticker.rawValue)

    model.sticker = expectedSticker

    #expect(model.sticker == expectedSticker)
    #expect(model.stickerRawValue == expectedSticker.rawValue)
  }
}
