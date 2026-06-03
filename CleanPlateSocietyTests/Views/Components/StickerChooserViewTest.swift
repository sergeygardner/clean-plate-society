//
//  StickerChooserViewTest.swift
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
struct StickerChooserViewTest {
  @Test func testEnglishFormalLight() async throws {
    let view = PreviewContainerView {
      StickerChooserView(sticker: .constant(StickerEnum.standard))
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLight")
  }

  @Test func testEnglishRoyalLight() async throws {
    let view = PreviewContainerView {
      StickerChooserView(sticker: .constant(StickerEnum.standard))
        .environmentObject(Profile.sampleRoyalLow)
        .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishRoyalLight")
  }

  @Test func testEnglishForestLight() async throws {
    let view = PreviewContainerView {
      StickerChooserView(sticker: .constant(StickerEnum.standard))
        .environmentObject(Profile.sampleForestLow)
        .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishForestLight")
  }

  @Test func testEnglishHarvestLight() async throws {
    let view = PreviewContainerView {
      StickerChooserView(sticker: .constant(StickerEnum.standard))
        .environmentObject(Profile.sampleHarvestLow)
        .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishHarvestLight")
  }

  @Test func testEnglishMidnightLight() async throws {
    let view = PreviewContainerView {
      StickerChooserView(sticker: .constant(StickerEnum.standard))
        .environmentObject(Profile.sampleMidnightLow)
        .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishMidnightLight")
  }

  @Test func testEnglishFormalLightForm() async throws {
    let view = PreviewContainerView {
      Form {
        StickerChooserView(sticker: .constant(StickerEnum.standard))
          .environmentObject(Profile.sampleFormalLow)
          .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLightForm")
  }

  @Test func testEnglishRoyalLightForm() async throws {
    let view = PreviewContainerView {
      Form {
        StickerChooserView(sticker: .constant(StickerEnum.standard))
          .environmentObject(Profile.sampleRoyalLow)
          .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishRoyalLightForm")
  }

  @Test func testEnglishForestLightForm() async throws {
    let view = PreviewContainerView {
      Form {
        StickerChooserView(sticker: .constant(StickerEnum.standard))
          .environmentObject(Profile.sampleForestLow)
          .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishForestLightForm")
  }

  @Test func testEnglishHarvestLightForm() async throws {
    let view = PreviewContainerView {
      Form {
        StickerChooserView(sticker: .constant(StickerEnum.standard))
          .environmentObject(Profile.sampleHarvestLow)
          .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishHarvestLightForm")
  }

  @Test func testEnglishMidnightLightForm() async throws {
    let view = PreviewContainerView {
      Form {
        StickerChooserView(sticker: .constant(StickerEnum.standard))
          .environmentObject(Profile.sampleMidnightLow)
          .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishMidnightLightForm")
  }
}
