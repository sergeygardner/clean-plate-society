//
//  ChancellorSealViewModelTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 20.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

@Suite(.tags(.viewModel))
@MainActor
struct ChancellorSealViewModelTest {
  struct Input {
    let value: String
    let expectedName: [String]
  }

  @Test(
    "getName",
    arguments: [
      Input(
        value: "The Clean Plate Society",
        expectedName: "The Clean Plate Society".map { String($0) }.enumerated().map { $0.element }
      ),
      Input(value: "", expectedName: []),
    ]
  )
  func testGetName(input: Input) async throws {
    let sut = ChancellorSealView.ViewModel(
      societyRepository: SocietyRepository(
        table: .society,
        translationRepository: MockTranslationRepository(
          value: input.value
        )
      )
    )

    #expect(input.expectedName == sut.getName().enumerated().map { String($0.element.element) })
  }

}
