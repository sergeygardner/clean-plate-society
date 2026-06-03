//
//  Notifications.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 05.03.2026.
//

import Foundation

extension Notification.Name {
  static let awardUnlocked: Notification.Name = Notification.Name("awardUnlocked")
  static let entryReceived: Notification.Name = Notification.Name("entryReceived")
  static let error: Notification.Name = Notification.Name("error")
  static let nextChallengeUnlocked: Notification.Name = Notification.Name("nextChallengeUnlocked")
  static let serviceMessage: Notification.Name = Notification.Name("serviceMessage")
  static let settingsUpdated: Notification.Name = Notification.Name("settingsUpdated")
  static let subscriptionUpdated: Notification.Name = Notification.Name("subscriptionUpdated")
}
