//
//  DataContainerTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 20.04.2026.
//

import Testing

@testable import CleanPlateSociety

@Suite(.tags(.repository))
struct DataContainerTest {
  struct Input {
    let expectedError: DataContainer.DataError?
  }

  @Test(
    "init",
  ) @MainActor func testInit() async throws {
    #expect(throws: Never.self) {
      switch DataContainer.shared {
      case .success:
        print("all good")
      case .failure(let error):
        throw error
      }

      switch DataContainer.previewShared {
      case .success:
        print("all good")
      case .failure(let error):
        throw error
      }
    }
  }
}
