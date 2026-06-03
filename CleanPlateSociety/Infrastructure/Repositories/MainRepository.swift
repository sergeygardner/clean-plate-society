//
//  MainRepository.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 29.03.2026.
//

import Foundation

struct MainRepository: Sendable {
  private let table: TranslationTableEnum
  private let translationRepository: TranslationRepositoryProtocol

  init(
    table: TranslationTableEnum = TranslationTableEnum.main,
    translationRepository: TranslationRepositoryProtocol = TranslationRepository()
  ) {
    self.table = table
    self.translationRepository = translationRepository
  }

  func getEntryTitleAt(date: Date) -> String? {
    return find(id: "entry.at", placeholder: date.formatted(.dateTime.hour().minute()))
  }

  func getOathText(name: String) -> AttributedString? {
    return findMarkDowned(id: "settings.oath.text", placeholder: name)
  }

  func clearCache() -> String? {
    return find(id: "message.clear.cache")
  }

  func tabButton(_ id: String) -> String? {
    return find(id: id)
  }

  func getPurchaseMessage() -> String? {
    return find(id: "message.purchase.subscription")
  }

  func getRestoreMessage() -> String? {
    return find(id: "message.restore.subscription")
  }

  func getRestoreNothingMessage() -> String? {
    return find(id: "message.restore.nothing.subscription")
  }

  private func find(id: String, placeholder: String) -> String? {
    return translationRepository.findOrEmpty(id: id, table: table, arg1: placeholder)
  }

  private func find(id: String) -> String? {
    return translationRepository.findOrEmpty(id: id, table: table)
  }

  private func findMarkDowned(id: String, placeholder: String) -> AttributedString? {
    return translationRepository.findMarkDownedOrEmpty(id: id, table: table, arg1: placeholder)
  }
}
