//
//  ForegroundStyleAdaptiveModifier.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 16.04.2026.
//

import SwiftUI

struct ForegroundStyleAdaptiveModifier: ViewModifier {
  enum ForegroundStyleThemeEnum {
    case icon
    case iconDisabled
    case text
    case toolbarIcon
  }

  @EnvironmentObject private var profile: Profile

  let foregroundStyleTheme: ForegroundStyleThemeEnum
  let theme: Theme?

  func body(content: Content) -> some View {
    let themedTheme: Theme =
      self.theme ?? profile.profileModelDTO?.settings.theme ?? Theme.formal

    switch foregroundStyleTheme {
    case .icon, .iconDisabled:
      content
        .foregroundStyle(themedTheme.gradient)
        .shadow(
          color: themedTheme.shadow,
          radius: themedTheme.shadowRadius,
          x: themedTheme.shadowX,
          y: themedTheme.shadowY
        )
        .opacity(foregroundStyleTheme == .icon ? 1 : 0.75)
    case .text:
      content
        .foregroundColor(themedTheme.text)
    case .toolbarIcon:
      content
        .foregroundStyle(themedTheme.gradient)
    }
  }
}

extension View {
  func foregroundStyleTheme(
    _ foregroundStyleTheme: ForegroundStyleAdaptiveModifier
      .ForegroundStyleThemeEnum,
    theme: Theme? = nil
  ) -> some View {
    modifier(
      ForegroundStyleAdaptiveModifier(
        foregroundStyleTheme: foregroundStyleTheme,
        theme: theme,
      ),
    )
  }
}
