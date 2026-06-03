//
//  EntryViewTest.swift
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
struct EntryViewTest {
  @Test func testEnglishRoyalLight() async throws {
    let view = PreviewContainerView {
      EntryView(
        date: getEntryDate(),
        profileName: Profile.sampleFormalLow.profileModel!.name
      ) {

      }
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishRoyalLight")
  }

  @Test func testEnglishForestLight() async throws {
    let view = PreviewContainerView {
      EntryView(
        date: getEntryDate(),
        profileName: Profile.sampleFormalLow.profileModel!.name
      ) {

      }
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishForestLight")
  }

  @Test func testEnglishHarvestLight() async throws {
    let view = PreviewContainerView {
      EntryView(
        date: getEntryDate(),
        profileName: Profile.sampleFormalLow.profileModel!.name
      ) {

      }
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishHarvestLight")
  }

  @Test func testEnglishMidnightLight() async throws {
    let view = PreviewContainerView {
      EntryView(
        date: getEntryDate(),
        profileName: Profile.sampleFormalLow.profileModel!.name
      ) {

      }
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishMidnightLight")
  }

  func getEntryDate() -> Date {
    let date: Date = Date.snapshotReferenceDate ?? Date.timeZonedNow

    return date
  }
}
