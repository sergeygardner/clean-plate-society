//
//  NetworkingErrorEnumTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 21.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

enum OtherErrorEnum: Error {
  case other
  case another
}

func getEncodingError(_ doubled: Bool = false) -> EncodingError? {
  do {
    if doubled {
      let _ = try JSONEncoder().encode(Double.nan)
    } else {
      let _ = try JSONEncoder().encode(CGFloat.infinity)
    }

    return nil
  } catch {
    return error as? EncodingError
  }
}

func getDecodingError(_ doubled: Bool = false) -> DecodingError? {
  do {
    if doubled {
      let _ = try JSONDecoder().decode(Double.self, from: "{.}".data(using: .utf8)!)
    } else {
      let _ = try JSONDecoder().decode(CGFloat.self, from: "{}".data(using: .utf8)!)
    }

    return nil
  } catch {
    return error as? DecodingError
  }
}

@Suite(.tags(.misc))
struct NetworkingErrorEnumTest {
  struct Input {
    let lhs: NetworkingErrorEnum
    let rhs: NetworkingErrorEnum
    let expected: Bool
  }

  @Test(
    "equality",
    arguments: [
      Input(
        lhs: .encodingFailed(getEncodingError()!),
        rhs: .encodingFailed(getEncodingError()!),
        expected: true,
      ),
      Input(
        lhs: .encodingFailed(getEncodingError()!),
        rhs: .encodingFailed(getEncodingError(true)!),
        expected: false,
      ),
      Input(
        lhs: .decodingFailed(getDecodingError()!),
        rhs: .decodingFailed(getDecodingError()!),
        expected: true,
      ),
      Input(
        lhs: .decodingFailed(getDecodingError()!),
        rhs: .decodingFailed(getDecodingError(true)!),
        expected: false,
      ),
      Input(
        lhs: .invalidStatusCode(201),
        rhs: .invalidStatusCode(201),
        expected: true,
      ),
      Input(
        lhs: .invalidStatusCode(200),
        rhs: .invalidStatusCode(302),
        expected: false,
      ),
      Input(
        lhs: .requestFailed(URLError(.unknown)),
        rhs: .requestFailed(URLError(.unknown)),
        expected: true,
      ),
      Input(
        lhs: .requestFailed(URLError(.badURL)),
        rhs: .requestFailed(URLError(.badServerResponse)),
        expected: false,
      ),
      Input(
        lhs: .otherError(OtherErrorEnum.other),
        rhs: .otherError(OtherErrorEnum.other),
        expected: true,
      ),
      Input(
        lhs: .otherError(OtherErrorEnum.other),
        rhs: .otherError(OtherErrorEnum.another),
        expected: false,
      ),
      Input(
        lhs: .undefinedError,
        rhs: .undefinedError,
        expected: true,
      ),
      Input(
        lhs: .undefinedError,
        rhs: .otherError(OtherErrorEnum.other),
        expected: false,
      ),
    ]
  ) func testEquality(input: Input) async throws {
    #expect(input.expected == (input.lhs == input.rhs))
  }

}
