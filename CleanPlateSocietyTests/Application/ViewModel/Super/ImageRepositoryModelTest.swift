//
//  ImageRepositoryModelTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 21.04.2026.
//

import Testing

@testable import CleanPlateSociety

@Suite(.tags(.repository))
@MainActor
struct ImageRepositoryModelTest {
  struct Input {
    let expected: Bool
  }

  @Test(
    "init",
    arguments: [
      Input(expected: true)
    ]
  ) func testInit(input: Input) async throws {
    #expect(throws: Never.self) {
      let _ = ImageRepositoryModel()
    }
  }
}
