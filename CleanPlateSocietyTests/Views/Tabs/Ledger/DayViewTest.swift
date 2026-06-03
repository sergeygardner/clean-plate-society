//
//  DayViewTest.swift
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
struct DayViewTest {
  @Test func testEnglishFormalLight() async throws {
    let view = PreviewContainerView(
      PreviewContainerView.Samples(
        entry: PreviewContainerView.Sample(
          from: StickerEnum.standard.amount - 1,
          to: StickerEnum.standard.amount - 1,
          date: Date.snapshotReferenceDate ?? Date.timeZonedNow
        )
      )
    ) {
      NavigationStack {
        DayView(
          currentDate: Date.snapshotReferenceDate ?? Date.timeZonedNow,
          profileUUID: UUID.sampleProfileUUID
        )
      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLight")
  }

  @Test func testEnglishFormalDark() async throws {
    let view = PreviewContainerView(
      PreviewContainerView.Samples(
        entry: PreviewContainerView.Sample(
          from: StickerEnum.standard.amount - 1,
          to: StickerEnum.standard.amount - 1,
          date: Date.snapshotReferenceDate ?? Date.timeZonedNow
        )
      )
    ) {
      NavigationStack {
        DayView(
          currentDate: Date.snapshotReferenceDate ?? Date.timeZonedNow,
          profileUUID: UUID.sampleProfileUUID
        )
      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalDark", colorScheme: .dark)
  }
}
