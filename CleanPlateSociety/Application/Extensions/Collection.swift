//
//  Collection.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 03.04.2026.
//

import Foundation

extension Collection {
  subscript(safe index: Index) -> Element? {
    return indices.contains(index) ? self[index] : nil
  }
}
