//
//  AwardTtileRepositoryTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 22.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

enum AwardTitleRepositoryTypeEnum {
  case normal
  case empty
}

func awardTileRepositoryPrepareExpectedString(_ id: String) async -> String {
  return String(
    localized: LocalizedStringResource(
      String.LocalizationValue(id),
      table: TranslationTableEnum.awardTitle.rawValue
    )
  )
}

@Suite(.tags(.repository))
@MainActor
struct AwardTileRepositoryTest {
  struct Input {
    let type: AwardTitleRepositoryTypeEnum
    let id: AwardEnum
    let expected: String?
  }

  @Test(
    "find",
    arguments: [
      Input(
        type: .normal,
        id: .level1,
        expected: await awardTileRepositoryPrepareExpectedString(AwardEnum.level1.name)
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

  func prepareSut(_ type: AwardTitleRepositoryTypeEnum)
    -> AwardTitleRepository
  {
    if type == .normal {
      return AwardTitleRepository()
    } else {
      return AwardTitleRepository(
        translationRepository: MockTranslationRepository()
      )
    }
  }
}
