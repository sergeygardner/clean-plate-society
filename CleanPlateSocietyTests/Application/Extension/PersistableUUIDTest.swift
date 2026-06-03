//
//  PersistableUUIDTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 21.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

func persistableUUIDPrepareArgumentsInput() async -> [PersistableUUIDTest.Input] {
  return [
    await PersistableUUIDTest.Input(
      rawValue: PersistableUUID.sampleProfileUUID.uuid.uuidString,
      expected: PersistableUUID.sampleProfileUUID
    ),
    PersistableUUIDTest.Input(
      rawValue: "",
      expected: nil
    ),
  ]
}

@Suite(.tags(.misc))
@MainActor
struct PersistableUUIDTest {
  struct Input {
    let rawValue: String
    let expected: PersistableUUID?
  }

  @Test(
    "init",
    arguments: await persistableUUIDPrepareArgumentsInput()
  ) func testInit(input: Input) async throws {
    let persistableUUID: PersistableUUID? = PersistableUUID(rawValue: input.rawValue)

    #expect(input.expected?.uuid == persistableUUID?.uuid)
    #expect(input.expected?.rawValue == persistableUUID?.rawValue)
  }
}
