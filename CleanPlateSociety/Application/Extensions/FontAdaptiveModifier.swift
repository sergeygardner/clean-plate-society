//
//  FontAdaptiveModifier.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 16.04.2026.
//

import SwiftUI

struct FontAdaptiveModifier: ViewModifier {
  enum FontThemeEnum {
    case body
    case bodyLightItalic
    case caption
    case captionBold
    case caption2
    case caption2LightSerif
    case footnote
    case headline
    case headlineUppercase
    case subheadline
    case subheadlineBold
    case subheadlineLight
    case subheadlineLightSerif
    case title
    case title2
    case title3
    case title3Bold
    case title3ItalicSerif
  }

  @EnvironmentObject private var profile: Profile

  let fontTheme: FontThemeEnum

  func body(content: Content) -> some View {
    switch fontTheme {
    case .body:
      content
        .font(.body)
    case .bodyLightItalic:
      content
        .font(.body)
        .fontWeight(.light)
        .italic()
    case .caption:
      content
        .font(.caption)
    case .captionBold:
      content
        .font(.caption)
        .fontWeight(.bold)
    case .caption2:
      content
        .font(.caption2)
    case .caption2LightSerif:
      content
        .font(.system(.caption2, design: .serif))
        .fontWeight(.light)
    case .footnote:  //, .circle, .circleEmpty, .circleOff:
      content
        .font(.footnote)
    case .headline:
      content
        .font(.headline)
    case .headlineUppercase:
      content
        .font(.headline)
        .textCase(.uppercase)
    case .subheadline:
      content
        .font(.subheadline)
    case .subheadlineBold:
      content
        .font(.subheadline)
        .fontWeight(.bold)
    case .subheadlineLight:
      content
        .font(.subheadline)
        .fontWeight(.light)
    case .subheadlineLightSerif:
      content
        .font(.system(.subheadline, design: .serif))
        .fontWeight(.light)
    case .title:
      content
        .font(.title)
    case .title2:
      content
        .font(.title2)
    case .title3:
      content
        .font(.title3)
    case .title3Bold:
      content
        .font(.title3)
        .bold()
    case .title3ItalicSerif:
      content
        .font(.system(.title3, design: .serif))
        .italic()
    //        @unknown default:
    //            content
    }
  }
}

extension View {
  func fontTheme(
    _ fontTheme: FontAdaptiveModifier.FontThemeEnum,
    theme: Theme? = nil
  ) -> some View {
    modifier(
      FontAdaptiveModifier(
        fontTheme: fontTheme
      ),
    )
  }
}
