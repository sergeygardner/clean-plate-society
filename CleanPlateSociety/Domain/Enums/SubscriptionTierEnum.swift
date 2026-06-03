//
//  SubscriptionTierEnum.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 05.05.2026.
//

import Foundation

enum SubscriptionTierEnum: String {
  case unknown = "unknown"
  case gold = "gold"
  case tips = "tips"

  var name: String {
    return String(describing: self)
  }

  var perks: [PerkEnum] {
    switch self {
    case .gold:
      return [.crown, .manualStickers, .unlimitedProfiles]
    case .tips:
      return [.crown]
    case .unknown:
      return [.stickers, .profiles]
    }
  }

  func hasPerk(_ perk: PerkEnum) -> Bool {
    return self.perks.contains(perk)
  }
}
