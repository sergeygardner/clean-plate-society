//
//  StageNameView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 10.04.2026.
//

import SwiftData
import SwiftUI

struct StageNameView: View {
  @Environment(DataContainer.self) var dataContainer: DataContainer
  @Environment(ErrorManager.self) var errorManager: ErrorManager
  @EnvironmentObject var profile: Profile
  @State var viewModel: ViewModel = ViewModel()

  var next: () -> Void

  var body: some View {
    if let text = viewModel.societyRepository.tutorialStage1Text() {
      VStack(alignment: .leading) {
        Text(text)
          .fontTheme(.body)
          .foregroundStyleTheme(.text)
      }
      .padding()
    }

    Spacer()

    Form {
      Section {
        ModifyProfileNameView(name: $viewModel.name)
      }
      .listRowBackgroundTheme(.border)

      OathView(name: viewModel.name)
    }
    .scrollContentBackground(.hidden)

    ButtonView(
      type: .tutorialStage1,
      disabled: viewModel.name.isEmpty,
    ) {
      save()

      if profile.profileModelDTO != nil {
        next()
      } else {
        errorManager.trigger(.undefined)
      }
    }
  }

  func save() {
    let profileModel: ProfileModel = ProfileModel(
      name: viewModel.name,
      settings: SettingsModel(
        difficultyLevel: .low,
        haptic: true,
        sticker: .standard,
        theme: .formal,
      )
    )

    dataContainer.context.insert(profileModel)

    do {
      try dataContainer.context.save()

      profile.setProfileModel(profileModel)

      if let profileModelDTO = profile.profileModelDTO {
        viewModel.notificationRepository.send(
          profileModelDTO: profileModelDTO
        )
      }
    } catch {
      errorManager.trigger(.core(error))
    }
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      StageNameView(next: {
        print("Sent")
      })
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLight") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      StageNameView(next: {
        print("Sent")
      })
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLight") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      StageNameView(next: {
        print("Sent")
      })
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLight") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      StageNameView(next: {
        print("Sent")
      })
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLight") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      StageNameView(next: {
        print("Sent")
      })
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalDark") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      StageNameView(next: {
        print("Sent")
      })
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishRoyalDark") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      StageNameView(next: {
        print("Sent")
      })
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishForestDark") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      StageNameView(next: {
        print("Sent")
      })
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishHarvestDark") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      StageNameView(next: {
        print("Sent")
      })
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishMidnightDark") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      StageNameView(next: {
        print("Sent")
      })
      .sharedNavigation()
    }
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.dark)
  }
}
