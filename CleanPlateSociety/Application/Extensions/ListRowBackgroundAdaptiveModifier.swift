//
//  ListRowBackgroundAdaptiveModifier.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 16.04.2026.
//

import SwiftUI

struct ListRowBackgroundAdaptiveModifier: ViewModifier {
  enum ListRowBackgroundThemeEnum {
    case border
    case list
  }

  @EnvironmentObject private var profile: Profile

  let listRowBackgroundTheme: ListRowBackgroundThemeEnum
  let theme: Theme?

  func body(content: Content) -> some View {
    let themedTheme: Theme =
      self.theme ?? profile.profileModelDTO?.settings.theme ?? Theme.formal

    switch listRowBackgroundTheme {
    case .border:
      content
        .listRowBackground(
          //RoundedRectangle(cornerRadius: 24, style: .continuous) if something weird in the future change to
          Capsule()
            .stroke(themedTheme.border)
            .background(Capsule().fill(themedTheme.background))
        )
    case .list:
      content
        .listRowBackground(themedTheme.background)
    //        @unknown default:
    //            content
    }
  }
}

extension View {
  func listRowBackgroundTheme(
    _ listRowBackgroundTheme: ListRowBackgroundAdaptiveModifier.ListRowBackgroundThemeEnum,
    theme: Theme? = nil
  ) -> some View {
    modifier(
      ListRowBackgroundAdaptiveModifier(
        listRowBackgroundTheme: listRowBackgroundTheme,
        theme: theme,
      ),
    )
  }
}
