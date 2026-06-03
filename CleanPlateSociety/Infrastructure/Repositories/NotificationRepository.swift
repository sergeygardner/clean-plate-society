//
//  NotificationRepository.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 29.03.2026.
//

import Combine
import Foundation

protocol NotificationProvider {
  func publisher(for name: Notification.Name) -> AnyPublisher<
    Notification, Never
  >
  func post(
    name aName: NSNotification.Name,
    object anObject: Any?,
  )
}

class NotificationRepository {
  enum OnReceiveEnum {
    case awardUnlocked
    case entryReceived
    case errorAppeared
    case nextChallengeUnlocked
    case serviceMessage
    case settingsUpdated
    case subscriptionUpdated
  }

  private let notificationCenter: NotificationProvider

  init(notificationCenter: NotificationProvider = NotificationCenter.default) {
    self.notificationCenter = notificationCenter
  }

  func onReceive(_ onReceive: OnReceiveEnum) -> AnyPublisher<Notification, Never> {
    switch onReceive {
    case .awardUnlocked:
      return notificationCenter.publisher(for: .awardUnlocked)
    case .entryReceived:
      return notificationCenter.publisher(for: .entryReceived)
    case .errorAppeared:
      return notificationCenter.publisher(for: .entryReceived)
    case .nextChallengeUnlocked:
      return notificationCenter.publisher(for: .nextChallengeUnlocked)
    case .serviceMessage:
      return notificationCenter.publisher(for: .serviceMessage)
    case .settingsUpdated:
      return notificationCenter.publisher(for: .settingsUpdated)
    case .subscriptionUpdated:
      return notificationCenter.publisher(for: .subscriptionUpdated)
    }
  }

  func send(awardModelDTO: AwardModelDTO) {
    notificationCenter.post(
      name: .awardUnlocked,
      object: awardModelDTO,
    )
  }

  func send(entryModelDTO: EntryModelDTO) {
    notificationCenter.post(
      name: .entryReceived,
      object: entryModelDTO,
    )
  }

  func send(serviceMessage: ServiceMessageDTO) {
    notificationCenter.post(
      name: .serviceMessage,
      object: serviceMessage,
    )
  }

  func send(nextChallenge: Bool) {
    notificationCenter.post(
      name: .nextChallengeUnlocked,
      object: nextChallenge,
    )
  }

  func send(profileModelDTO: ProfileModelDTO) {
    notificationCenter.post(
      name: .settingsUpdated,
      object: profileModelDTO,
    )
  }

  func send(subscriptionUpdatedDTO: SubscriptionUpdatedDTO) {
    notificationCenter.post(
      name: .subscriptionUpdated,
      object: subscriptionUpdatedDTO,
    )
  }

  func send(errorDTO: ErrorDTO) {
    notificationCenter.post(
      name: .error,
      object: errorDTO,
    )
  }
}

extension NotificationCenter: NotificationProvider {
  public func publisher(for name: Notification.Name) -> AnyPublisher<
    Notification, Never
  > {
    return self.publisher(for: name, object: nil).eraseToAnyPublisher()
  }
}
