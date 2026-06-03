//
//  ApiRepositoryTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 19.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

let apiBaseUrl = "http://api.local"
let apiErrorBaseUrl = "error://"

//@Suite(.serialized)
@Suite(.tags(.repository))
@MainActor
struct ApiRepositoryTest {
  struct InputWithBaseURL {
    let apiBaseUrl: Any?
    let expectedUrl: String
    let url: String
  }

  func urlSession() -> URLSession {
    let configuration = URLSessionConfiguration.default
    configuration.protocolClasses = [MockURLProtocol.self]

    return URLSession.init(configuration: configuration)
  }

  @Test(
    "withBaseURL",
    arguments: [
      InputWithBaseURL(
        apiBaseUrl: apiBaseUrl,
        expectedUrl:
          "\(apiBaseUrl)/resource/stickers/standards/info.json",
        url: "/resource/stickers/standards/info.json"
      ),
      InputWithBaseURL(
        apiBaseUrl: apiBaseUrl,
        expectedUrl:
          "\(apiBaseUrl)/resource/stickers/standards/info.json?21415436526",
        url: "/resource/stickers/standards/info.json?21415436526"
      ),
      InputWithBaseURL(
        apiBaseUrl: apiBaseUrl,
        expectedUrl: apiBaseUrl,
        url: ""
      ),
      InputWithBaseURL(
        apiBaseUrl: nil,
        expectedUrl: "error://warning",
        url: "warning"
      ),

    ]
  )
  func testWithBaseURL(input: InputWithBaseURL) {
    let apiRepository = ApiRepository(apiBaseUrl: input.apiBaseUrl)
    let url = apiRepository.withBaseURL(input.url)

    #expect(input.expectedUrl == url)
  }

  struct InputGet {
    enum TypeEnum {
      case success
      case wrongStatusCode
      case network
      case other
    }

    let apiBaseUrl: String = "/resource/stickers/standards/index.json"
    let expectedData: Data = """
      [
         "/resource/stickers/standards/standards-1.png"
      ]
      """.data(using: .utf8)!
    let url: String = "/resource/stickers/standards/index.json"
    let statusCode: Int
    let expectedError: NetworkingErrorEnum?
    let type: TypeEnum

    static func getUrlError() -> URLError {
      return URLError(.notConnectedToInternet)
    }
  }

  @Test(
    "get",
    arguments: [
      InputGet(
        statusCode: 200,
        expectedError: nil,
        type: .success
      ),
      InputGet(
        statusCode: 301,
        expectedError: .invalidStatusCode(301),
        type: .wrongStatusCode
      ),
      InputGet(
        statusCode: 500,
        expectedError: .invalidStatusCode(-1),
        type: .network
      ),
      InputGet(
        statusCode: 500,
        expectedError: .otherError(InputGet.getUrlError()),
        type: .other
      ),
    ]
  )
  func testGet(input: InputGet) async {
    let apiRepository = ApiRepository(
      apiBaseUrl: input.apiBaseUrl,
      urlSession: urlSession()
    )

    MockURLProtocol.requestHandler = { request in
      guard let url = request.url,
        url == URL(string: apiRepository.withBaseURL(input.url))
      else {
        throw NetworkingErrorEnum.undefinedError
      }

      switch input.type {
      case .success, .wrongStatusCode:
        return (
          HTTPURLResponse(
            url: url,
            statusCode: input.statusCode,
            httpVersion: nil,
            headerFields: nil
          ),
          input.expectedData
        )
      case .network:
        return (
          URLResponse(
            url: url,
            mimeType: nil,
            expectedContentLength: 0,
            textEncodingName: nil
          ),
          nil
        )
      case .other:
        throw InputGet.getUrlError()
      }
    }

    if let error = input.expectedError {
      await #expect(throws: error.self) {
        try await apiRepository.get(url: input.url)
      }
    } else {
      await #expect(throws: Never.self) {
        let data = try await apiRepository.get(url: input.url)

        #expect(input.expectedData == data)
      }
    }
  }

  struct InputGetApiBaseUrl {
    let expected: String
    let apiBaseUrl: String
  }

  @Test(
    "getApiBaseUrl",
    arguments: [
      InputGetApiBaseUrl(
        expected: "http://local",
        apiBaseUrl: "http://local"
      ),
      InputGetApiBaseUrl(
        expected: "https://local",
        apiBaseUrl: "https://local"
      ),
    ]
  ) func testGetApiBaseUrl(input: InputGetApiBaseUrl) async throws {
    let apiRepository = ApiRepository(
      apiBaseUrl: input.apiBaseUrl,
      urlSession: urlSession()
    )

    #expect(
      input.expected == apiRepository.getApiBaseUrl()
    )
  }
}
