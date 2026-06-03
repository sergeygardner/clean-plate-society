//
//  StickerViewTest.swift
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
struct StickerViewTest {
  @Test func testEnglishFormalLightStandardDownloadedChoosen() async throws {
    let view = PreviewContainerView {
      NavigationStack {
        StickerView(sticker: .standard) {
          Text("Content")
            .fontTheme(.body)
            .foregroundStyleTheme(.text)
        }
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(
      self,
      of: view, named: "EnglishFormalLightStandardDownloadedChoosen")
  }

  @Test func testEnglishFormalLightStandardNotDownloadedChoosen() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      NavigationStack {
        StickerView(sticker: .standard) {
          Text("Content")
            .fontTheme(.body)
            .foregroundStyleTheme(.text)
        }
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(
      self,
      of: view, named: "EnglishFormalLightStandardNotDownloadedChoosen")
  }

  @Test func testEnglishFormalLightBearsDownloadedNotChoosen() async throws {
    let view = PreviewContainerView {
      NavigationStack {
        StickerView(sticker: .bears) {
          Text("Content")
            .fontTheme(.body)
            .foregroundStyleTheme(.text)
        }
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(
      self,
      of: view, named: "EnglishFormalLightBearsDownloadedNotChoosen")
  }

  @Test func testEnglishFormalLightBearsNotDownloadedNotChoosen() async throws {
    let view = PreviewContainerView(PreviewContainerView.Samples.empty) {
      NavigationStack {
        StickerView(sticker: .bears) {
          Text("Content")
            .fontTheme(.body)
            .foregroundStyleTheme(.text)
        }
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
      }
    }

    await assertCustomSnapshot(
      self,
      of: view, named: "EnglishFormalLightBearsNotDownloadedNotChoosen")
  }
}
