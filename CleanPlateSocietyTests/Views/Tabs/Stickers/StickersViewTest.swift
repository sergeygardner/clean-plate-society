//
//  StickersViewTest.swift
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
struct StickersViewTest {
  @Test func testEnglishFormalLightStandardDownloaded() async throws {
    let view = PreviewContainerView {
      NavigationStack {
        StickersView()
      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLightStandardDownloaded")
  }

  @Test func testEnglishFormalLightBearsDownloaded() async throws {
    let view = PreviewContainerView(
      PreviewContainerView.Samples(
        sticker: PreviewContainerView.sampleBearsStickerFull
      )
    ) {
      NavigationStack {
        StickersView()
      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLightBearsDownloaded")
  }

  @Test func testEnglishFormalLightStandardNotDownloaded() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      NavigationStack {
        StickersView()
      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLightStandardNotDownloaded")
  }

  @Test func testEnglishRoyalLightStandardNotDownloaded() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      NavigationStack {
        StickersView()
      }
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishRoyalLightStandardNotDownloaded")
  }

  @Test func testEnglishForestLightStandardNotDownloaded() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      NavigationStack {
        StickersView()
      }
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishForestLightStandardNotDownloaded")
  }

  @Test func testEnglishHarvestLightStandardNotDownloaded() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      NavigationStack {
        StickersView()
      }
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishHarvestLightStandardNotDownloaded")
  }

  @Test func testEnglishMidnightLightStandardNotDownloaded() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      NavigationStack {
        StickersView()
      }
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(
      self,
      of: view, named: "EnglishMidnightLightStandardNotDownloaded")
  }
}
