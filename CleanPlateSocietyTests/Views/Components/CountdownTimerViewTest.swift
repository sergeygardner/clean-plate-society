//
//  CountdownTimerViewTest.swift
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
struct CountdownTimerViewTest {
  @Test func testEnglishFormalLight100() async throws {
    let view = CountdownTimerView(remaining: 100)
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLight100")
  }

  @Test func testEnglishRoyalLight100() async throws {
    let view = CountdownTimerView(remaining: 100)
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.light)

    await assertCustomSnapshot(self, of: view, named: "EnglishRoyalLight100")
  }

  @Test func testEnglishForestLight100() async throws {
    let view = CountdownTimerView(remaining: 100)
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.light)

    await assertCustomSnapshot(self, of: view, named: "EnglishForestLight100")
  }

  @Test func testEnglishHarvestLight100() async throws {
    let view = CountdownTimerView(remaining: 100)
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.light)

    await assertCustomSnapshot(self, of: view, named: "EnglishHarvestLight100")
  }

  @Test func testEnglishMidnightLight100() async throws {
    let view = CountdownTimerView(remaining: 100)
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.light)

    await assertCustomSnapshot(self, of: view, named: "EnglishMidnightLight100")
  }
}
