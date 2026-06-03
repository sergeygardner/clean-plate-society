//
//  SubscriptionRepository.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 20.03.2026.
//

import Foundation
import RevenueCat

protocol SubscriptionRepositoryProtocol {
  func getOfferings() async -> ([String: Offering]?, Error?)
  func purchase(package: Package) async
  func restorePurchase() async
  func updateStatusFor(_ subscriptionUpdatedDTO: SubscriptionUpdatedDTO, _ profile: Profile) async
}

class SubscriptionRepository: SubscriptionRepositoryProtocol {
  static var keyed: Result<String, SubscriptionErrorEnum> {
    guard let apiKey = Bundle.main.object(forInfoDictionaryKey: "REVENUE_CAT_API_KEY") as? String
    else {
      return .failure(.missingAPIKey)
    }

    return .success(apiKey)
  }

  var offerings: [String: Offering]? = nil

  private let mainRepository: MainRepository
  private let notificationRepository: NotificationRepository
  private let resource: Purchases?

  init?(
    mainRepository: MainRepository = MainRepository(),
    notificationRepository: NotificationRepository = NotificationRepository(),
    purchases: Purchases? = nil,
  ) {
    if purchases == nil {
      if Purchases.isConfigured {
        resource = Purchases.shared
      } else {
        return nil
      }
    } else {
      resource = purchases
    }

    self.mainRepository = mainRepository
    self.notificationRepository = notificationRepository
  }

  func getOfferings() async -> ([String: Offering]?, Error?) {
    if let offerings = offerings {
      return (offerings, nil)
    }

    do {
      offerings = try await resource?.offerings().all
    } catch {
      notificationRepository.send(errorDTO: ErrorDTO(error: .subscription(error)))

      return (nil, error)
    }

    return (offerings, nil)
  }

  func purchase(package: Package) async {
    if let resource = resource {
      do {
        let _ = try await resource.purchase(package: package)

        notificationRepository.send(
          subscriptionUpdatedDTO: SubscriptionUpdatedDTO(state: .purchase))
      } catch {
        notificationRepository.send(errorDTO: ErrorDTO(error: .subscription(error)))
      }
    }
  }

  func restorePurchase() async {
    resource?.restorePurchases { (customerInfo, error) in
      if customerInfo != nil {
        self.notificationRepository.send(
          subscriptionUpdatedDTO: SubscriptionUpdatedDTO(state: .restore))
      } else if let error = error {
        self.notificationRepository.send(errorDTO: ErrorDTO(error: .subscription(error)))
      }
    }
  }

  func updateStatusFor(_ subscriptionUpdatedDTO: SubscriptionUpdatedDTO, _ profile: Profile) async {
    if let resource = resource {
      do {
        let customerInfo: CustomerInfo = try await resource.customerInfo()

        if customerInfo.entitlements["Gold"]?.isActive == true {
          profile.addSubscriptionTier(SubscriptionTierEnum.gold)

          if let product = customerInfo.entitlements["Gold"]?.productIdentifier,
            let subscription = SubscriptionEnum.init(rawValue: product)
          {

            if subscription == .goldYearly {
              profile.deleteSubscriptions(.goldMonthly)
            } else {
              profile.deleteSubscriptions(.goldYearly)
            }

            profile.addSubscription(subscription)
          }
        } else {
          profile.deleteSubscriptionTier(SubscriptionTierEnum.gold)
          profile.deleteSubscriptions(.goldYearly, .goldMonthly)
        }

        if customerInfo.entitlements["Tips"]?.isActive == true {
          profile.addSubscriptionTier(SubscriptionTierEnum.tips)

          if let product = customerInfo.entitlements["Tips"]?.productIdentifier,
            let subscription = SubscriptionEnum.init(rawValue: product)
          {

            if subscription == .tipsYearly {
              profile.deleteSubscriptions(.tipsMonthly)
            } else {
              profile.deleteSubscriptions(.tipsYearly)
            }

            profile.addSubscription(subscription)
          }
        } else {
          profile.deleteSubscriptionTier(SubscriptionTierEnum.tips)
          profile.deleteSubscriptions(.tipsYearly, .tipsMonthly)
        }

        switch subscriptionUpdatedDTO.state {
        case .purchase:
          if profile.countSubscriptions() > 0,
            let message = mainRepository.getPurchaseMessage()
          {
            notificationRepository.send(
              serviceMessage: ServiceMessageDTO(
                message: message,
              ),
            )
          }
        case .restore:
          if profile.countSubscriptions() > 0 {
            if let message = mainRepository.getRestoreMessage() {
              notificationRepository.send(
                serviceMessage: ServiceMessageDTO(
                  message: message,
                ),
              )
            }
          } else {
            if let message = mainRepository.getRestoreNothingMessage() {
              notificationRepository.send(
                serviceMessage: ServiceMessageDTO(
                  message: message,
                ),
              )
            }
          }
        case .silent:
          return
        }

      } catch {
        notificationRepository.send(errorDTO: ErrorDTO(error: .subscription(error)))
      }
    }
  }
}
