//
//  HelloRepositoryTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 22.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

enum HelloRepositoryTypeEnum {
  case normal
  case empty
}

func helloRepositoryPrepareExpectedString(_ id: String) async -> String {
  return String(
    localized: LocalizedStringResource(
      String.LocalizationValue(id),
      table: TranslationTableEnum.hello.rawValue
    )
  )
}

func helloRepositoryPrepareArguments() async -> [HelloRepositoryTest.Input] {
  var arguments: [HelloRepositoryTest.Input] = []

  for day in 1...31 {
    await arguments.append(
      HelloRepositoryTest.Input(
        type: .normal,
        id: day,
        placeholder: "Test",
        expected: String(
          format: helloRepositoryPrepareExpectedString("day.\(day)"),
          "Test"
        )
      )
    )
    arguments.append(
      HelloRepositoryTest.Input(
        type: .empty,
        id: day,
        placeholder: "Test",
        expected: nil
      )
    )
  }

  arguments.append(
    HelloRepositoryTest.Input(
      type: .empty,
      id: -1,
      placeholder: "Test",
      expected: nil
    )
  )

  arguments.append(
    HelloRepositoryTest.Input(
      type: .empty,
      id: 0,
      placeholder: "Test",
      expected: nil
    )
  )

  arguments.append(
    HelloRepositoryTest.Input(
      type: .empty,
      id: 32,
      placeholder: "Test",
      expected: nil
    )
  )

  return arguments
}

@Suite(.tags(.repository))
@MainActor
struct HelloRepositoryTest {
  struct Input {
    let type: HelloRepositoryTypeEnum
    let id: Int
    let placeholder: String
    let expected: String?
  }

  @Test(
    "find",
    arguments: await helloRepositoryPrepareArguments()
  ) func testFind(input: Input) async throws {
    #expect(
      input.expected == prepareSut(input.type).find(id: input.id, placeholder: input.placeholder)
    )
  }

  func prepareSut(_ type: HelloRepositoryTypeEnum)
    -> HelloRepository
  {
    if type == .normal {
      return HelloRepository()
    } else {
      return HelloRepository(
        translationRepository: MockTranslationRepository()
      )
    }
  }
}
