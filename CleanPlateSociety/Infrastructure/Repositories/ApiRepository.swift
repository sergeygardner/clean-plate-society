//
//  ApiRepository.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 20.03.2026.
//

import Foundation

protocol ApiRepositoryProtocol {
  func getApiBaseUrl() -> String

  func withBaseURL(_ url: String) -> String

  func get(url: String) async throws(NetworkingErrorEnum) -> Data
}

class ApiRepository: ApiRepositoryProtocol {
  private(set) var apiBaseUrl: String
  private(set) var urlSession: URLSession

  init(
    apiBaseUrl: Any? = Bundle.main.object(
      forInfoDictionaryKey: "API_BASE_URL"
    ),
    urlSession: URLSession = URLSession.shared
  ) {
    if let apiBaseUrlConverted = apiBaseUrl as? String {
      self.apiBaseUrl = apiBaseUrlConverted
    } else {
      self.apiBaseUrl = "error://"
    }

    self.urlSession = urlSession
  }

  func getApiBaseUrl() -> String {
    return apiBaseUrl
  }

  func withBaseURL(_ url: String) -> String {
    return apiBaseUrl + url
  }

  func get(url: String) async throws(NetworkingErrorEnum) -> Data {
    do {
      guard let preparedUrl = URL(string: url) else {
        throw NetworkingErrorEnum.undefinedError
      }
      let request: URLRequest = URLRequest(url: preparedUrl)
      let (data, response): (Data, URLResponse) = try await urlSession.data(
        for: request
      )

      guard let statusCode = (response as? HTTPURLResponse)?.statusCode
      else {
        throw NetworkingErrorEnum.invalidStatusCode(-1)
      }

      guard (200...299).contains(statusCode) else {
        throw NetworkingErrorEnum.invalidStatusCode(statusCode)
      }

      return data
    } catch let error as NetworkingErrorEnum {
      throw error
    } catch {
      throw .otherError(error)
    }
  }
}
