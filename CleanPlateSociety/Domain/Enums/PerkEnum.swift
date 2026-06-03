//
//  PerkEnum.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 05.05.2026.
//

import Foundation

enum PerkEnum: String {
  case crown = "crown"
  case stickers = "stickers"
  case manualStickers = "manual.stickers"
  case profiles = "profiles"
  case unlimitedProfiles = "unlimited.profiles"

  func canCreateNewProfile(_ amount: Int) -> Bool {
    switch self {
    case .profiles:
      return amount < 2
    case .unlimitedProfiles:
      return true
    case .crown, .stickers, .manualStickers:
      return false
    }
  }
}
