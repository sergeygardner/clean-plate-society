//
//  MessageBadgeViewModelTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 20.04.2026.
//

import Foundation
import SwiftUI
import Testing

@testable import CleanPlateSociety

func messageBadgeViewModelPrepareExpectedString(_ id: String) async -> String {
  return String(
    localized: LocalizedStringResource(
      String.LocalizationValue(id),
      table: TranslationTableEnum.main.rawValue
    )
  )
}

@Suite(.tags(.viewModel))
@MainActor
struct MessageBadgeViewModelTest {
  struct Input {
    let type: MessageBadgeView<EmptyView>.ViewModel.TypeEnum
    let expectedImageName: String
    let expectedTitle: String
  }

  @Test(
    "find",
    arguments: [
      Input(
        type: .award,
        expectedImageName: "trophy.fill",
        expectedTitle: await messageBadgeViewModelPrepareExpectedString(
          "message.badge.title.award"
        ),
      ),
      Input(
        type: .entry,
        expectedImageName: "envelope",
        expectedTitle: await messageBadgeViewModelPrepareExpectedString(
          "message.badge.title.entry"
        ),
      ),
      Input(
        type: .nextChallenge,
        expectedImageName: "chevron.down.2",
        expectedTitle: await messageBadgeViewModelPrepareExpectedString(
          "message.badge.title.next.challenge"
        ),
      ),
    ]
  )
  func find(input: Input) throws {
    let sut = MessageBadgeView<EmptyView>.ViewModel(
      type: input.type,
    )

    #expect(input.expectedImageName == sut.getImageName())
    #expect(input.expectedTitle == sut.getTitle())
  }
}
