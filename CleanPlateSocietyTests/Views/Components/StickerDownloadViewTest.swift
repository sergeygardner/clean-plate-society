//
//  StickerDownloadViewTest.swift
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
struct StickerDownloadViewTest {
  @Test func testEnglishFormalLightStandardNotDownloadedActive() async throws {
    let view = PreviewContainerView(
      PreviewContainerView.Samples(
        sticker: PreviewContainerView.sampleEmpty
      )
    ) {
      StickerDownloadView(sticker: .standard)
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(
      self,
      of: view, named: "EnglishFormalLightStandardNotDownloadedActive")
  }

  @Test func testEnglishFormalLightStandardPartlyDownloadedActive() async throws {
    let view = PreviewContainerView(
      PreviewContainerView.Samples(
        sticker: PreviewContainerView.sampleStandardStickerHalf
      )
    ) {
      StickerDownloadView(sticker: .standard)
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(
      self,
      of: view, named: "EnglishFormalLightStandardPartlyDownloadedActive")
  }

  @Test func testEnglishFormalLightStandardDownloadedActive() async throws {
    let view = PreviewContainerView {
      StickerDownloadView(sticker: .standard)
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(
      self,
      of: view, named: "EnglishFormalLightStandardDownloadedActive")
  }

  @Test func testEnglishFormalLightBearsNotDownloadedNotActive() async throws {
    let view = PreviewContainerView(
      PreviewContainerView.Samples(
        sticker: PreviewContainerView.sampleEmpty
      )
    ) {
      StickerDownloadView(sticker: .bears)
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(
      self,
      of: view, named: "EnglishFormalLightBearsNotDownloadedNotActive")
  }

  @Test func testEnglishFormalLightBearsDownloadedNotActive() async throws {
    let view = PreviewContainerView(
      PreviewContainerView.Samples(
        sticker: PreviewContainerView.sampleBearsStickerFull
      )
    ) {
      StickerDownloadView(sticker: .bears)
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(
      self,
      of: view, named: "EnglishFormalLightBearsDownloadedNotActive")
  }
}
