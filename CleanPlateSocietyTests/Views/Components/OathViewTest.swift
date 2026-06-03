//
//  OathViewTest.swift
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
struct OathViewTest {
  @Test func testEnglishLightNotEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "Text")
          .environmentObject(Profile.sampleEmpty)
          .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishLightNotEmpty")
  }

  @Test func testEnglishFormalLightNotEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "Text")
          .environmentObject(Profile.sampleFormalLow)
          .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLightNotEmpty")
  }

  @Test func testEnglishRoyalLightNotEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "Text")
          .environmentObject(Profile.sampleRoyalLow)
          .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishRoyalLightNotEmpty")
  }

  @Test func testEnglishForestLightNotEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "Text")
          .environmentObject(Profile.sampleForestLow)
          .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishForestLightNotEmpty")
  }

  @Test func testEnglishHarvestLightNotEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "Text")
          .environmentObject(Profile.sampleHarvestLow)
          .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishHarvestLightNotEmpty")
  }

  @Test func testEnglishMidnightLightNotEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "Text")
          .environmentObject(Profile.sampleMidnightLow)
          .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishMidnightLightNotEmpty")
  }

  @Test func testEnglishLightEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "")
          .environmentObject(Profile.sampleEmpty)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishLightEmpty")
  }

  @Test func testEnglishFormalLightEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "")
          .environmentObject(Profile.sampleFormalLow)
          .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalLightEmpty")
  }

  @Test func testEnglishRoyalLightEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "")
          .environmentObject(Profile.sampleRoyalLow)
          .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishRoyalLightEmpty")
  }

  @Test func testEnglishForestLightEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "")
          .environmentObject(Profile.sampleForestLow)
          .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishForestLightEmpty")
  }

  @Test func testEnglishHarvestLightEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "")
          .environmentObject(Profile.sampleHarvestLow)
          .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishHarvestLightEmpty")
  }

  @Test func testEnglishMidnightLightEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "")
          .environmentObject(Profile.sampleMidnightLow)
          .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishMidnightLightEmpty")
  }

  @Test func testEnglishDarkNotEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "Text")
          .environmentObject(Profile.sampleEmpty)
          .preferredColorScheme(.dark)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishDarkNotEmpty", colorScheme: .dark)
  }

  @Test func testEnglishFormalDarkNotEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "Text")
          .environmentObject(Profile.sampleFormalLow)
          .preferredColorScheme(.dark)
      }
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishFormalDarkNotEmpty", colorScheme: .dark)
  }

  @Test func testEnglishRoyalDarkNotEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "Text")
          .environmentObject(Profile.sampleRoyalLow)
          .preferredColorScheme(.dark)
      }
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishRoyalDarkNotEmpty", colorScheme: .dark)
  }

  @Test func testEnglishForestDarkNotEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "Text")
          .environmentObject(Profile.sampleForestLow)
          .preferredColorScheme(.dark)
      }
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishForestDarkNotEmpty", colorScheme: .dark)
  }

  @Test func testEnglishHarvestDarkNotEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "Text")
          .environmentObject(Profile.sampleHarvestLow)
          .preferredColorScheme(.dark)
      }
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishHarvestDarkNotEmpty", colorScheme: .dark)
  }

  @Test func testEnglishMidnightDarkNotEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "Text")
          .environmentObject(Profile.sampleMidnightLow)
          .preferredColorScheme(.dark)
      }
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishMidnightDarkNotEmpty", colorScheme: .dark)
  }

  @Test func testEnglishDarkEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "")
          .environmentObject(Profile.sampleEmpty)
          .preferredColorScheme(.dark)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishDarkEmpty", colorScheme: .dark)
  }

  @Test func testEnglishFormalDarkEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "")
          .environmentObject(Profile.sampleFormalLow)
          .preferredColorScheme(.dark)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishFormalDarkEmpty", colorScheme: .dark)
  }

  @Test func testEnglishRoyalDarkEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "")
          .environmentObject(Profile.sampleRoyalLow)
          .preferredColorScheme(.dark)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishRoyalDarkEmpty", colorScheme: .dark)
  }

  @Test func testEnglishForestDarkEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "")
          .environmentObject(Profile.sampleForestLow)
          .preferredColorScheme(.dark)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishForestDarkEmpty", colorScheme: .dark)
  }

  @Test func testEnglishHarvestDarkEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "")
          .environmentObject(Profile.sampleHarvestLow)
          .preferredColorScheme(.dark)
      }
    }

    await assertCustomSnapshot(self, of: view, named: "EnglishHarvestDarkEmpty", colorScheme: .dark)
  }

  @Test func testEnglishMidnightDarkEmpty() async throws {
    let view = PreviewContainerView {
      Form {
        OathView(name: "")
          .environmentObject(Profile.sampleMidnightLow)
          .preferredColorScheme(.dark)
      }
    }

    await assertCustomSnapshot(
      self, of: view, named: "EnglishMidnightDarkEmpty", colorScheme: .dark)
  }
}
