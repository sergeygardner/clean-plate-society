//
//  MockNotificationCenter.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 22.04.2026.
//

import Combine
import Foundation

@testable import CleanPlateSociety

final class MockNotificationCenter: NotificationProvider {
  struct Sent {
    let name: NSNotification.Name
    let object: Any?
  }

  var published: [Notification.Name] = []
  var sent: [Sent] = []

  func publisher(for name: Notification.Name) -> AnyPublisher<
    Notification, Never
  > {
    published.append(name)

    return NotificationCenter.default.publisher(for: name)
  }
  func post(
    name aName: NSNotification.Name,
    object anObject: Any?,
  ) {
    sent.append(Sent(name: aName, object: anObject))
  }

  func hasPublished(_ name: Notification.Name) -> Bool {
    return !published.filter { $0 == name }.isEmpty
  }

  func hasSent(
    _ name: NSNotification.Name,
    _ object: Any?
  ) -> Bool {
    return !sent.filter { $0.name == name && $0.object != nil && object != nil }.isEmpty
  }

  func reset() {
    published = []
    sent = []
  }
}
