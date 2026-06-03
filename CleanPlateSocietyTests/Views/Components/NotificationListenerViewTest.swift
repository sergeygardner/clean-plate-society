//
//  NotificationListenerViewTest.swift
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
struct NotificationListenerViewTest {
  @Test func testEnglishFormalLightBottomNextChallenge() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      VStack {

      }
      .overlay(alignment: .bottom) {
        NotificationListenerView(state: .bottom)
          .environmentObject(Profile.sampleFormalLow)
          .preferredColorScheme(.light)
          .onAppear {
            NotificationRepository().send(
              nextChallenge: true
            )
          }
      }
    }

    await assertCustomSnapshot(
      self,
      of: view,
      named: "EnglishFormalLightBottomNextChallenge",
      waitFor: 5
    )
  }

  @Test func testEnglishRoyalLightNextChallenge() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      VStack {

      }
      .overlay(alignment: .bottom) {
        NotificationListenerView(state: .bottom)
          .environmentObject(Profile.sampleRoyalLow)
          .preferredColorScheme(.light)
          .onAppear {
            NotificationRepository().send(
              nextChallenge: true
            )
          }
      }
    }

    await assertCustomSnapshot(
      self,
      of: view,
      named: "EnglishRoyalLightNextChallenge"
    )
  }

  @Test func testEnglishForestLightNextChallenge() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      VStack {

      }
      .overlay(alignment: .bottom) {
        NotificationListenerView(state: .bottom)
          .environmentObject(Profile.sampleForestLow)
          .preferredColorScheme(.light)
          .onAppear {
            NotificationRepository().send(
              nextChallenge: true
            )
          }
      }
    }

    await assertCustomSnapshot(
      self,
      of: view,
      named: "EnglishForestLightNextChallenge"
    )
  }

  @Test func testEnglishHarvestLightNextChallenge() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      VStack {

      }
      .overlay(alignment: .bottom) {
        NotificationListenerView(state: .bottom)
          .environmentObject(Profile.sampleHarvestLow)
          .preferredColorScheme(.light)
          .onAppear {
            NotificationRepository().send(
              nextChallenge: true
            )
          }
      }
    }

    await assertCustomSnapshot(
      self,
      of: view,
      named: "EnglishHarvestLightNextChallenge"
    )
  }

  @Test func testEnglishMidnightLightNextChallenge() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      VStack {

      }
      .overlay(alignment: .bottom) {
        NotificationListenerView(state: .bottom)
          .environmentObject(Profile.sampleMidnightLow)
          .preferredColorScheme(.light)
          .onAppear {
            NotificationRepository().send(
              nextChallenge: true
            )
          }
      }
    }

    await assertCustomSnapshot(
      self,
      of: view,
      named: "EnglishMidnightLightNextChallenge"
    )
  }

  @Test func testEnglishFormalLightTopAward() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      VStack {

      }
      .overlay(alignment: .bottom) {
        NotificationListenerView(state: .top)
          .environmentObject(Profile.sampleFormalLow)
          .preferredColorScheme(.light)
          .onAppear {
            NotificationRepository().send(
              awardModelDTO: AwardModelDTOFactory().fromModel(
                AwardModel.sampleData.first!
              )
            )
          }
      }
    }

    await assertCustomSnapshot(
      self,
      of: view,
      named: "EnglishFormalLightTopAward"
    )
  }

  @Test func testEnglishRoyalLightTopAward() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      VStack {

      }
      .overlay(alignment: .bottom) {
        NotificationListenerView(state: .top)
          .environmentObject(Profile.sampleRoyalLow)
          .preferredColorScheme(.light)
          .onAppear {
            NotificationRepository().send(
              awardModelDTO: AwardModelDTOFactory().fromModel(
                AwardModel.sampleData.first!
              )
            )
          }
      }
    }

    await assertCustomSnapshot(
      self,
      of: view,
      named: "EnglishRoyalLightTopAward"
    )
  }

  @Test func testEnglishForestLightTopAward() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      VStack {

      }
      .overlay(alignment: .bottom) {
        NotificationListenerView(state: .top)
          .environmentObject(Profile.sampleForestLow)
          .preferredColorScheme(.light)
          .onAppear {
            NotificationRepository().send(
              awardModelDTO: AwardModelDTOFactory().fromModel(
                AwardModel.sampleData.first!
              )
            )
          }
      }
    }

    await assertCustomSnapshot(
      self,
      of: view,
      named: "EnglishForestLightTopAward"
    )
  }

  @Test func testEnglishHarvestLightTopAward() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      VStack {

      }
      .overlay(alignment: .bottom) {
        NotificationListenerView(state: .top)
          .environmentObject(Profile.sampleHarvestLow)
          .preferredColorScheme(.light)
          .onAppear {
            NotificationRepository().send(
              awardModelDTO: AwardModelDTOFactory().fromModel(
                AwardModel.sampleData.first!
              )
            )
          }
      }
    }

    await assertCustomSnapshot(
      self,
      of: view,
      named: "EnglishHarvestLightTopAward"
    )
  }

  @Test func testEnglishMidnightLightTopAward() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      VStack {

      }
      .overlay(alignment: .bottom) {
        NotificationListenerView(state: .top)
          .environmentObject(Profile.sampleMidnightLow)
          .preferredColorScheme(.light)
          .onAppear {
            NotificationRepository().send(
              awardModelDTO: AwardModelDTOFactory().fromModel(
                AwardModel.sampleData.first!
              )
            )
          }
      }
    }

    await assertCustomSnapshot(
      self,
      of: view,
      named: "EnglishMidnightLightTopAward"
    )
  }

  @Test func testEnglishFormalLightTopEntry() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      VStack {

      }
      .overlay(alignment: .bottom) {
        NotificationListenerView(state: .top)
          .environmentObject(Profile.sampleFormalLow)
          .preferredColorScheme(.light)
          .onAppear {
            NotificationRepository().send(
              entryModelDTO: EntryModelDTOFactory().fromModel(
                EntryModel.sampleData.first!
              )
            )
          }
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLightTopEntry")
  }

  @Test func testEnglishRoyalLightTopEntry() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      VStack {

      }
      .overlay(alignment: .bottom) {
        NotificationListenerView(state: .top)
          .environmentObject(Profile.sampleRoyalLow)
          .preferredColorScheme(.light)
          .onAppear {
            NotificationRepository().send(
              entryModelDTO: EntryModelDTOFactory().fromModel(
                EntryModel.sampleData.first!
              )
            )
          }
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishRoyalLightTopEntry")
  }

  @Test func testEnglishForestLightTopEntry() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      VStack {

      }
      .overlay(alignment: .bottom) {
        NotificationListenerView(state: .top)
          .environmentObject(Profile.sampleForestLow)
          .preferredColorScheme(.light)
          .onAppear {
            NotificationRepository().send(
              entryModelDTO: EntryModelDTOFactory().fromModel(
                EntryModel.sampleData.first!
              )
            )
          }
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishForestLightTopEntry")
  }

  @Test func testEnglishHarvestLightTopEntry() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      VStack {

      }
      .overlay(alignment: .bottom) {
        NotificationListenerView(state: .top)
          .environmentObject(Profile.sampleHarvestLow)
          .preferredColorScheme(.light)
          .onAppear {
            NotificationRepository().send(
              entryModelDTO: EntryModelDTOFactory().fromModel(
                EntryModel.sampleData.first!
              )
            )
          }
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishHarvestLightTopEntry")
  }

  @Test func testEnglishMidnightLightTopEntry() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      VStack {

      }
      .overlay(alignment: .bottom) {
        NotificationListenerView(state: .top)
          .environmentObject(Profile.sampleMidnightLow)
          .preferredColorScheme(.light)
          .onAppear {
            NotificationRepository().send(
              entryModelDTO: EntryModelDTOFactory().fromModel(
                EntryModel.sampleData.first!
              )
            )
          }
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishMidnightLightTopEntry")
  }
}
