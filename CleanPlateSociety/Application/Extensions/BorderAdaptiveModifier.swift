//
//  BorderAdaptiveModifier.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 16.04.2026.
//

import SwiftUI

struct BorderAdaptiveModifier: ViewModifier {
  enum BorderThemeEnum {
    case border
    case circle
    case roundedRectangle
    case undefined
  }

  @EnvironmentObject private var profile: Profile

  let borderTheme: BorderThemeEnum
  let theme: Theme?

  func body(content: Content) -> some View {
    let themedTheme: Theme =
      self.theme ?? profile.profileModelDTO?.settings.theme ?? Theme.formal

    switch borderTheme {
    case .border:
      let themeBorder: Color = themedTheme.border
      let themeBorderWidth: CGFloat = themedTheme.borderWidth

      content
        .border(themeBorder, width: themeBorderWidth)
    case .circle:
      let themeBorder: Color = themedTheme.border
      let themeBorderWidth: CGFloat = themedTheme.borderWidth

      content
        .clipShape(Circle())
        .overlay(
          Circle()
            .stroke(themeBorder, lineWidth: themeBorderWidth)
            .opacity(1.0)
        )
    case .roundedRectangle:
      let themeBorder: Color = themedTheme.border
      let themeBorderWidth: CGFloat = themedTheme.borderWidth

      content
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .stroke(themeBorder, lineWidth: themeBorderWidth)
            .opacity(1.0)
        )
    case .undefined:
      content
    //        @unknown default:
    //            content
    }
  }
}

extension View {
  func borderTheme(
    _ borderTheme: BorderAdaptiveModifier.BorderThemeEnum,
    theme: Theme? = nil
  ) -> some View {
    modifier(
      BorderAdaptiveModifier(
        borderTheme: borderTheme,
        theme: theme,
      ),
    )
  }
}
