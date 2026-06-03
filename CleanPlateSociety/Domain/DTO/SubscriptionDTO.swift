//
//  SubscriptionDTO.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 05.05.2026.
//

import Foundation

struct SubscriptionDTO {
  var list: [SubscriptionEnum] = []
  var tiers: [SubscriptionTierEnum] = [.unknown]
}

extension SubscriptionDTO {
  static var gold: SubscriptionDTO = SubscriptionDTO(list: [.goldYearly], tiers: [.unknown, .gold])
  static var tips: SubscriptionDTO = SubscriptionDTO(list: [.tipsYearly], tiers: [.unknown, .tips])
  static var goldTips: SubscriptionDTO = SubscriptionDTO(
    list: [.goldYearly, .tipsYearly], tiers: [.unknown, .gold, .tips])
}
