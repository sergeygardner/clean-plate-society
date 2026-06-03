//
//  ModifyProfileNameView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 10.04.2026.
//

import SwiftUI

struct ModifyProfileThemeView: View {
  @Binding var theme: Theme
  @State var viewModel: ViewModel = ViewModel()

  var body: some View {
    HStack(alignment: .top) {
      Image(systemName: "paintpalette.fill")
        .foregroundStyleTheme(.icon)
        .padding(.top, 3)

      Picker(selection: $theme) {
        ForEach(Theme.allCases, id: \.self) { theme in
          if let title = viewModel.societyRepository.themeTitle(
            theme: theme
          ) {
            Text(title)
              .foregroundStyleTheme(.text)
          }
        }
      } label: {
        Text("settings.theme.text")
          .fontTheme(.body)
          .foregroundStyleTheme(.text)
      }
    }
    .alignmentGuide(.listRowSeparatorLeading) { d in d[.leading] }
  }
}

#Preview("EnglishFormalLight") {
  @Previewable @State var theme: Theme = .formal

  PreviewContainerView {
    Form {
      ModifyProfileThemeView(theme: $theme)
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishRoyalLight") {
  @Previewable @State var theme: Theme = .royal

  PreviewContainerView {
    Form {
      ModifyProfileThemeView(theme: $theme)
        .environmentObject(Profile.sampleRoyalLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishForestLight") {
  @Previewable @State var theme: Theme = .forest

  PreviewContainerView {
    Form {
      ModifyProfileThemeView(theme: $theme)
        .environmentObject(Profile.sampleForestLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishHarvestLight") {
  @Previewable @State var theme: Theme = .harvest

  PreviewContainerView {
    Form {
      ModifyProfileThemeView(theme: $theme)
        .environmentObject(Profile.sampleHarvestLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishMidnightLight") {
  @Previewable @State var theme: Theme = .midnight

  PreviewContainerView {
    Form {
      ModifyProfileThemeView(theme: $theme)
        .environmentObject(Profile.sampleMidnightLow)
        .preferredColorScheme(.light)
    }
  }
}
