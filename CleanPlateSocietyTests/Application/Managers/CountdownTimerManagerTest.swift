//
//  CountdownTimerManagerTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 28.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

@Suite(.tags(.misc))
@MainActor
struct CountdownTimerManagerTest {
  struct InputFormat {
    let expected: [String]
    let remaining: TimeInterval
  }

  @Test(
    "testFormat",
    arguments: [
      InputFormat(
        expected: ["00:00:05", "00:00:04", "00:00:03", "00:00:02", "00:00:01"],
        remaining: 5
      )
    ]
  ) func testFormat(input: InputFormat) async throws {
    let countdownTimerManager = CountdownTimerManager(remaining: input.remaining)

    for expected in input.expected {
      if let remainingText = countdownTimerManager.format() {
        #expect(expected == remainingText)
      } else {
        #expect(countdownTimerManager.remaining == 0)
      }

      try await Task.sleep(for: .seconds(1.0))
    }
  }

  struct InputStop {
    let expected: [String]
    let remaining: TimeInterval
    let stopAt: String
  }

  @Test(
    "testStop",
    arguments: [
      InputStop(
        expected: ["00:00:05", "00:00:04", "00:00:03", "00:00:03", "00:00:03"],
        remaining: 5,
        stopAt: "00:00:03"
      )
    ]
  ) func testStop(input: InputStop) async throws {
    let countdownTimerManager = CountdownTimerManager(remaining: input.remaining)

    for expected in input.expected {
      if expected == input.stopAt {
        countdownTimerManager.stop()
      }

      if let remainingText = countdownTimerManager.format() {
        #expect(expected == remainingText)
      } else {
        #expect(countdownTimerManager.remaining == 0)
      }

      try await Task.sleep(for: .seconds(1.0))
    }
  }

  struct InputRestart {
    let expected: [String]
    let remaining: TimeInterval
    let restartAt: String
  }

  @Test(
    "testRestart",
    arguments: [
      InputRestart(
        expected: ["00:00:05", "00:00:04", "00:00:03", "00:00:02", "00:00:01"],
        remaining: 5,
        restartAt: "00:00:03"
      )
    ]
  ) func testRestart(input: InputRestart) async throws {
    let countdownTimerManager = CountdownTimerManager(remaining: input.remaining)

    for expected in input.expected {
      if expected == input.restartAt {
        countdownTimerManager.restart()
      }

      if let remainingText = countdownTimerManager.format() {
        #expect(expected == remainingText)
      } else {
        #expect(countdownTimerManager.remaining == 0)
      }

      try await Task.sleep(for: .seconds(1.0))
    }
  }

  struct InputStart {
    let expected: [String]
    let remaining: TimeInterval
    let startAt: String
  }

  @Test(
    "testStart",
    arguments: [
      InputStart(
        expected: ["00:00:05", "00:00:04", "00:00:03", "00:00:03", "00:00:02", "00:00:01"],
        remaining: 5,
        startAt: "00:00:03"
      )
    ]
  ) func testStart(input: InputStart) async throws {
    let countdownTimerManager = CountdownTimerManager(remaining: input.remaining)
    var isStopped: Bool = false

    for expected in input.expected {
      if expected == input.startAt {
        if isStopped {
          countdownTimerManager.start()
        } else {
          countdownTimerManager.stop()

          isStopped = true
        }
      }

      if let remainingText = countdownTimerManager.format() {
        #expect(expected == remainingText)
      } else {
        #expect(countdownTimerManager.remaining == 0)
      }

      try await Task.sleep(for: .seconds(1.0))
    }
  }
}
