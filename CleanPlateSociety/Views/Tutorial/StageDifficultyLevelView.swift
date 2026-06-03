//
//  StageDifficultyLevelView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 10.04.2026.
//

import SwiftUI

struct StageDifficultyLevelView: View {
  @EnvironmentObject var profile: Profile
  @State var viewModel: ViewModel = ViewModel()

  var next: () -> Void

  var body: some View {
    VStack {
      if let text = viewModel.societyRepository.tutorialStage2Title() {
        VStack(alignment: .leading) {
          Text(text)
            .fontTheme(.headline)
            .foregroundStyleTheme(.text)
        }
      }

      if let text = viewModel.societyRepository
        .tutorialStage2Description()
      {
        VStack(alignment: .leading) {
          Text(text)
            .fontTheme(.subheadline)
            .foregroundStyleTheme(.text)
        }
      }
    }
    .padding(.horizontal)

    let note: String? = viewModel.societyRepository
      .tutorialStage2Note()

    Form {
      Section(
        header: Text(note ?? "")
          .fontTheme(.body)
          .foregroundStyleTheme(.text)
      ) {
        DifficultyLevelListView(
          choose: { difficultyLevel in

            profile.setDifficultyLevel(difficultyLevel)

            next()
          }
        )
      }
    }
    .scrollContentBackground(.hidden)
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    StageDifficultyLevelView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLight") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    StageDifficultyLevelView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLight") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    StageDifficultyLevelView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLight") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    StageDifficultyLevelView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLight") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    StageDifficultyLevelView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalDark") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    StageDifficultyLevelView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishRoyalDark") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    StageDifficultyLevelView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishForestDark") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    StageDifficultyLevelView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishHarvestDark") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    StageDifficultyLevelView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishMidnightDark") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    StageDifficultyLevelView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.dark)
  }
}
