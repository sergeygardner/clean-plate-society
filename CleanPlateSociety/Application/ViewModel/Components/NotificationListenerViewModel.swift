//
//  NotificationListenerViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 08.04.2026.
//

import Foundation

extension NotificationListenerView {
  @Observable
  class ViewModel {
    enum StateEnum {
      case bottom
      case top
      case hidden
    }

    var state: StateEnum
    var awardUnlocked: AwardModelDTO? = nil
    var entryReceived: EntryModelDTO? = nil
    var errorAppeared: ErrorDTO? = nil
    var nextChallengeUnlocked: String? = nil
    var serviceMessage: ServiceMessageDTO? = nil

    let awardTitleRepository: AwardTitleRepository
    let mainRepository: MainRepository
    let notificationRepository: NotificationRepository
    let profileModelDTOFactory: ProfileModelDTOFactory
    let subscriptionRepository: SubscriptionRepositoryProtocol?
    let translationRepository: TranslationRepositoryProtocol

    init(
      state: StateEnum,
      awardTitleRepository: AwardTitleRepository =
        AwardTitleRepository(),
      mainRepository: MainRepository =
        MainRepository(),
      notificationRepository: NotificationRepository =
        NotificationRepository(),
      profileModelDTOFactory: ProfileModelDTOFactory = ProfileModelDTOFactory(),
      subscriptionRepository: SubscriptionRepositoryProtocol? =
        SubscriptionRepository(),
      translationRepository: TranslationRepositoryProtocol =
        TranslationRepository(),
    ) {

      self.state = state
      self.awardTitleRepository = awardTitleRepository
      self.mainRepository = mainRepository
      self.notificationRepository = notificationRepository
      self.profileModelDTOFactory = profileModelDTOFactory
      self.subscriptionRepository = subscriptionRepository
      self.translationRepository = translationRepository
    }

    func getTitle(id: AwardEnum) -> String? {
      return awardTitleRepository.find(id: id)
    }

    func getNextChallenge() -> String? {
      return translationRepository.findOrEmpty(
        id: "next.challenge",
        table: .main
      )
    }
  }
}
