//
//  ToolbarAdaptiveModifier.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 16.04.2026.
//

import SwiftUI

struct ToolbarAdaptiveModifier: ViewModifier {
  enum ToolbarThemeEnum {
    case navigationTitle
    case toolbar
  }

  @EnvironmentObject private var profile: Profile

  let toolbarTheme: ToolbarThemeEnum
  let theme: Theme?

  func body(content: Content) -> some View {
    let themedTheme: Theme =
      self.theme ?? profile.profileModelDTO?.settings.theme ?? Theme.formal

    switch toolbarTheme {
    case .navigationTitle, .toolbar:
      content.tint(themedTheme.border)
    //        @unknown default:
    //            content
    }
  }
}

extension View {
  func toolbarTheme(
    _ toolbarTheme: ToolbarAdaptiveModifier.ToolbarThemeEnum,
    theme: Theme? = nil
  ) -> some View {
    modifier(
      ToolbarAdaptiveModifier(
        toolbarTheme: toolbarTheme,
        theme: theme,
      ),
    )
  }
}
