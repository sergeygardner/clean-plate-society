//
//  MottoRepository.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 29.03.2026.
//

import Foundation

struct MottoRepository: Sendable {
  private let table: TranslationTableEnum
  private let translationRepository: TranslationRepositoryProtocol

  init(
    table: TranslationTableEnum = TranslationTableEnum.motto,
    translationRepository: TranslationRepositoryProtocol = TranslationRepository()
  ) {
    self.table = table
    self.translationRepository = translationRepository
  }

  func find(id: Int) -> String? {
    return translationRepository.findOrEmpty(id: "day.\(id)", table: table)
  }
}
