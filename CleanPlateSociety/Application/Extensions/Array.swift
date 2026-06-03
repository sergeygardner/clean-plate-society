//
//  Array.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 03.04.2026.
//

import Foundation

extension Array where Element: Equatable {
  func slice(from startIndex: Int, to endIndex: Int) -> [Element]? {
    guard startIndex <= endIndex else {
      return nil
    }

    return Array(self[startIndex...endIndex])
  }
}
