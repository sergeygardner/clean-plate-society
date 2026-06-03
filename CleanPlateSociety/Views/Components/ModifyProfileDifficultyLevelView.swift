//
//  ModifyProfileNameView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 10.04.2026.
//

import SwiftUI

struct ModifyProfileDifficultyLevelView: View {
  @Binding var difficultyLevel: DifficultyLevelEnum
  @State var viewModel: ViewModel = ViewModel()

  var disabled: Bool

  var body: some View {
    HStack(alignment: .top) {
      Image(
        systemName:
          "gauge.with.dots.needle.bottom.0percent"
      )
      .foregroundStyleTheme(.icon)
      .padding(.top, 3)

      Picker(selection: $difficultyLevel) {
        ForEach(
          DifficultyLevelEnum.allCases,
          id: \.self
        ) {
          difficultyLevel in
          if let label = viewModel.societyRepository
            .difficultyLevelLabel(difficultyLevel: difficultyLevel)
          {
            Text(label)
              .foregroundStyleTheme(.text)
          }
        }
      } label: {
        Text("settings.difficulty.level.text")
          .foregroundStyleTheme(.text)
      }
      .disabled(disabled)
    }
    .alignmentGuide(.listRowSeparatorLeading) { d in d[.leading] }
    .allowsHitTesting(!disabled)
  }
}

#Preview("EnglishFormalLightDisabled") {
  @Previewable @State var difficultyLevel: DifficultyLevelEnum = .low
  @Previewable @State var disabled: Bool = true

  PreviewContainerView {
    Form {
      ModifyProfileDifficultyLevelView(
        difficultyLevel: $difficultyLevel,
        disabled: disabled
      )
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishFormalLightNotDisabled") {
  @Previewable @State var difficultyLevel: DifficultyLevelEnum = .low
  @Previewable @State var disabled: Bool = false

  PreviewContainerView {
    Form {
      ModifyProfileDifficultyLevelView(
        difficultyLevel: $difficultyLevel,
        disabled: disabled
      )
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishRoyalLightNotDisabled") {
  @Previewable @State var difficultyLevel: DifficultyLevelEnum = .low
  @Previewable @State var disabled: Bool = false

  PreviewContainerView {
    Form {
      ModifyProfileDifficultyLevelView(
        difficultyLevel: $difficultyLevel,
        disabled: disabled
      )
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishForestLightNotDisabled") {
  @Previewable @State var difficultyLevel: DifficultyLevelEnum = .low
  @Previewable @State var disabled: Bool = false

  PreviewContainerView {
    Form {
      ModifyProfileDifficultyLevelView(
        difficultyLevel: $difficultyLevel,
        disabled: disabled
      )
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishHarvestLightNotDisabled") {
  @Previewable @State var difficultyLevel: DifficultyLevelEnum = .low
  @Previewable @State var disabled: Bool = false

  PreviewContainerView {
    Form {
      ModifyProfileDifficultyLevelView(
        difficultyLevel: $difficultyLevel,
        disabled: disabled
      )
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishMidnightLightNotDisabled") {
  @Previewable @State var difficultyLevel: DifficultyLevelEnum = .low
  @Previewable @State var disabled: Bool = false

  PreviewContainerView {
    Form {
      ModifyProfileDifficultyLevelView(
        difficultyLevel: $difficultyLevel,
        disabled: disabled
      )
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishFormalDarkDisabled") {
  @Previewable @State var difficultyLevel: DifficultyLevelEnum = .low
  @Previewable @State var disabled: Bool = true

  PreviewContainerView {
    Form {
      ModifyProfileDifficultyLevelView(
        difficultyLevel: $difficultyLevel,
        disabled: disabled
      )
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishFormalDarkNotDisabled") {
  @Previewable @State var difficultyLevel: DifficultyLevelEnum = .low
  @Previewable @State var disabled: Bool = false

  PreviewContainerView {
    Form {
      ModifyProfileDifficultyLevelView(
        difficultyLevel: $difficultyLevel,
        disabled: disabled
      )
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishRoyalDarkNotDisabled") {
  @Previewable @State var difficultyLevel: DifficultyLevelEnum = .low
  @Previewable @State var disabled: Bool = false

  PreviewContainerView {
    Form {
      ModifyProfileDifficultyLevelView(
        difficultyLevel: $difficultyLevel,
        disabled: disabled
      )
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishForestDarkNotDisabled") {
  @Previewable @State var difficultyLevel: DifficultyLevelEnum = .low
  @Previewable @State var disabled: Bool = false

  PreviewContainerView {
    Form {
      ModifyProfileDifficultyLevelView(
        difficultyLevel: $difficultyLevel,
        disabled: disabled
      )
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishHarvestDarkNotDisabled") {
  @Previewable @State var difficultyLevel: DifficultyLevelEnum = .low
  @Previewable @State var disabled: Bool = false

  PreviewContainerView {
    Form {
      ModifyProfileDifficultyLevelView(
        difficultyLevel: $difficultyLevel,
        disabled: disabled
      )
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishMidnightDarkNotDisabled") {
  @Previewable @State var difficultyLevel: DifficultyLevelEnum = .low
  @Previewable @State var disabled: Bool = false

  PreviewContainerView {
    Form {
      ModifyProfileDifficultyLevelView(
        difficultyLevel: $difficultyLevel,
        disabled: disabled
      )
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.dark)
    }
  }
}
