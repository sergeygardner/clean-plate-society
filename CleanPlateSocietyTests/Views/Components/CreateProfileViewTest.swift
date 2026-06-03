//
//  CreateProfileViewTest.swift
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
struct CreateProfileViewTest {
  @Test func testEnglishLightEmpty() async throws {
    let view = PreviewContainerView {
      NavigationStack {
        CreateProfileView(
          amount: 0,
        )
      }
      .environmentObject(Profile.sampleEmpty)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishLightEmpty")
  }

  @Test func testEnglishFormalLight() async throws {
    let view = PreviewContainerView {
      NavigationStack {
        CreateProfileView(
          amount: 1,
        )
      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLight")
  }

  @Test func testEnglishRoyalLight() async throws {
    let view = PreviewContainerView {
      NavigationStack {
        CreateProfileView(
          amount: 1,
        )
      }
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishRoyalLight")
  }

  @Test func testEnglishForestLight() async throws {
    let view = PreviewContainerView {
      NavigationStack {
        CreateProfileView(
          amount: 1,
        )
      }
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishForestLight")
  }

  @Test func testEnglishHarvestLight() async throws {
    let view = PreviewContainerView {
      NavigationStack {
        CreateProfileView(
          amount: 1,
        )
      }
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishHarvestLight")
  }

  @Test func testEnglishMidnightLight() async throws {
    let view = PreviewContainerView {
      NavigationStack {
        CreateProfileView(
          amount: 1,
        )
      }
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishMidnightLight")
  }
}
