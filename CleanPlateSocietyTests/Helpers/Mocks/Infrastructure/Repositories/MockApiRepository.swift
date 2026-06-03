//
//  MockApiRepository.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 23.04.2026.
//

import Foundation

@testable import CleanPlateSociety

class MockApiRepository: ApiRepositoryProtocol {
  let data: Data?
  let error: NetworkingErrorEnum?
  let url: String

  init(data: Data?, error: NetworkingErrorEnum? = nil, url: String = "") {
    self.data = data
    self.error = error
    self.url = url
  }

  func getApiBaseUrl() -> String {
    return self.url
  }

  func withBaseURL(_ url: String) -> String {
    return self.url + url
  }

  func get(url: String) async throws(NetworkingErrorEnum) -> Data {
    if error != nil {
      throw error!
    }

    return data!
  }
}
