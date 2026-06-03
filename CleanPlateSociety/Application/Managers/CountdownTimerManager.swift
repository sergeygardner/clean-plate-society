//
//  CountdownTimerManager.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 25.03.2026.
//

import Combine
import Foundation

class CountdownTimerManager: ObservableObject {
  @Published var remaining: TimeInterval = 0

  private let formatter: DateComponentsFormatter = DateComponentsFormatter()
  private var timer: AnyCancellable?

  init(remaining: TimeInterval) {
    self.remaining = remaining

    formatter.allowedUnits = [.hour, .minute, .second]
    formatter.unitsStyle = .positional
    formatter.zeroFormattingBehavior = .pad

    restart()
  }

  func start() {
    timer = Timer.publish(every: 1.0, on: .main, in: .common)
      .autoconnect()
      .sink { [weak self] _ in
        guard let self = self else { return }
        if self.remaining > 0 {
          self.remaining -= 1
        } else {
          self.stop()
        }
      }
  }

  func stop() {
    timer?.cancel()
  }

  func restart() {
    stop()
    start()
  }

  func format() -> String? {
    return formatter.string(from: remaining)
  }
}
