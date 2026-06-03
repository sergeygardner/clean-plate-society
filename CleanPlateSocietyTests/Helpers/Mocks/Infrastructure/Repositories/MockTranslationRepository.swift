//
//  MockTranslationRepository.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 20.04.2026.
//

import Foundation

@testable import CleanPlateSociety

struct MockTranslationRepository: TranslationRepositoryProtocol, Sendable {
  let value: String?
  let values: [String]?

  init() {
    self.value = ""
    self.values = nil
  }

  init(value: String) {
    self.value = value
    self.values = nil
  }

  init(value: [String]) {
    self.value = nil
    self.values = value
  }

  func find(id: String, table: TranslationTableEnum) -> String {
    return value ?? values?.filter { $0 == id }.first ?? ""
  }

  func find(
    id: String,
    table: TranslationTableEnum,
    arg1: String
  ) -> String {
    return String(format: find(id: id, table: table), arg1)
  }

  func findOrEmpty(id: String, table: TranslationTableEnum) -> String? {
    let value = find(id: id, table: table)

    return value.isEmpty ? nil : value
  }

  func findOrEmpty(
    id: String,
    table: TranslationTableEnum,
    arg1: String
  ) -> String? {
    let value = find(id: id, table: table)

    return value.isEmpty ? nil : String(format: value, arg1)
  }

  func findMarkDownedOrEmpty(id: String, table: CleanPlateSociety.TranslationTableEnum)
    -> AttributedString?
  {
    if let result = findOrEmpty(id: id, table: table) {
      return try? AttributedString(markdown: result)
    }

    return nil
  }

  func findMarkDownedOrEmpty(
    id: String, table: CleanPlateSociety.TranslationTableEnum, arg1: String
  ) -> AttributedString? {
    if let result = findOrEmpty(id: id, table: table, arg1: arg1) {
      return try? AttributedString(markdown: result)
    }

    return nil
  }
}
