//
//  MottoRepositoryTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 22.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

enum MottoRepositoryTypeEnum {
  case normal
  case empty
}

func mottoRepositoryPrepareExpectedString(_ id: String) async -> String {
  return String(
    localized: LocalizedStringResource(
      String.LocalizationValue(id),
      table: TranslationTableEnum.motto.rawValue
    )
  )
}

func mottoRepositoryPrepareArguments() async -> [MottoRepositoryTest.Input] {
  var arguments: [MottoRepositoryTest.Input] = []

  for day in 1...366 {
    await arguments.append(
      MottoRepositoryTest.Input(
        type: .normal,
        id: day,
        expected: mottoRepositoryPrepareExpectedString("day.\(day)")
      )
    )
    arguments.append(
      MottoRepositoryTest.Input(
        type: .empty,
        id: day,
        expected: nil
      )
    )
  }

  arguments.append(
    MottoRepositoryTest.Input(
      type: .empty,
      id: -1,
      expected: nil
    )
  )

  arguments.append(
    MottoRepositoryTest.Input(
      type: .empty,
      id: 0,
      expected: nil
    )
  )

  arguments.append(
    MottoRepositoryTest.Input(
      type: .empty,
      id: 367,
      expected: nil
    )
  )

  return arguments
}

@Suite(.tags(.repository))
@MainActor
struct MottoRepositoryTest {
  struct Input {
    let type: MottoRepositoryTypeEnum
    let id: Int
    let expected: String?
  }

  @Test(
    "find",
    arguments: await mottoRepositoryPrepareArguments()
  ) func testFind(input: Input) async throws {
    #expect(input.expected == prepareSut(input.type).find(id: input.id))
  }

  func prepareSut(_ type: MottoRepositoryTypeEnum)
    -> MottoRepository
  {
    if type == .normal {
      return MottoRepository()
    } else {
      return MottoRepository(
        translationRepository: MockTranslationRepository()
      )
    }
  }
}
