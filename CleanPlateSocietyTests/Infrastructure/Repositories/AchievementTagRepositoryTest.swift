//
//  AwardTagRepositoryTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 22.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

enum AwardTagRepositoryTypeEnum {
  case normal
  case empty
}

func awardTagRepositoryPrepareExpectedString(_ id: String) async -> String {
  return String(
    localized: LocalizedStringResource(
      String.LocalizationValue(id),
      table: TranslationTableEnum.awardTag.rawValue
    )
  )
}

@MainActor
func awardTagRepositoryPrepareArgumentsInput() async -> [AwardTagRepositoryTest.Input] {
  return [
    AwardTagRepositoryTest.Input(
      type: .normal,
      id: AwardEnum.level1.tags.first!,
      expected: await awardTagRepositoryPrepareExpectedString(
        AwardEnum.level1.tags.first!)
    ),
    AwardTagRepositoryTest.Input(
      type: .empty,
      id: AwardEnum.level1.tags.first!,
      expected: nil
    ),
  ]
}

@Suite(.tags(.repository))
@MainActor
struct AwardTagRepositoryTest {
  struct Input {
    let type: AwardTagRepositoryTypeEnum
    let id: String
    let expected: String?
  }

  @Test(
    "find",
    arguments: await awardTagRepositoryPrepareArgumentsInput()
  ) func testFind(input: Input) async throws {
    #expect(input.expected == prepareSut(input.type).find(id: input.id))
  }

  func prepareSut(_ type: AwardTagRepositoryTypeEnum)
    -> AwardTagRepository
  {
    if type == .normal {
      return AwardTagRepository()
    } else {
      return AwardTagRepository(
        translationRepository: MockTranslationRepository()
      )
    }
  }
}
