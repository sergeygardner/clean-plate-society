//
//  LedgerViewTest.swift
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
struct LedgerViewTest {
  @Test func testEnglishFormalLight() async throws {
    let view = PreviewContainerView(
      PreviewContainerView.Samples(
        entry: PreviewContainerView.Sample(
          from: -1,
          to: -1,
          date: Date.snapshotReferenceDate ?? Date.timeZonedNow
        )
      )
    ) {
      NavigationStack {
        LedgerView(
          currentDate: Date.snapshotReferenceDate ?? Date.timeZonedNow,
          currentMonth: Date.snapshotReferenceDate ?? Date.timeZonedNow
        )
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLight")
  }

  @Test func testEnglishFormalDark() async throws {
    let view = PreviewContainerView(
      PreviewContainerView.Samples(
        entry: PreviewContainerView.Sample(
          from: -1,
          to: -1,
          date: Date.snapshotReferenceDate ?? Date.timeZonedNow
        )
      )
    ) {
      NavigationStack {
        LedgerView(
          currentDate: Date.snapshotReferenceDate ?? Date.timeZonedNow,
          currentMonth: Date.snapshotReferenceDate ?? Date.timeZonedNow
        )
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.dark)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalDark", colorScheme: .dark)
  }
}
