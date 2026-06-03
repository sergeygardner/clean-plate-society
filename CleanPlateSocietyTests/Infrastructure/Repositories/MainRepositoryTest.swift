//
//  MainRepositoryTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 22.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

enum MainRepositoryTypeEnum {
  case normal
  case empty
}

func mainRepositoryPrepareExpectedString(_ id: String) async -> String {
  return String(
    localized: LocalizedStringResource(
      String.LocalizationValue(id),
      table: TranslationTableEnum.main.rawValue
    )
  )
}

@Suite(.tags(.repository))
@MainActor
struct MainRepositoryTest {
  struct InputGetEntryTitleAt {
    let type: MainRepositoryTypeEnum
    let date: Date
    let expected: String?
  }

  @Test(
    "getEntryTitleAt",
    arguments: [
      InputGetEntryTitleAt(
        type: .normal,
        date: Date.timeZonedNow.startOfDay,
        expected: String(
          format: await mainRepositoryPrepareExpectedString("entry.at"),
          Date.timeZonedNow.startOfDay.formatted(
            .dateTime.hour().minute()
          )
        )
      ),
      InputGetEntryTitleAt(
        type: .empty,
        date: Date.timeZonedNow.startOfDay,
        expected: nil
      ),
    ]
  ) func testGetEntryTitleAt(input: InputGetEntryTitleAt) async throws {
    #expect(
      input.expected == prepareSut(input.type).getEntryTitleAt(date: input.date)
    )
  }

  struct InputGetOathText {
    let type: MainRepositoryTypeEnum
    let name: String
    let expected: AttributedString?
  }

  @Test(
    "getOathText",
    arguments: [
      InputGetOathText(
        type: .normal,
        name: "Test",
        expected: try? AttributedString(
          markdown: String(
            format: await mainRepositoryPrepareExpectedString(
              "settings.oath.text"
            ),
            "Test"
          )
        )
      ),
      InputGetOathText(type: .empty, name: "Test", expected: nil),
    ]
  ) func testGetOathText(input: InputGetOathText) async throws {
    #expect(
      input.expected == prepareSut(input.type).getOathText(name: input.name)
    )
  }

  func prepareSut(_ type: MainRepositoryTypeEnum)
    -> MainRepository
  {
    if type == .normal {
      return MainRepository()
    } else {
      return MainRepository(
        translationRepository: MockTranslationRepository()
      )
    }
  }
}
