//
//  DaysOfWeekViewTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 24.04.2026.
//

import SnapshotTesting
import SwiftData
import SwiftUI
import Testing

@testable import CleanPlateSociety

@Suite(.tags(.view), .serialized) @MainActor
struct DaysOfWeekViewTest {
  @Test func testEnglishFormalLight() async throws {
    let view = DaysOfWeekView(daysOfWeek: Date.weekDays(locale: Locale(identifier: "en")))
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLight")
  }

  @Test func testEnglishFormalDark() async throws {
    let view = DaysOfWeekView(daysOfWeek: Date.weekDays(locale: Locale(identifier: "en")))
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(ColorScheme(.dark))

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalDark", colorScheme: .dark)
  }
}
