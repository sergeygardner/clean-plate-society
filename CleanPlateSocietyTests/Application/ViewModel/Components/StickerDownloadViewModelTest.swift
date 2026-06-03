//
//  StickerDownloadViewModelTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 23.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

@Suite(.tags(.viewModel))
@MainActor
struct StickerDownloadViewModelTest {
  struct InputFetchImageUrls {
    let data: Data?
    let error: NetworkingErrorEnum?
    let expected: [String]
    let expectedInitialStatus: StickerDownloadView.ViewModel.LoadingStateEnum
    let expectedStatus: StickerDownloadView.ViewModel.LoadingStateEnum
    let sticker: StickerEnum
  }

  @Test(
    "fetchImageUrls",
    arguments: [
      InputFetchImageUrls(
        data: """
          ["resource/stickers/standard/index.json"]                                
          """.data(using: .utf8),
        error: nil,
        expected: ["resource/stickers/standard/index.json"],
        expectedInitialStatus: .idle,
        expectedStatus: .fetching,
        sticker: .standard
      ),
      InputFetchImageUrls(
        data: nil,
        error: .invalidStatusCode(500),
        expected: [],
        expectedInitialStatus: .idle,
        expectedStatus: .error,
        sticker: .standard
      ),
    ]
  ) func testFetchImageUrls(input: InputFetchImageUrls) async throws {
    let sut = prepareSut(data: input.data, error: input.error)

    await #expect(throws: Never.self) {
      #expect(input.expectedInitialStatus == sut.status)

      await sut.fetchImageUrls(input.sticker)

      #expect(input.expected == sut.imageURLs)
      #expect(input.expectedStatus == sut.status)
    }
  }

  struct InputFetchImageData {
    let data: Data?
    let error: NetworkingErrorEnum?
    let expected: Data?
    let expectedInitialStatus: StickerDownloadView.ViewModel.LoadingStateEnum
    let expectedStatus: StickerDownloadView.ViewModel.LoadingStateEnum
    let url: String
  }

  @Test(
    "fetchImageData",
    arguments: [
      InputFetchImageData(
        data: """
          ["resource/stickers/standard/index.json"]                                
          """.data(using: .utf8),
        error: nil,
        expected: """
          ["resource/stickers/standard/index.json"]                                
          """.data(using: .utf8),
        expectedInitialStatus: .idle,
        expectedStatus: .indexing,
        url: "resource/stickers/standard/index.json"
      ),
      InputFetchImageData(
        data: nil,
        error: .invalidStatusCode(500),
        expected: nil,
        expectedInitialStatus: .idle,
        expectedStatus: .error,
        url: "resource/stickers/standard/index.json"
      ),
    ]
  ) func testFetchImageData(input: InputFetchImageData) async throws {
    let sut = prepareSut(data: input.data, error: input.error)

    await #expect(throws: Never.self) {
      #expect(input.expectedInitialStatus == sut.status)

      let data = await sut.fetchImageData(input.url)

      #expect(input.expectedStatus == sut.status)
      #expect(input.expected == data)
    }
  }

  struct InputCompleted {
    let expected: StickerDownloadView.ViewModel.LoadingStateEnum
  }

  @Test(
    "completed",
    arguments: [
      InputCompleted(
        expected: .completed
      )
    ]
  ) func testCompleted(input: InputCompleted) async throws {
    let sut = prepareSut()

    sut.completed()

    #expect(input.expected == sut.status)
  }

  struct InputErrored {
    let expected: StickerDownloadView.ViewModel.LoadingStateEnum
  }

  @Test(
    "failed",
    arguments: [
      InputErrored(
        expected: .error
      )
    ]
  ) func testErrored(input: InputErrored) async throws {
    let sut = prepareSut()

    sut.failed()

    #expect(input.expected == sut.status)
  }

  struct InputSetStatus {
    let actualAmount: Int?
    let expected: StickerDownloadView.ViewModel.LoadingStateEnum
    let sticker: StickerEnum
  }

  @Test(
    "setStatus",
    arguments: [
      InputSetStatus(
        actualAmount: 0,
        expected: .idle,
        sticker: .standard,
      ),
      InputSetStatus(
        actualAmount: 1,
        expected: .error,
        sticker: .standard,
      ),
      InputSetStatus(
        actualAmount: nil,
        expected: .completed,
        sticker: .standard,
      ),
    ]
  ) func testSetStatus(input: InputSetStatus) async throws {
    let sut = prepareSut()

    sut.setStatus(sticker: input.sticker, actualAmount: input.actualAmount ?? input.sticker.amount)

    #expect(input.expected == sut.status)
  }

  struct InputDownload {
    let complete: () throws -> Void
    let data: Data?
    let error: NetworkingErrorEnum?
    let expected: StickerDownloadView.ViewModel.LoadingStateEnum
    let filter: (_ imageURL: String) -> Bool
    let sticker: StickerEnum
    let insert: (_ index: Int, _ imageURL: String, _ data: Data) -> Void
  }

  @Test(
    "download",
    arguments: [
      InputDownload(
        complete: {},
        data: """
          ["resource/stickers/standard/index.json"]                                
          """.data(using: .utf8),
        error: nil,
        expected: .completed,
        filter: { imageURL in
          return true
        },
        sticker: .standard,
        insert: { index, imageURL, data in

        }
      ),
      InputDownload(
        complete: {
          throw NetworkingErrorEnum.invalidStatusCode(500)
        },
        data: nil,
        error: .invalidStatusCode(500),
        expected: .error,
        filter: { imageURL in
          return true
        },
        sticker: .standard,
        insert: { index, imageURL, data in

        }
      ),
    ]
  ) func testDownload(input: InputDownload) async throws {
    let sut = prepareSut(data: input.data, error: input.error)

    await #expect(throws: Never.self) {
      await sut.download(
        complete: {
          sut.completed()
          try input.complete()
        },
        failed: {
          sut.failed()
        },
        filter: input.filter,
        insert: input.insert,
        sticker: input.sticker,
      )

      #expect(input.expected == sut.status)
    }
  }

  func prepareSut(
    data: Data? = nil,
    error: NetworkingErrorEnum? = nil,
    url: String = ""
  ) -> StickerDownloadView.ViewModel {
    return StickerDownloadView.ViewModel(
      imageRepository: ImageRepository(
        apiRepository: MockApiRepository(
          data: data,
          error: error,
          url: url,
        )
      ),
    )
  }
}
