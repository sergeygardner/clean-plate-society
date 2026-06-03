//
//  StageEnum.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 10.04.2026.
//

import Foundation

enum StageEnum: String {
  case stage1 = "stage1"
  case stage2 = "stage2"
  case stage3 = "stage3"
  case stage4 = "stage4"
  case stage5 = "stage5"

  func isFinal() -> Bool {
    return self == .stage5
  }
}
