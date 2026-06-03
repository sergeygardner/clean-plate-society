//
//  ErrorManager.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 12.05.2026.
//

import Foundation

@Observable
class ErrorManager {
  public static let shared: ErrorManager = ErrorManager()

  var error: AppErrorEnum? = nil
  var state: Bool = false

  func trigger(_ error: AppErrorEnum) {
    self.error = error

    show()
  }

  func canBeShowed() -> Bool {
    return self.state == true
  }

  func show() {
    self.state = true
  }

  func hide() {
    self.state = false
  }
}
