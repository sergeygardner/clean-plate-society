//
//  SubscriptionEnum.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 05.05.2026.
//

import Foundation

enum SubscriptionEnum: String {
  case unknown = "unknown"
  case goldMonthly = "cleanplatesocietygoldmonthly"
  case goldYearly = "cleanplatesocietygoldyearly"
  case tipsMonthly = "cleanplatesocietytipsmonthly"
  case tipsYearly = "cleanplatesocietytipsyearly"

  var name: String {
    return String(describing: self).lowercased()
  }

  var tier: SubscriptionTierEnum {
    switch self {
    case .goldMonthly, .goldYearly:
      return .gold
    case .tipsMonthly, .tipsYearly:
      return .tips
    case .unknown:
      return .unknown
    }
  }
}
