//
//  AwardDescriptionRepositoryTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 22.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

enum AwardDescriptionRepositoryTypeEnum {
  case normal
  case empty
}

func awardTtileRepositoryPrepareExpectedString(_ id: String) async -> String {
  return String(
    localized: LocalizedStringResource(
      String.LocalizationValue(id),
      table: TranslationTableEnum.awardDescription.rawValue
    )
  )
}

@Suite(.tags(.repository))
@MainActor
struct AwardDescriptionRepositoryTest {
  struct Input {
    let type: AwardDescriptionRepositoryTypeEnum
    let id: AwardEnum
    let expected: String?
  }

  @Test(
    "find",
    arguments: [
      Input(
        type: .normal,
        id: .level1,
        expected: await awardTtileRepositoryPrepareExpectedString(AwardEnum.level1.name)
      ),
      Input(
        type: .empty,
        id: .level1,
        expected: nil
      ),
    ]
  ) func testFind(input: Input) async throws {
    #expect(input.expected == prepareSut(input.type).find(id: input.id))
  }

  func prepareSut(_ type: AwardDescriptionRepositoryTypeEnum)
    -> AwardDescriptionRepository
  {
    if type == .normal {
      return AwardDescriptionRepository()
    } else {
      return AwardDescriptionRepository(
        translationRepository: MockTranslationRepository()
      )
    }
  }
}
