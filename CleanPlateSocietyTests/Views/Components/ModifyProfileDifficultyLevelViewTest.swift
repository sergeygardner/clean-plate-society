//
//  ModifyProfileDifficultyLevelViewTest.swift
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
struct ModifyProfileDifficultyLevelViewTest {
  @Test func testEnglishFormalLightDisabled() async throws {
    let view = PreviewContainerView {
      Form {
        ModifyProfileDifficultyLevelView(
          difficultyLevel: .constant(DifficultyLevelEnum.low),
          disabled: true
        )
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLightDisabled")
  }

  @Test func testEnglishFormalLightNotDisabled() async throws {
    let view = PreviewContainerView {
      Form {
        ModifyProfileDifficultyLevelView(
          difficultyLevel: .constant(DifficultyLevelEnum.low),
          disabled: false
        )
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLightNotDisabled")
  }

  @Test func testEnglishRoyalLightNotDisabled() async throws {
    let view = PreviewContainerView {
      Form {
        ModifyProfileDifficultyLevelView(
          difficultyLevel: .constant(DifficultyLevelEnum.low),
          disabled: false
        )
        .environmentObject(Profile.sampleRoyalLow)
        .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishRoyalLightNotDisabled")
  }

  @Test func testEnglishForestLightNotDisabled() async throws {
    let view = PreviewContainerView {
      Form {
        ModifyProfileDifficultyLevelView(
          difficultyLevel: .constant(DifficultyLevelEnum.low),
          disabled: false
        )
        .environmentObject(Profile.sampleForestLow)
        .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishForestLightNotDisabled")
  }

  @Test func testEnglishHarvestLightNotDisabled() async throws {
    let view = PreviewContainerView {
      Form {
        ModifyProfileDifficultyLevelView(
          difficultyLevel: .constant(DifficultyLevelEnum.low),
          disabled: false
        )
        .environmentObject(Profile.sampleHarvestLow)
        .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishHarvestLightNotDisabled")
  }

  @Test func testEnglishMidnightLightNotDisabled() async throws {
    let view = PreviewContainerView {
      Form {
        ModifyProfileDifficultyLevelView(
          difficultyLevel: .constant(DifficultyLevelEnum.low),
          disabled: false
        )
        .environmentObject(Profile.sampleMidnightLow)
        .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishMidnightLightNotDisabled")
  }

  @Test func testEnglishFormalDarkDisabled() async throws {
    let view = PreviewContainerView {
      Form {
        ModifyProfileDifficultyLevelView(
          difficultyLevel: .constant(DifficultyLevelEnum.low),
          disabled: true
        )
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.dark)
      }
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishFormalDarkDisabled", colorScheme: .dark)
  }

  @Test func testEnglishFormalDarkNotDisabled() async throws {
    let view = PreviewContainerView {
      Form {
        ModifyProfileDifficultyLevelView(
          difficultyLevel: .constant(DifficultyLevelEnum.low),
          disabled: false
        )
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.dark)
      }
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishFormalDarkNotDisabled", colorScheme: .dark)
  }

  @Test func testEnglishRoyalDarkNotDisabled() async throws {
    let view = PreviewContainerView {
      Form {
        ModifyProfileDifficultyLevelView(
          difficultyLevel: .constant(DifficultyLevelEnum.low),
          disabled: false
        )
        .environmentObject(Profile.sampleRoyalLow)
        .preferredColorScheme(.dark)
      }
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishRoyalDarkNotDisabled", colorScheme: .dark)
  }

  @Test func testEnglishForestDarkNotDisabled() async throws {
    let view = PreviewContainerView {
      Form {
        ModifyProfileDifficultyLevelView(
          difficultyLevel: .constant(DifficultyLevelEnum.low),
          disabled: false
        )
        .environmentObject(Profile.sampleForestLow)
        .preferredColorScheme(.dark)
      }
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishForestDarkNotDisabled", colorScheme: .dark)
  }

  @Test func testEnglishHarvestDarkNotDisabled() async throws {
    let view = PreviewContainerView {
      Form {
        ModifyProfileDifficultyLevelView(
          difficultyLevel: .constant(DifficultyLevelEnum.low),
          disabled: false
        )
        .environmentObject(Profile.sampleHarvestLow)
        .preferredColorScheme(.dark)
      }
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishHarvestDarkNotDisabled", colorScheme: .dark)
  }

  @Test func testEnglishMidnightDarkNotDisabled() async throws {
    let view = PreviewContainerView {
      Form {
        ModifyProfileDifficultyLevelView(
          difficultyLevel: .constant(DifficultyLevelEnum.low),
          disabled: false
        )
        .environmentObject(Profile.sampleMidnightLow)
        .preferredColorScheme(.dark)
      }
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishMidnightDarkNotDisabled", colorScheme: .dark)
  }
}
