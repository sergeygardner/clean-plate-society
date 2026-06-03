//
//  BackgroundAdaptiveModifier.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 04.03.2026.
//

import SwiftUI

struct BackgroundAdaptiveModifier: ViewModifier {
  enum BackgroundThemeEnum {
    case button
    case buttonProfile
    case circle
    case circleEmpty
    case circleOff
    case message
    case none
    case plain
    case sticker
    case wisdom
  }

  @EnvironmentObject private var profile: Profile

  let backgroundTheme: BackgroundThemeEnum
  let theme: Theme?

  func body(content: Content) -> some View {
    let themedTheme: Theme =
      self.theme ?? profile.profileModelDTO?.settings.theme ?? Theme.formal

    switch backgroundTheme {
    case .circle, .circleEmpty, .circleOff:
      let themeBackground: Color = themedTheme.background
      let themeBorder: Color = themedTheme.border

      content
        .background(
          Circle()
            .foregroundStyle(themeBackground)
            .shadow(
              color: themeBorder.opacity(0.5),
              radius: 0,
              x: 1,
              y: 1
            )
            .shadow(
              color: themeBorder.opacity(0.5),
              radius: 0,
              x: -1,
              y: -1
            )
            .shadow(
              color: themeBorder.opacity(0.5),
              radius: 0,
              x: 1,
              y: -1
            )
            .shadow(
              color: themeBorder.opacity(0.5),
              radius: 0,
              x: -1,
              y: 1
            )
        )
        .opacity(opacity())
    case .button, .message:
      let themeBackground: Color = themedTheme.background
      let themeBorder: Color = themedTheme.border

      content
        .background(
          Capsule()
            .foregroundStyle(themeBackground)
            .shadow(
              color: themeBorder.opacity(0.5),
              radius: 0,
              x: 1,
              y: 1
            )
            .shadow(
              color: themeBorder.opacity(0.5),
              radius: 0,
              x: -1,
              y: -1
            )
            .shadow(
              color: themeBorder.opacity(0.5),
              radius: 0,
              x: 1,
              y: -1
            )
            .shadow(
              color: themeBorder.opacity(0.5),
              radius: 0,
              x: -1,
              y: 1
            )
        )
    case .buttonProfile, .wisdom:
      let themeBackground: Color = themedTheme.background
      let themeBorder: Color = themedTheme.border

      content
        .background(
          RoundedRectangle(cornerRadius: 16)
            .foregroundStyle(themeBackground)
            .shadow(
              color: themeBorder.opacity(0.5),
              radius: 0,
              x: 1,
              y: 1
            )
            .shadow(
              color: themeBorder.opacity(0.5),
              radius: 0,
              x: -1,
              y: -1
            )
            .shadow(
              color: themeBorder.opacity(0.5),
              radius: 0,
              x: 1,
              y: -1
            )
            .shadow(
              color: themeBorder.opacity(0.5),
              radius: 0,
              x: -1,
              y: 1
            )
        )
    case .none:
      content
    case .sticker:
      let themeBackground: Color = themedTheme.background

      content
        .foregroundStyle(themeBackground)
    case .plain:
      let themeBackground: Color = themedTheme.background

      content
        .background(themeBackground)
    //        @unknown default:
    //            content
    }
  }

  private func opacity() -> Double {
    let opacity: Double

    if backgroundTheme == .circleEmpty {
      opacity = 0.5
    } else {
      if backgroundTheme == .circleOff {
        opacity = 0.1
      } else {
        opacity = 1
      }
    }

    return opacity
  }
}

extension View {
  func backgroundTheme(
    _ backgroundTheme: BackgroundAdaptiveModifier.BackgroundThemeEnum,
    theme: Theme? = nil
  ) -> some View {
    modifier(
      BackgroundAdaptiveModifier(
        backgroundTheme: backgroundTheme,
        theme: theme,
      ),
    )
  }
}
