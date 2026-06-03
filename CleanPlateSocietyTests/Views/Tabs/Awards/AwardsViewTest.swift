//
//  AwardsViewTest.swift
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
struct AwardsViewTest {
  @Test func testEnglishFormalLightAllAwardsUnlocked() async throws {
    let view = PreviewContainerView(
      PreviewContainerView.Samples(
        award: PreviewContainerView.Sample(
          from: -1,
          to: -1,
          date: Date.snapshotReferenceDate ?? Date.timeZonedNow
        )
      )
    ) {
      AwardsView(
        profileUUID: UUID.sampleProfileUUID
      )
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(
      self,
      of: view,
      named: "EnglishFormalLightAllAwardsUnlocked"
    )
  }

  @Test func testEnglishFormalLightAllAwardsLocked() async throws {
    let view = PreviewContainerView(
      PreviewContainerView.Samples.awardEmpty
    ) {
      AwardsView(
        profileUUID: UUID.sampleProfileUUID
      )
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(
      self,
      of: view,
      named: "EnglishFormalLightAllAwardsLocked"
    )
  }

  @Test func testEnglishFormalLightHalfAwardsLocked() async throws {
    let view = PreviewContainerView(
      PreviewContainerView.Samples(
        award: PreviewContainerView.Sample(
          from: 0,
          to: Int(AwardEnum.allCases.count / 2),
          date: Date.snapshotReferenceDate ?? Date.timeZonedNow
        )
      )
    ) {
      AwardsView(
        profileUUID: UUID.sampleProfileUUID
      )
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(
      self,
      of: view,
      named: "EnglishFormalLightHalfAwardsLocked"
    )
  }
}
