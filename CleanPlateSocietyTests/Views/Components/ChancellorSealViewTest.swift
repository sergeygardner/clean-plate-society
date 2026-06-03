//
//  ChancellorSealViewTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 24.04.2026.
//

import SnapshotTesting
import SwiftData
import SwiftUI
import Testing

@testable import CleanPlateSociety

@Suite(.tags(.view), .serialized)
@MainActor
struct ChancellorSealViewTest {
  @Test func testEnglishLight() async throws {
    let view = ChancellorSealView()
      .preferredColorScheme(.light)

    await assertCustomSnapshot(self, of: view, named: "EnglishLight")
  }

  @Test func testEnglishDark() async throws {
    let view = ChancellorSealView()
      .preferredColorScheme(.dark)

    await assertCustomSnapshot(self, of: view, named: "EnglishDark", colorScheme: .dark)
  }
}
