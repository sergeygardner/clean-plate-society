//
//  TranslationRepository.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 30.03.2026.
//

import Foundation

protocol TranslationRepositoryProtocol: Sendable {
  func find(id: String, table: TranslationTableEnum) -> String

  func find(
    id: String,
    table: TranslationTableEnum,
    arg1: String
  ) -> String

  func findOrEmpty(
    id: String,
    table: TranslationTableEnum
  ) -> String?

  func findOrEmpty(
    id: String,
    table: TranslationTableEnum,
    arg1: String
  ) -> String?

  func findMarkDownedOrEmpty(
    id: String,
    table: TranslationTableEnum
  ) -> AttributedString?

  func findMarkDownedOrEmpty(
    id: String,
    table: TranslationTableEnum,
    arg1: String
  ) -> AttributedString?
}

struct TranslationRepository: TranslationRepositoryProtocol, Sendable {
  func find(id: String, table: TranslationTableEnum) -> String {
    return String(
      localized: LocalizedStringResource(
        String.LocalizationValue(id),
        table: table.rawValue
      )
    )
  }

  func find(
    id: String,
    table: TranslationTableEnum,
    arg1: String
  ) -> String {
    return String(
      format: find(id: id, table: table),
      arg1
    )
  }

  func findOrEmpty(
    id: String,
    table: TranslationTableEnum
  ) -> String? {
    let result: String = find(id: id, table: table)

    return result.isEmpty ? nil : result
  }

  func findOrEmpty(
    id: String,
    table: TranslationTableEnum,
    arg1: String
  ) -> String? {
    let result: String = find(id: id, table: table, arg1: arg1)

    return result.isEmpty ? nil : result
  }

  func findMarkDownedOrEmpty(
    id: String,
    table: TranslationTableEnum
  ) -> AttributedString? {
    if let result = findOrEmpty(id: id, table: table),
      let result = try? AttributedString(markdown: result)
    {
      return result
    }

    return nil
  }

  func findMarkDownedOrEmpty(
    id: String,
    table: TranslationTableEnum,
    arg1: String
  ) -> AttributedString? {
    if let result = findOrEmpty(id: id, table: table, arg1: arg1),
      let result = try? AttributedString(markdown: result)
    {
      return result
    }

    return nil
  }
}
