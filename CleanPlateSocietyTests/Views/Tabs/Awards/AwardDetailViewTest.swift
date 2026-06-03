//
//  AwardDetailViewTest.swift
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
struct AwardDetailViewTest {
  @Test func testEnglishFormalLightAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: getAwardModel(),
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLightAchieved")
  }

  @Test func testEnglishRoyalLightAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: getAwardModel(),
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishRoyalLightAchieved")
  }

  @Test func testEnglishForestLightAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: getAwardModel(),
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishForestLightAchieved")
  }

  @Test func testEnglishHarvestLightAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: getAwardModel(),
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishHarvestLightAchieved")
  }

  @Test func testEnglishMidnightLightAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: getAwardModel(),
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishMidnightLightAchieved")
  }

  @Test func testEnglishFormalLightNotAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: nil,
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLightNotAchieved")
  }

  @Test func testEnglishRoyalLightNotAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: nil,
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishRoyalLightNotAchieved")
  }

  @Test func testEnglishForestLightNotAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: nil,
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishForestLightNotAchieved")
  }

  @Test func testEnglishHarvestLightNotAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: nil,
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishHarvestLightNotAchieved")
  }

  @Test func testEnglishMidnightLightNotAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: nil,
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.light)
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishMidnightLightNotAchieved")
  }

  @Test func testEnglishFormalDarkAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: getAwardModel(),
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishFormalDarkAchieved", colorScheme: .dark)
  }

  @Test func testEnglishRoyalDarkAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: getAwardModel(),
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishRoyalDarkAchieved", colorScheme: .dark)
  }

  @Test func testEnglishForestDarkAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: getAwardModel(),
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishForestDarkAchieved", colorScheme: .dark)
  }

  @Test func testEnglishHarvestDarkAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: getAwardModel(),
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishHarvestDarkAchieved", colorScheme: .dark)
  }

  @Test func testEnglishMidnightDarkAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: getAwardModel(),
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishMidnightDarkAchieved", colorScheme: .dark)
  }

  @Test func testEnglishFormalDarkNotAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: nil,
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishFormalDarkNotAchieved", colorScheme: .dark)
  }

  @Test func testEnglishRoyalDarkNotAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: nil,
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishRoyalDarkNotAchieved", colorScheme: .dark)
  }

  @Test func testEnglishForestDarkNotAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: nil,
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishForestDarkNotAchieved", colorScheme: .dark)
  }

  @Test func testEnglishHarvestDarkNotAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: nil,
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishHarvestDarkNotAchieved", colorScheme: .dark)
  }

  @Test func testEnglishMidnightDarkNotAchieved() async throws {
    let view = PreviewContainerView {
      AwardDetailView(
        award: AwardEnum.level1,
        awardModel: nil,
        name: Profile.sampleFormalLow.profileModel!.name
      )
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.dark)
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishMidnightDarkNotAchieved", colorScheme: .dark)
  }

  func getAwardModel() -> AwardModel {
    let date: Date = Date.snapshotReferenceDate ?? Date.timeZonedNow
    let awardModel: AwardModel = AwardModel.generateSampleData(
      stickers: [.standard], awards: [.level1], date: date)[0]

    return awardModel
  }
}
