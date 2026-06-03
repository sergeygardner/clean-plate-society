//
//  StickerEnum.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 20.03.2026.
//

import Foundation

enum StickerEnum: String, CaseIterable, Hashable, Codable, Equatable {
  case badgers = "badgers"
  case bears = "bears"
  case foxes = "foxes"
  case squirrels = "squirrels"
  case standard = "standard"
  case manual1 = "manual1"
  case manual2 = "manual2"
  case manual3 = "manual3"

  var amount: Int {
    switch self {
    case .standard, .bears, .badgers, .squirrels, .foxes:
      return 366
    case .manual1, .manual2, .manual3:
      return .max
    }
  }

  var name: String {
    return String(describing: self)
  }

  var title: String {
    return self.rawValue.capitalized
  }

  static var allValuesExceptStandard: String {
    var titles: [String] = []

    for sticker in StickerEnum.allCases {
      if sticker != .standard {
        titles.append(sticker.title)
      }
    }

    return titles.joined(separator: ", ")
  }

  static func all(withManual: Bool) -> [StickerEnum] {
    var result: [StickerEnum] = []

    for sticker in self.allCases {
      switch sticker {
      case .standard, .bears, .badgers, .squirrels, .foxes:
        result.append(sticker)
      case .manual1, .manual2, .manual3:
        if withManual {
          result.append(sticker)
        }
      }
    }

    return result
  }

  func isManual() -> Bool {
    switch self {
    case .standard, .bears, .badgers, .squirrels, .foxes:
      return false
    case .manual1, .manual2, .manual3:
      return true
    }
  }

  var borderTheme: BorderAdaptiveModifier.BorderThemeEnum {
    switch self {
    case .standard:
      return .circle
    case .bears, .badgers, .squirrels, .foxes, .manual1, .manual2, .manual3:
      return .roundedRectangle
    }
  }
}
