//
//  ModifyProfileThemeViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 14.04.2026.
//

import Foundation
import RevenueCat

extension SubscriptionsView {
  @Observable
  class ViewModel {
    enum Status {
      case idle
      case loading
      case loaded
      case error(Error)
    }

    var statusFetchingOfferings: Status = .idle
    var offerings: [String: Offering]? = nil

    let notificationRepository: NotificationRepository
    let societyRepository: SocietyRepository
    let subscriptionRepository: SubscriptionRepositoryProtocol?

    init(
      notificationRepository: NotificationRepository = NotificationRepository(),
      societyRepository: SocietyRepository =
        SocietyRepository(),
      subscriptionRepository: SubscriptionRepositoryProtocol? = SubscriptionRepository(),
    ) {
      self.notificationRepository = notificationRepository
      self.societyRepository = societyRepository
      self.subscriptionRepository = subscriptionRepository
    }

    func fetchOfferings() async {
      statusFetchingOfferings = .loading

      if let subscriptionRepository = subscriptionRepository {
        let (offerings, error): ([String: Offering]?, Error?) =
          await subscriptionRepository.getOfferings()

        if let error = error {
          statusFetchingOfferings = .error(error)
        } else {
          self.offerings = offerings
          statusFetchingOfferings = .loaded
        }
      } else {
        statusFetchingOfferings = .error(SubscriptionErrorEnum.missingAPIKey)
      }
    }

    func findSubscriptionEnum(_ name: String) -> SubscriptionEnum? {
      return SubscriptionEnum.init(rawValue: name)
    }
  }
}
