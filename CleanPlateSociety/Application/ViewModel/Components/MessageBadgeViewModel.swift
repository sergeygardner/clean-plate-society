//
//  MessageBadgeModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 09.04.2026.
//

import Foundation

extension MessageBadgeView {
  @Observable
  class ViewModel {
    enum TypeEnum {
      case award
      case entry
      case error
      case nextChallenge
      case serviceMessage
    }

    let translationRepository: TranslationRepositoryProtocol

    var type: TypeEnum

    init(
      type: TypeEnum,
      translationRepository: TranslationRepositoryProtocol =
        TranslationRepository()
    ) {
      self.type = type
      self.translationRepository = translationRepository
    }

    func getImageName() -> String {
      switch type {
      case .award:
        return "trophy.fill"
      case .entry:
        return "envelope"
      case .error:
        return "exclamationmark.triangle"
      case .nextChallenge:
        return "chevron.down.2"
      case .serviceMessage:
        return "info.triangle"
      }
    }

    func getTitle() -> String {
      var key: String

      switch type {
      case .award:
        key = "message.badge.title.award"
      case .entry:
        key = "message.badge.title.entry"
      case .error:
        key = "message.badge.title.error"
      case .nextChallenge:
        key = "message.badge.title.next.challenge"
      case .serviceMessage:
        key = "message.badge.title.service.message"
      }

      return translationRepository.find(id: key, table: .main)
    }
  }
}
