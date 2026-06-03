//
//  LinkRepository.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 20.03.2026.
//

import Foundation

protocol LinkRepositoryProtocol {
  func getBaseUrl() -> String
}

class LinkRepository: LinkRepositoryProtocol {
  private(set) var baseUrl: String

  init(
    baseUrl: Any? = Bundle.main.object(
      forInfoDictionaryKey: "BASE_URL"
    ),
  ) {
    if let baseUrlConverted = baseUrl as? String {
      self.baseUrl = baseUrlConverted
    } else {
      self.baseUrl = "error://"
    }
  }

  func getBaseUrl() -> String {
    return baseUrl
  }

  func getPrivacyPolicyUrl() -> String {
    return baseUrl + "/privacy.policy"
  }

  func getSupportUrl() -> String {
    return baseUrl + "/support"
  }

  func getTermsOfUsageUrl() -> String {
    return baseUrl + "/terms.of.use"
  }
}
