//
//  AwardSectionRepositoryTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 22.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

enum AwardSectionRepositoryTypeEnum {
  case normal
  case empty
}

func awardSectionRepositoryPrepareExpectedString(_ id: String) async -> String {
  return String(
    localized: LocalizedStringResource(
      String.LocalizationValue(id),
      table: TranslationTableEnum.awardSection.rawValue
    )
  )
}

@MainActor
func awardSectionRepositoryPrepareArgumentsInput() async -> [AwardSectionRepositoryTest
  .Input]
{
  return [
    AwardSectionRepositoryTest.Input(
      type: .normal,
      id: AwardEnum.level1.section,
      expected: await awardSectionRepositoryPrepareExpectedString(
        AwardEnum.level1.section)
    ),
    AwardSectionRepositoryTest.Input(
      type: .empty,
      id: AwardEnum.level1.section,
      expected: nil
    ),
  ]
}

@Suite(.tags(.repository))
@MainActor
struct AwardSectionRepositoryTest {
  struct Input {
    let type: AwardSectionRepositoryTypeEnum
    let id: String
    let expected: String?
  }

  @Test(
    "find",
    arguments: await awardSectionRepositoryPrepareArgumentsInput()
  ) func testFind(input: Input) async throws {
    #expect(input.expected == prepareSut(input.type).find(id: input.id))
  }

  func prepareSut(_ type: AwardSectionRepositoryTypeEnum)
    -> AwardSectionRepository
  {
    if type == .normal {
      return AwardSectionRepository()
    } else {
      return AwardSectionRepository(
        translationRepository: MockTranslationRepository()
      )
    }
  }
}
