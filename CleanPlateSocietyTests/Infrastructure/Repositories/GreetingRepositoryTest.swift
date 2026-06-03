//
//  GreetingRepositoryTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 22.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

enum GreetingRepositoryTypeEnum {
  case normal
  case empty
}

func greetingRepositoryPrepareExpectedString(_ id: String) async -> String {
  return String(
    localized: LocalizedStringResource(
      String.LocalizationValue(id),
      table: TranslationTableEnum.greeting.rawValue
    )
  )
}

func greetingRepositoryPrepareArguments() async -> [GreetingRepositoryTest.Input] {
  var arguments: [GreetingRepositoryTest.Input] = []

  for day in 1...366 {
    await arguments.append(
      GreetingRepositoryTest.Input(
        type: .normal,
        id: day,
        expected: greetingRepositoryPrepareExpectedString("day.\(day)")
      )
    )
    arguments.append(
      GreetingRepositoryTest.Input(
        type: .empty,
        id: day,
        expected: nil
      )
    )
  }

  arguments.append(
    GreetingRepositoryTest.Input(
      type: .empty,
      id: -1,
      expected: nil
    )
  )

  arguments.append(
    GreetingRepositoryTest.Input(
      type: .empty,
      id: 0,
      expected: nil
    )
  )

  arguments.append(
    GreetingRepositoryTest.Input(
      type: .empty,
      id: 367,
      expected: nil
    )
  )

  return arguments
}

@Suite(.tags(.repository))
@MainActor
struct GreetingRepositoryTest {
  struct Input {
    let type: GreetingRepositoryTypeEnum
    let id: Int
    let expected: String?
  }

  @Test(
    "find",
    arguments: await greetingRepositoryPrepareArguments()
  ) func testFind(input: Input) async throws {
    #expect(input.expected == prepareSut(input.type).find(id: input.id))
  }

  func prepareSut(_ type: GreetingRepositoryTypeEnum)
    -> GreetingRepository
  {
    if type == .normal {
      return GreetingRepository()
    } else {
      return GreetingRepository(
        translationRepository: MockTranslationRepository()
      )
    }
  }
}
