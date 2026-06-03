//
//  AwardView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 02.04.2026.
//

import SwiftData
import SwiftUI

struct AwardDetailView: View {
  @Environment(\.locale) var locale: Locale
  @EnvironmentObject var profile: Profile
  @State var viewModel: ViewModel = ViewModel()

  let award: AwardEnum
  let awardModel: AwardModel?
  let name: String

  var body: some View {
    VStack {
      if let section = viewModel.getSection(
        id: award
      ) {
        VStack(alignment: .center) {
          Text(section)
            .fontTheme(.title3)
            .foregroundStyleTheme(.text)
          Image(systemName: "fork.knife.circle")
            .resizable()
            .padding(.top, 3)
            .frame(width: 50, height: 50)
            .scaledToFit()
            .padding()
            .foregroundStyleTheme(.icon)
        }
        .padding([.leading, .top, .trailing], 20)
      }

      VStack(alignment: .center) {
        Text("certificate.award")
          .fontTheme(.title2)
          .foregroundStyleTheme(.text)
        Text(award.rawValue)
          .fontTheme(.title2)
          .foregroundStyleTheme(.text)
      }
      .padding([.leading, .bottom, .trailing])

      VStack(alignment: .center) {
        Text("certify.that")
          .fontTheme(.subheadline)
          .foregroundStyleTheme(.text)
        Text(name)
          .fontTheme(.subheadlineBold)
          .foregroundStyleTheme(.text)
      }
      .frame(maxWidth: .infinity, alignment: .center)
      .padding([.top, .leading])

      if let difficultyLevel = profile.profileModelDTO?.settings
        .difficultyLevel,
        let commitment = viewModel.societyRepository
          .difficultyLevelTitle(difficultyLevel: difficultyLevel)
      {
        VStack(alignment: .center) {
          Text("commitment.of")
            .fontTheme(.subheadline)
            .foregroundStyleTheme(.text)
          Text(commitment)
            .fontTheme(.subheadlineBold)
            .foregroundStyleTheme(.text)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding([.leading])
      }

      if let title = viewModel.getTitle(
        id: award
      ) {
        VStack(alignment: .center) {
          Text("title.of")
            .fontTheme(.subheadline)
            .foregroundStyleTheme(.text)
          Text(title)
            .fontTheme(.subheadlineBold)
            .foregroundStyleTheme(.text)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding([.bottom, .leading])
      }

      if let description = viewModel.getDescription(
        id: award
      ) {
        VStack(alignment: .center) {
          Text("for")
            .fontTheme(.bodyLightItalic)
            .foregroundStyleTheme(.text)
          Text(description)
            .fontTheme(.bodyLightItalic)
            .foregroundStyleTheme(.text)
        }
        .frame(maxWidth: .infinity)
        .multilineTextAlignment(.center)
        .padding()
      }

      if let tags = viewModel.getTags(
        id: award
      ) {
        HStack(alignment: .firstTextBaseline) {
          ForEach(tags, id: \.self) { tag in
            Text("#" + tag)
              .fontTheme(.caption2)
              .foregroundStyleTheme(.text)
          }
        }
        .padding()
      }

      if let awardModel = awardModel {
        ChancellorSignatureView()

        if let chancellorSignedAndSealed = viewModel.societyRepository
          .chancellorSignedAndSealed()
        {
          HStack(alignment: .firstTextBaseline) {
            Text(chancellorSignedAndSealed)
              .fontTheme(.caption2)
              .foregroundStyleTheme(.text)
            Text(
              awardModel.timestamp.formatted(
                .dateTime.locale(locale).year()
                  .month().day().hour()
                  .minute()
              )
            )
            .fontTheme(.caption2)
            .foregroundStyleTheme(.text)
          }
          .padding([.bottom, .leading])
        }
      }
    }
    .borderTheme(.border)
    .backgroundTheme(.plain)
    .frame(minHeight: 200)
    .frame(maxWidth: .infinity)
    .padding()
    .opacity(
      awardModel == nil ? 0.5 : 1
    )
    .blur(
      radius: awardModel == nil ? 4 : 0
    )
    .overlay(alignment: .bottomTrailing) {
      if awardModel != nil {
        ChancellorSealView()
          .padding()
      }
    }
  }
}

#Preview("EnglishFormalLightAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: AwardModel.sampleData[0],
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLightAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: AwardModel.sampleData[0],
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLightAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: AwardModel.sampleData[0],
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLightAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: AwardModel.sampleData[0],
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLightAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: AwardModel.sampleData[0],
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightNotAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: nil,
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLightNotAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: nil,
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLightNotAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: nil,
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLightNotAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: nil,
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLightNotAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: nil,
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalDarkAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: AwardModel.sampleData[0],
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishRoyalDarkAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: AwardModel.sampleData[0],
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishForestDarkAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: AwardModel.sampleData[0],
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishHarvestDarkAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: AwardModel.sampleData[0],
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishMidnightDarkAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: AwardModel.sampleData[0],
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishFormalDarkNotAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: nil,
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishRoyalDarkNotAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: nil,
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishForestDarkNotAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: nil,
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishHarvestDarkNotAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: nil,
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishMidnightDarkNotAchieved") {
  PreviewContainerView {
    AwardDetailView(
      award: AwardEnum.level1,
      awardModel: nil,
      name: Profile.sampleFormalLow.profileModel!.name
    )
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.dark)
  }
}
