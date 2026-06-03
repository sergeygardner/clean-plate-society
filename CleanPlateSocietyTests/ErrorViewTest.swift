//
//  ChooseProfileViewTest.swift
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
struct ErrorViewTest {
  @Test func testEnglishLight() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      ErrorView(error: .core(URLError(.unknown))) {

      }
      .environmentObject(Profile.sampleEmpty)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishLight")
  }
  @Test func testEnglishFormalLight() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      ErrorView(error: .core(URLError(.unknown))) {

      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLight")
  }
  @Test func testEnglishRoyalLight() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      ErrorView(error: .core(URLError(.unknown))) {

      }
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishRoyalLight")
  }
  @Test func testEnglishForestLight() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      ErrorView(error: .core(URLError(.unknown))) {

      }
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishForestLight")
  }
  @Test func testEnglishHarvestLight() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      ErrorView(error: .core(URLError(.unknown))) {

      }
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishHarvestLight")
  }
  @Test func testEnglishMidnightLight() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      ErrorView(error: .core(URLError(.unknown))) {

      }
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishMidnightLight")
  }
  @Test func testEnglishDark() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      ErrorView(error: .core(URLError(.unknown))) {

      }
      .environmentObject(Profile.sampleEmpty)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishDark", colorScheme: .dark)
  }
  @Test func testEnglishFormalDark() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      ErrorView(error: .core(URLError(.unknown))) {

      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalDark", colorScheme: .dark)
  }
  @Test func testEnglishRoyalDark() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      ErrorView(error: .core(URLError(.unknown))) {

      }
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishRoyalDark", colorScheme: .dark)
  }
  @Test func testEnglishForestDark() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      ErrorView(error: .core(URLError(.unknown))) {

      }
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishForestDark", colorScheme: .dark)
  }
  @Test func testEnglishHarvestDark() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      ErrorView(error: .core(URLError(.unknown))) {

      }
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishHarvestDark", colorScheme: .dark)
  }
  @Test func testEnglishMidnightDark() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      ErrorView(error: .core(URLError(.unknown))) {

      }
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishMidnightDark", colorScheme: .dark)
  }
}
