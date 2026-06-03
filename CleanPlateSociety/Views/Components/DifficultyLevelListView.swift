//
//  ThemeListView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 14.04.2026.
//

import SwiftUI

struct DifficultyLevelListView: View {
  @State var viewModel: ViewModel = ViewModel()

  let choose: (_ difficultyLevel: DifficultyLevelEnum) -> Void

  var body: some View {
    ForEach(
      DifficultyLevelEnum.allCases,
      id: \.self
    ) {
      difficultyLevel in
      VStack(alignment: .leading) {
        if let title = viewModel.societyRepository
          .difficultyLevelTitle(
            difficultyLevel: difficultyLevel
          )
        {
          Text(title)
            .fontTheme(.headline)
            .foregroundStyleTheme(.text)
        }

        if let note = viewModel.societyRepository
          .difficultyLevelNote(
            difficultyLevel: difficultyLevel
          )
        {
          Text(note)
            .fontTheme(.footnote)
            .foregroundStyleTheme(.text)
        }

        if let description = viewModel.societyRepository
          .difficultyLevelDescription(
            difficultyLevel: difficultyLevel
          )
        {
          Text(description)
            .fontTheme(.subheadline)
            .foregroundStyleTheme(.text)
        }

        ButtonView(
          type: .tutorialStage2,
        ) {
          choose(difficultyLevel)
        }

        Spacer()
      }
    }
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    DifficultyLevelListView(choose: { difficultyLevel in })
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLight") {
  PreviewContainerView {
    DifficultyLevelListView(choose: { difficultyLevel in })
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLight") {
  PreviewContainerView {
    DifficultyLevelListView(choose: { difficultyLevel in })
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLight") {
  PreviewContainerView {
    DifficultyLevelListView(choose: { difficultyLevel in })
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLight") {
  PreviewContainerView {
    DifficultyLevelListView(choose: { difficultyLevel in })
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.light)
  }
}
