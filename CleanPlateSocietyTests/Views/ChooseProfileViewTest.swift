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
struct ChooseProfileViewTest {
  @Test func testEnglishFormalLightWithoutData() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      NavigationStack {
        ChooseProfileView()
          .sharedNavigation()
      }
      .environmentObject(Profile.sampleEmpty)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLightWithoutData")
  }

  @Test func testEnglishFormalLightWithData() async throws {
    let view = PreviewContainerView {
      NavigationStack {
        ChooseProfileView()
          .sharedNavigation()
      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLightWithData")
  }
}
