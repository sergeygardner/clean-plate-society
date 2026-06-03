//
//  NotificationListenerViewModelTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 23.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

enum NotificationListenerViewModelTypeEnum {
  case normal
  case empty
}

func notificationListenerViewModelPrepareExpectedString(
  _ id: String,
  _ table: TranslationTableEnum
) async -> String {
  return String(
    localized: LocalizedStringResource(
      String.LocalizationValue(id),
      table: table.rawValue
    )
  )
}

@Suite(.tags(.viewModel))
@MainActor
struct NotificationListenerViewModelTest {
  struct InputGetTitle {
    let expected: String?
    let id: AwardEnum
    let type: NotificationListenerViewModelTypeEnum
  }
  @Test(
    "getTitle",
    arguments: [
      InputGetTitle(
        expected: await notificationListenerViewModelPrepareExpectedString(
          AwardEnum.level1.name,
          .awardTitle
        ),
        id: .level1,
        type: .normal,
      ),
      InputGetTitle(
        expected: nil,
        id: .level1,
        type: .empty,
      ),
    ]
  ) func testGetTitle(input: InputGetTitle) async throws {
    #expect(input.expected == prepareSut(input.type).getTitle(id: input.id))
  }

  struct InputGetNextChallenge {
    let expected: String?
    let type: NotificationListenerViewModelTypeEnum
  }
  @Test(
    "getNextChallenge",
    arguments: [
      InputGetNextChallenge(
        expected: await notificationListenerViewModelPrepareExpectedString(
          "next.challenge",
          .main
        ),
        type: .normal,
      ),
      InputGetNextChallenge(
        expected: nil,
        type: .empty,
      ),
    ]
  ) func testGetNextChallenge(input: InputGetNextChallenge) async throws {
    #expect(input.expected == prepareSut(input.type).getNextChallenge())
  }

  func prepareSut(_ type: NotificationListenerViewModelTypeEnum)
    -> NotificationListenerView.ViewModel
  {
    if type == .normal {
      return NotificationListenerView.ViewModel(state: .top)
    } else {
      return NotificationListenerView.ViewModel(
        state: .top,
        awardTitleRepository: AwardTitleRepository(
          translationRepository: MockTranslationRepository()
        ),
        translationRepository: MockTranslationRepository()
      )
    }
  }
}
