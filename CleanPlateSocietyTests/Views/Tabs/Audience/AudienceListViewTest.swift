//
//  AudienceListViewTest.swift
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
struct AudienceListViewTest {
  @Test func testEnglishFormalLightWithData() async throws {
    let view = PreviewContainerView {
      NavigationStack {
        AudienceListView(
          viewModel: AudienceView.ViewModel(),
          sticker: StickerEnum.standard,
          profileModelDTO: Profile.sampleFormalLow.profileModelDTO!,
          useScrollTransition: true,
          asyncScrolling: false,
          testing: true,
        ) { index, width, height in
          let _ = print("\(index)")
        }
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
        AudienceListView(
          viewModel: AudienceView.ViewModel(),
          sticker: StickerEnum.standard,
          profileModelDTO: Profile.sampleFormalLow.profileModelDTO!,
          useScrollTransition: true,
          asyncScrolling: false,
          testing: true,
        ) { index, width, height in
          let _ = print("\(index)")
        }
      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLightWithAlmostData")
  }

  @Test func testEnglishFormalLightWithHalfData() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.entryHalf) {
      NavigationStack {
        AudienceListView(
          viewModel: AudienceView.ViewModel(),
          sticker: StickerEnum.standard,
          profileModelDTO: Profile.sampleFormalLow.profileModelDTO!,
          useScrollTransition: true,
          asyncScrolling: false,
          testing: true,
        ) { index, width, height in
          let _ = print("\(index)")
        }
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
        AudienceListView(
          viewModel: AudienceView.ViewModel(),
          sticker: StickerEnum.standard,
          profileModelDTO: Profile.sampleFormalLow.profileModelDTO!,
          useScrollTransition: true,
          asyncScrolling: false,
          testing: true,
        ) { index, width, height in
          let _ = print("\(index)")
        }
      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(
      self,
      of: view, named: "EnglishFormalLightWithAlmdostDataUnlockedAward")
  }

  @Test func testEnglishFormalLightWithoutData() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      NavigationStack {
        AudienceListView(
          viewModel: AudienceView.ViewModel(),
          sticker: StickerEnum.standard,
          profileModelDTO: Profile.sampleFormalLow.profileModelDTO!,
          useScrollTransition: true,
          asyncScrolling: false,
          testing: true,
        ) { index, width, height in
          let _ = print("\(index)")
        }
      }

      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLightWithoutData")
  }

  @Test func testEnglishFormalDarkWithData() async throws {
    let view = PreviewContainerView {
      NavigationStack {
        AudienceListView(
          viewModel: AudienceView.ViewModel(),
          sticker: StickerEnum.standard,
          profileModelDTO: Profile.sampleFormalLow.profileModelDTO!,
          useScrollTransition: true,
          asyncScrolling: false,
          testing: true,
        ) { index, width, height in
          let _ = print("\(index)")
        }
      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishFormalDarkWithData", colorScheme: .dark)
  }

  @Test func testEnglishFormalDarkWithoutData() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      NavigationStack {
        AudienceListView(
          viewModel: AudienceView.ViewModel(),
          sticker: StickerEnum.standard,
          profileModelDTO: Profile.sampleFormalLow.profileModelDTO!,
          useScrollTransition: true,
          asyncScrolling: false,
          testing: true,
        ) { index, width, height in
          let _ = print("\(index)")
        }
      }

      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishFormalDarkWithoutData", colorScheme: .dark)
  }
}
