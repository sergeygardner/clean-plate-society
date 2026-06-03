//
//  ChancellorSealViewModelTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 20.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

class SpyClass {
  var executed: Int = 0

  func increase() {
    executed += 1
  }

  func reset() {
    executed = 0
  }
}

let spy = SpyClass()

@Suite(.tags(.viewModel))
struct ChancellorAppointmentViewModelTest {

  static func prepareArguments() -> [Input] {

    return [
      Input(
        command: {
          spy.increase()
        }, expected: 1),
      Input(command: {}, expected: 0),
    ]
  }

  struct Input {
    let command: () -> Void
    let expected: Int
  }

  @Test(
    "command",
    arguments: prepareArguments()
  )
  @MainActor func testCommand(input: Input) async throws {
    let sut = ChancellorAppointmentView.ViewModel {
      input.command()
    }

    spy.reset()

    sut.command()

    #expect(input.expected == spy.executed)
  }
}
