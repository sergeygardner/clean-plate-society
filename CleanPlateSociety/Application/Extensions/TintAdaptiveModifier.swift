//
//  TintAdaptiveModifier.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 16.04.2026.
//

import SwiftUI

struct TintAdaptiveModifier: ViewModifier {
  enum TintThemeEnum {
    case icon
    case text
  }

  @EnvironmentObject private var profile: Profile

  let tintTheme: TintThemeEnum
  let theme: Theme?

  func body(content: Content) -> some View {
    let themedTheme: Theme =
      self.theme ?? profile.profileModelDTO?.settings.theme ?? Theme.formal

    switch tintTheme {
    case .icon:
      let themeGradient: LinearGradient = themedTheme.gradient

      content
        .tint(themeGradient)
    case .text:
      content
        .tint(themedTheme.text)
    //        @unknown default:
    //            content
    }
  }
}

extension View {
  func tintTheme(
    _ tintTheme: TintAdaptiveModifier.TintThemeEnum,
    theme: Theme? = nil
  ) -> some View {
    modifier(
      TintAdaptiveModifier(
        tintTheme: tintTheme,
        theme: theme,
      ),
    )
  }
}
