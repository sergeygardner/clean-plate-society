//
//  AudienceViewTest.swift
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
struct AudienceViewTest {
  @Test func testEnglishFormalLightWithData() async throws {
    let view = PreviewContainerView {
      NavigationStack {
        AudienceView(
          profileModelDTO: Profile.sampleFormalLow.profileModelDTO!,
          sticker: StickerEnum.standard,
          useScrollTransition: true,
          asyncScrolling: false,
          testing: true,
        )
      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLightWithData")
  }

  @Test func testEnglishFormalLightWithAlmostData() async throws {
    let view = PreviewContainerView(
      PreviewContainerView.Samples(
        entry: PreviewContainerView.sampleEntryAlmost
      )
    ) {
      NavigationStack {
        AudienceView(
          profileModelDTO: Profile.sampleFormalLow.profileModelDTO!,
          sticker: StickerEnum.standard,
          useScrollTransition: false,
          asyncScrolling: false,
          testing: true,
        )
      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLightWithAlmostData")
  }

  @Test func testEnglishFormalLightWithHalfData() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.entryHalf) {
      NavigationStack {
        AudienceView(
          profileModelDTO: Profile.sampleFormalLow.profileModelDTO!,
          sticker: StickerEnum.standard,
          useScrollTransition: false,
          asyncScrolling: false,
          testing: true,
        )
      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLightWithHalfData")
  }

  @Test func testEnglishFormalLightWithAlmdostDataUnlockedAward() async throws {
    let view = PreviewContainerView(
      PreviewContainerView.Samples(
        award: PreviewContainerView.Sample(
          from: 0,
          to: 8,
        ),
        entry: PreviewContainerView.Sample(
          from: EntryModel.sampleData.count
            - AwardEnum.level10.requirement,
          to: EntryModel.sampleData.count - 2,
        ),
      )
    ) {
      NavigationStack {
        AudienceView(
          profileModelDTO: Profile.sampleFormalLow.profileModelDTO!,
          sticker: StickerEnum.standard,
          useScrollTransition: false,
          asyncScrolling: false,
          testing: true,
        )
      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(
      self,
      of: view, named: "EnglishFormalLightWithAlmdostDataUnlockedAward")
  }

  @Test func testEnglishFormalDarkWithData() async throws {
    let view = PreviewContainerView {
      NavigationStack {
        AudienceView(
          profileModelDTO: Profile.sampleFormalLow.profileModelDTO!,
          sticker: StickerEnum.standard,
          useScrollTransition: false,
          asyncScrolling: false,
          testing: true,
        )
      }

      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishFormalDarkWithData", colorScheme: .dark)
  }

  @Test func testEnglishFormalDarkWithoutData() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.entryEmpty) {
      NavigationStack {
        AudienceView(
          profileModelDTO: Profile.sampleFormalLow.profileModelDTO!,
          sticker: StickerEnum.standard,
          useScrollTransition: false,
          asyncScrolling: false,
          testing: true,
        )
      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishFormalDarkWithoutData", colorScheme: .dark)
  }
}
