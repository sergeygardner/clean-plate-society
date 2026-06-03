//
//  DifficultyLevelEnum.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 06.03.2026.
//

import Foundation

enum DifficultyLevelEnum: String, CaseIterable, Hashable, Codable, Equatable {
  case low = "Low"
  case medium = "Medium"
  case high = "High"

  var progress: Int {
    switch self {
    case .low:
      return 1
    case .medium:
      return 2
    case .high:
      return 3
    }
  }

  var name: String {
    return String(describing: self)
  }

  func getChancellorAppointmentShift(_ entriesPerDay: Int) -> Int {
    switch self {
    case .low:
      return 0
    case .medium:
      if entriesPerDay == 1 {
        return 0
      }

      return 31
    case .high:
      if entriesPerDay == 1 {
        return 0
      }

      if entriesPerDay == 2 {
        return 31
      }

      return 62
    }
  }
}
