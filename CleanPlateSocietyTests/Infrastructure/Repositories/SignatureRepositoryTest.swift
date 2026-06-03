//
//  SignatureRepositoryTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 22.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

enum SignatureRepositoryTypeEnum {
  case normal
  case empty
}

func signatureRepositoryPrepareExpectedString(_ id: String) async -> String {
  return String(
    localized: LocalizedStringResource(
      String.LocalizationValue(id),
      table: TranslationTableEnum.signature.rawValue
    )
  )
}

func signatureRepositoryPrepareArguments() async -> [SignatureRepositoryTest.Input] {
  var arguments: [SignatureRepositoryTest.Input] = []

  for day in 1...31 {
    await arguments.append(
      SignatureRepositoryTest.Input(
        type: .normal,
        id: day,
        expected: signatureRepositoryPrepareExpectedString("day.\(day)")
      )
    )
    arguments.append(
      SignatureRepositoryTest.Input(
        type: .empty,
        id: day,
        expected: nil
      )
    )
  }

  arguments.append(
    SignatureRepositoryTest.Input(
      type: .empty,
      id: -1,
      expected: nil
    )
  )

  arguments.append(
    SignatureRepositoryTest.Input(
      type: .empty,
      id: 0,
      expected: nil
    )
  )

  arguments.append(
    SignatureRepositoryTest.Input(
      type: .empty,
      id: 32,
      expected: nil
    )
  )

  return arguments
}

@Suite(.tags(.repository))
@MainActor
struct SignatureRepositoryTest {
  struct Input {
    let type: SignatureRepositoryTypeEnum
    let id: Int
    let expected: String?
  }

  @Test(
    "find",
    arguments: await signatureRepositoryPrepareArguments()
  ) func testFind(input: Input) async throws {
    #expect(input.expected == prepareSut(input.type).find(id: input.id))
  }

  func prepareSut(_ type: SignatureRepositoryTypeEnum)
    -> SignatureRepository
  {
    if type == .normal {
      return SignatureRepository()
    } else {
      return SignatureRepository(
        translationRepository: MockTranslationRepository()
      )
    }
  }
}
