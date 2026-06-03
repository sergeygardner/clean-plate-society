//
//  DaysViewTest.swift
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
struct DaysViewTest {
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
        DaysView(
          columns: Array(repeating: GridItem(.flexible()), count: 7),
          days: Date.snapshotReferenceDate?.allDays ?? Date.timeZonedNow.allDays,
          currentDate: Date.snapshotReferenceDate ?? Date.timeZonedNow,
          profileUUID: UUID.sampleProfileUUID
        )
        .navigationDestination(for: DayViewDTO.self) {
          dayViewDTO in

          DayView(
            currentDate: dayViewDTO.currentDay,
            profileUUID: UUID.sampleProfileUUID
          )

        }
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
          from: -1,
          to: -1,
          date: Date.snapshotReferenceDate ?? Date.timeZonedNow
        )
      )
    ) {
      NavigationStack {
        DaysView(
          columns: Array(repeating: GridItem(.flexible()), count: 7),
          days: Date.timeZonedNow.allDays,
          currentDate: Date.timeZonedNow,
          profileUUID: UUID.sampleProfileUUID
        )
        .navigationDestination(for: DayViewDTO.self) {
          dayViewDTO in

          DayView(
            currentDate: dayViewDTO.currentDay,
            profileUUID: UUID.sampleProfileUUID
          )

        }
      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalDark", colorScheme: .dark)
  }
}
