//
//  ImageRepositoryTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 22.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

@Suite(.tags(.repository))
@MainActor
struct ImageRepositoryTest {
  struct InputFind {
    let data: Data?
    let error: NetworkingErrorEnum?
    let expected: StickerCollectionDTO?
    let sticker: StickerEnum
    let url: String
  }

  @Test(
    "find",
    arguments: [
      InputFind(
        data: """
          {"index": "v1/index.webp","stickers":["/resources/stickers/standard/v1/standard-1.webp"]}
          """.data(using: .utf8)!,
        error: nil,
        expected: StickerCollectionDTO(
          index: "http://local/resources/stickers/standard/v1/index.webp",
          stickers: [
            "http://local/resources/stickers/standard/standard-1.json"
          ]),
        sticker: .standard,
        url: "http://local"

      ),
      InputFind(
        data: """
                    {"index": "v1/index.webp","stickers":[]}
          """.data(using: .utf8)!,
        error: nil,
        expected: StickerCollectionDTO(
          index: "http://local/resources/stickers/standard/v1/index.webp",
          stickers: []),
        sticker: .standard,
        url: "http://local",

      ),
      InputFind(
        data: nil,
        error: .invalidStatusCode(500),
        expected: nil,
        sticker: .standard,
        url: "http://local",

      ),
    ]
  ) func testFind(input: InputFind) async throws {
    if let error = input.error {
      await #expect(throws: error) {
        try await input.expected
          == prepareSut(
            data: input.data,
            error: input.error,
            url: input.url
          )
          .find(
            sticker: input.sticker
          )
      }
    } else {
      await #expect(throws: Never.self) {
        try await input.expected
          == prepareSut(
            data: input.data,
            error: input.error,
            url: input.url
          )
          .find(
            sticker: input.sticker
          )
      }
    }
  }

  struct InputFindURLForSticker {
    let expected: String?
    let sticker: StickerEnum
    let url: String
  }

  @Test(
    "findURLForSticker",
    arguments: [
      InputFindURLForSticker(
        expected:
          "http://local/resources/stickers/standard/index.webp",
        sticker: .standard,
        url: "http://local"
      )
    ]
  ) func testFindURLForSticker(input: InputFindURLForSticker) async throws {
    let actual: String? = try? await prepareSut(url: input.url).findURLForSticker(
      sticker: input.sticker)

    #expect(
      input.expected == actual
    )
  }

  struct InputFetchData {
    let data: Data?
    let error: NetworkingErrorEnum?
    let expected: Data?
    let url: String
  }

  @Test(
    "fetchData",
    arguments: [
      InputFetchData(
        data: """
          ["/resources/stickers/standard/standard-1.json"]
          """.data(using: .utf8)!,
        error: nil,
        expected: """
          ["/resources/stickers/standard/standard-1.json"]
          """.data(using: .utf8)!,
        url: "http://local/resources/stickers/standard/standard-1.json",
      ),
      InputFetchData(
        data: """
          []
          """.data(using: .utf8)!,
        error: nil,
        expected: """
          []
          """.data(using: .utf8)!,
        url: "http://local/resources/stickers/standard/standard-1.json",

      ),
      InputFetchData(
        data: nil,
        error: .invalidStatusCode(500),
        expected: nil,
        url: "http://local/resources/stickers/standard/standard-1.json",

      ),
    ]
  ) func testFetchData(input: InputFetchData) async throws {
    if let error = input.error {
      await #expect(throws: error) {
        try await input.expected
          == prepareSut(data: input.data, error: input.error)
          .fetchData(
            input.url
          )
      }
    } else {
      await #expect(throws: Never.self) {
        try await input.expected
          == prepareSut(data: input.data, error: input.error)
          .fetchData(
            input.url
          )
      }
    }
  }

  func prepareSut(
    data: Data? = nil,
    error: NetworkingErrorEnum? = nil,
    url: String = ""
  )
    -> ImageRepository
  {
    return ImageRepository(
      apiRepository: MockApiRepository(data: data, error: error, url: url)
    )
  }
}
