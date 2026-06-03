//
//  AwardTagRepository.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 29.03.2026.
//

import Foundation

struct AwardTagRepository: Sendable {
  private let table: TranslationTableEnum
  private let translationRepository: TranslationRepositoryProtocol

  init(
    table: TranslationTableEnum = TranslationTableEnum.awardTag,
    translationRepository: TranslationRepositoryProtocol = TranslationRepository()
  ) {
    self.table = table
    self.translationRepository = translationRepository
  }

  func find(id: String) -> String? {
    return translationRepository.findOrEmpty(id: id, table: table)
  }
}
