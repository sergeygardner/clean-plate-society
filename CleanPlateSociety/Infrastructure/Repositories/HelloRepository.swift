//
//  HelloRepository.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 29.03.2026.
//

import Foundation

struct HelloRepository: Sendable {
  private let table: TranslationTableEnum
  private let translationRepository: TranslationRepositoryProtocol

  init(
    table: TranslationTableEnum = TranslationTableEnum.hello,
    translationRepository: TranslationRepositoryProtocol = TranslationRepository()
  ) {
    self.table = table
    self.translationRepository = translationRepository
  }

  func find(id: Int, placeholder: String) -> String? {
    return translationRepository.findOrEmpty(id: "day.\(id)", table: table, arg1: placeholder)
  }

  func findMarkDowned(id: Int, placeholder: String) -> AttributedString? {
    return translationRepository.findMarkDownedOrEmpty(
      id: "day.\(id)", table: table, arg1: placeholder)
  }
}
