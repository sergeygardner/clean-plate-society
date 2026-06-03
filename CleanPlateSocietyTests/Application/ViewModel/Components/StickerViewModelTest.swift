//
//  StickerViewModelTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 23.04.2026.
//

import Foundation
import SwiftUI
import Testing

@testable import CleanPlateSociety

@Suite(.tags(.viewModel))
@MainActor
struct StickerViewModelTest {
  struct Input {
    let expected: Bool
  }

  @Test(
    "init",
    arguments: [
      Input(expected: true)
    ]
  ) func testInit(input: Input) async throws {
    #expect(throws: Never.self) {
      let _ = StickerView<EmptyView>.ViewModel()
    }
  }
}
