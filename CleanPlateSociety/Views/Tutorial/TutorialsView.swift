//
//  TutorialView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 10.04.2026.
//

import SwiftUI

struct TutorialView: View {
  @Binding var stage: StageEnum

  var body: some View {
    VStack(alignment: .leading, spacing: 10) {
      SocietyHeaderView()

      switch stage {
      case .stage1:
        StageNameView(next: { stage = .stage2 })
      case .stage2:
        StageDifficultyLevelView(next: { stage = .stage3 })
      case .stage3:
        StageStickerView(next: { stage = .stage4 })
      case .stage4:
        StageThemeView(next: { stage = .stage5 })
      case .stage5:
        VStack {}
      }
    }
  }
}

#Preview("EnglishFormalLight") {
  @Previewable @State var stage: StageEnum = .stage1

  PreviewContainerView {
    NavigationStack {
      TutorialView(
        stage: $stage
      )
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLight") {
  @Previewable @State var stage: StageEnum = .stage1

  PreviewContainerView {
    NavigationStack {
      TutorialView(
        stage: $stage
      )
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLight") {
  @Previewable @State var stage: StageEnum = .stage1

  PreviewContainerView {
    NavigationStack {
      TutorialView(
        stage: $stage
      )
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLight") {
  @Previewable @State var stage: StageEnum = .stage1

  PreviewContainerView {
    NavigationStack {
      TutorialView(
        stage: $stage
      )
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLight") {
  @Previewable @State var stage: StageEnum = .stage1

  PreviewContainerView {
    NavigationStack {
      TutorialView(
        stage: $stage
      )
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalDark") {
  @Previewable @State var stage: StageEnum = .stage1

  PreviewContainerView {
    NavigationStack {
      TutorialView(
        stage: $stage
      )
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishRoyalDark") {
  @Previewable @State var stage: StageEnum = .stage1

  PreviewContainerView {
    NavigationStack {
      TutorialView(
        stage: $stage
      )
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishForestDark") {
  @Previewable @State var stage: StageEnum = .stage1

  PreviewContainerView {
    NavigationStack {
      TutorialView(
        stage: $stage
      )
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishHarvestDark") {
  @Previewable @State var stage: StageEnum = .stage1

  PreviewContainerView {
    NavigationStack {
      TutorialView(
        stage: $stage
      )
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishMidnightDark") {
  @Previewable @State var stage: StageEnum = .stage1

  PreviewContainerView {
    NavigationStack {
      TutorialView(
        stage: $stage
      )
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.dark)
  }
}
