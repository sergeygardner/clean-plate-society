//
//  CountdownTimerView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 25.03.2026.
//

import Combine
import SwiftUI

struct CountdownTimerView: View {
  @StateObject private var manager: CountdownTimerManager
  @State var remaining: TimeInterval

  init(remaining: TimeInterval) {
    _remaining = State(wrappedValue: remaining)
    _manager = StateObject(
      wrappedValue: CountdownTimerManager(remaining: remaining)
    )
  }

  var body: some View {
    VStack {
      if let text = manager.format() {
        Text(text)
          .foregroundStyleTheme(.text)
      }
    }.onAppear {
      manager.restart()
    }
  }
}

#Preview("EnglishFormalLight100") {
  @Previewable @State var remaining: TimeInterval = 100

  CountdownTimerView(remaining: remaining)
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.light)
}

#Preview("EnglishRoyalLight100") {
  @Previewable @State var remaining: TimeInterval = 100

  CountdownTimerView(remaining: remaining)
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.light)
}

#Preview("EnglishForestLight100") {
  @Previewable @State var remaining: TimeInterval = 100

  CountdownTimerView(remaining: remaining)
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.light)
}

#Preview("EnglishHarvestLight100") {
  @Previewable @State var remaining: TimeInterval = 100

  CountdownTimerView(remaining: remaining)
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.light)
}

#Preview("EnglishMidnightLight100") {
  @Previewable @State var remaining: TimeInterval = 100

  CountdownTimerView(remaining: remaining)
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.light)
}
