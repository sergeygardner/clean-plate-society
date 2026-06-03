//
//  NextAppointmentSection1Repository.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 29.03.2026.
//

import Foundation

struct NextAppointmentSection1Repository: Sendable {
  private let table: TranslationTableEnum
  private let translationRepository: TranslationRepositoryProtocol

  init(
    table: TranslationTableEnum = TranslationTableEnum.nextAppointmentSection1,
    translationRepository: TranslationRepositoryProtocol = TranslationRepository()
  ) {
    self.table = table
    self.translationRepository = translationRepository
  }

  func find(id: Int) -> String? {
    return translationRepository.findOrEmpty(id: "section1.\(id)", table: table)
  }
}
