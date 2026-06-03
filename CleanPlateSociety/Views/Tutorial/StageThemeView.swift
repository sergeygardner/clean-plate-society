//
//  StageStickerView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 10.04.2026.
//

import SwiftUI

struct StageThemeView: View {
  @EnvironmentObject var profile: Profile
  @State var viewModel: ViewModel = ViewModel()

  var next: () -> Void

  var body: some View {
    VStack {
      if let title = viewModel.societyRepository.tutorialStage4Title() {
        VStack(alignment: .leading) {
          Text(title)
            .fontTheme(.headline)
            .foregroundStyleTheme(.text)
        }
      }

      if let description = viewModel.societyRepository
        .tutorialStage4Description()
      {
        VStack(alignment: .leading) {
          Text(description)
            .fontTheme(.subheadline)
            .foregroundStyleTheme(.text)
        }
        .padding(.vertical)
      }
    }
    .padding(.horizontal)

    let note: String? = viewModel.societyRepository
      .tutorialStage4Note()

    Form {
      Section(
        header: Text(note ?? "")
          .fontTheme(.body)
          .foregroundStyleTheme(.text)
      ) {
        ForEach(Theme.allCases, id: \.self) { theme in
          VStack(alignment: .leading) {
            if let title = viewModel.societyRepository.themeTitle(
              theme: theme
            ) {
              Text(title)
                .fontTheme(.headline, theme: theme)
                .foregroundStyleTheme(.text, theme: theme)
            }

            if let description = viewModel.societyRepository
              .themeDescription(theme: theme)
            {
              HStack(alignment: .top) {
                Image(systemName: "dot.circle.viewfinder")
                  .foregroundStyleTheme(.icon, theme: theme)
                  .padding(.top, 3)
                Text(description)
                  .fontTheme(.subheadline, theme: theme)
                  .foregroundStyleTheme(.text, theme: theme)
              }
            }

            ButtonView(
              type: .tutorialStage4,
            ) {
              viewModel.theme = theme
              save()
              next()
            }
          }
          .padding()
          .frame(maxWidth: .infinity, alignment: .leading)
        }
      }
    }
    .scrollContentBackground(.hidden)
  }

  func save() {
    profile.setTheme(viewModel.theme)
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    StageThemeView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLight") {
  PreviewContainerView {
    StageThemeView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLight") {
  PreviewContainerView {
    StageThemeView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLight") {
  PreviewContainerView {
    StageThemeView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLight") {
  PreviewContainerView {
    StageThemeView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalDark") {
  PreviewContainerView {
    StageThemeView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishRoyalDark") {
  PreviewContainerView {
    StageThemeView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishForestDark") {
  PreviewContainerView {
    StageThemeView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishHarvestDark") {
  PreviewContainerView {
    StageThemeView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishMidnightDark") {
  PreviewContainerView {
    StageThemeView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.dark)
  }
}
