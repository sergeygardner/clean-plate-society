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
struct ModifyProfileViewTest {
  @Test func testEnglishWithoutData() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      ModifyProfileView(new: true)
        .environmentObject(Profile.sampleEmpty)
        .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishWithoutData")
  }

  @Test func testEnglishFormalLightWithData() async throws {
    let view = PreviewContainerView {
      ModifyProfileView(new: false)
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLightWithData")
  }
}
