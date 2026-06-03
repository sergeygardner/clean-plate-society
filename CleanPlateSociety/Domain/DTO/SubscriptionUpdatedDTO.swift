//
//  SubscriptionUpdatedDTO.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 05.05.2026.
//

import Foundation

struct SubscriptionUpdatedDTO {
  enum StateEnum {
    case purchase
    case restore
    case silent

    var name: String {
      return String(describing: self)
    }
  }
  let state: StateEnum
}
