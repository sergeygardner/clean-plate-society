//
//  WisdomView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 05.05.2026.
//

import SwiftUI

struct WisdomView: View {
  @State var viewModel: ViewModel = ViewModel()

  var body: some View {
    ScrollView {
      NavigationLink(value: RulesViewDTO()) {
        VStack(spacing: 10) {
          if let text = viewModel.societyRepository.rulesIntroductionTitle() {
            Text(text)
              .fontTheme(.headline)
              .foregroundStyleTheme(.text)
          }

          if let text = viewModel.societyRepository.rulesIntroductionNote() {
            Text(text)
              .fontTheme(.subheadline)
              .foregroundStyleTheme(.text)
          }

          if let text = viewModel.societyRepository.rulesIntroduction() {
            Text(text)
              .fontTheme(.body)
              .foregroundStyleTheme(.text)
          }

          Image(systemName: "document.circle")
            .resizable()
            .scaledToFit()
            .foregroundStyleTheme(.icon)
            .frame(width: 200, height: 200)
            .padding()
        }
        .padding()
      }
      .borderTheme(.border)
      .backgroundTheme(.plain)
      .frame(minHeight: 500)
      .frame(maxWidth: .infinity)
      .padding()

      NavigationLink(value: SubscriptionViewDTO()) {
        VStack(spacing: 10) {
          if let text = viewModel.societyRepository.subscriptionIntroductionTitle() {
            Text(text)
              .fontTheme(.headline)
              .foregroundStyleTheme(.text)
          }

          if let text = viewModel.societyRepository.subscriptionIntroductionNote() {
            Text(text)
              .fontTheme(.subheadline)
              .foregroundStyleTheme(.text)
          }

          if let text = viewModel.societyRepository.subscriptionIntroduction() {
            Text(text)
              .fontTheme(.body)
              .foregroundStyleTheme(.text)
          }

          Image(systemName: "creditcard.circle")
            .resizable()
            .scaledToFit()
            .foregroundStyleTheme(.icon)
            .frame(width: 200, height: 200)
            .padding()
        }
        .padding()
      }
      .borderTheme(.border)
      .backgroundTheme(.plain)
      .frame(minHeight: 500)
      .frame(maxWidth: .infinity)
      .padding()

      NavigationLink(value: PrivacyPolicyViewDTO()) {
        VStack(spacing: 10) {
          if let text = viewModel.societyRepository.privacyPolicyIntroductionTitle() {
            Text(text)
              .fontTheme(.headline)
              .foregroundStyleTheme(.text)
          }

          if let text = viewModel.societyRepository.privacyPolicyIntroductionNote() {
            Text(text)
              .fontTheme(.subheadline)
              .foregroundStyleTheme(.text)
          }

          if let text = viewModel.societyRepository.privacyPolicyIntroduction() {
            Text(text)
              .fontTheme(.body)
              .foregroundStyleTheme(.text)
          }

          Image(systemName: "lock.shield.fill")
            .resizable()
            .scaledToFit()
            .foregroundStyleTheme(.icon)
            .frame(width: 200, height: 200)
            .padding()
        }
        .padding()
      }
      .borderTheme(.border)
      .backgroundTheme(.plain)
      .frame(minHeight: 500)
      .frame(maxWidth: .infinity)
      .padding()

      VStack {

      }
      .padding(.bottom, AppConfigDTO.viewScrollBottomPadding)
    }
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    NavigationStack {
      WisdomView()
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishRoyalLight") {
  PreviewContainerView {
    NavigationStack {
      WisdomView()
        .environmentObject(Profile.sampleRoyalLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishForestLight") {
  PreviewContainerView {
    NavigationStack {
      WisdomView()
        .environmentObject(Profile.sampleForestLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishHarvestLight") {
  PreviewContainerView {
    NavigationStack {
      WisdomView()
        .environmentObject(Profile.sampleHarvestLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishMidnightLight") {
  PreviewContainerView {
    NavigationStack {
      WisdomView()
        .environmentObject(Profile.sampleMidnightLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishFormalDark") {
  PreviewContainerView {
    NavigationStack {
      WisdomView()
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishRoyalDark") {
  PreviewContainerView {
    NavigationStack {
      WisdomView()
        .environmentObject(Profile.sampleRoyalLow)
        .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishForestDark") {
  PreviewContainerView {
    NavigationStack {
      WisdomView()
        .environmentObject(Profile.sampleForestLow)
        .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishHarvestDark") {
  PreviewContainerView {
    NavigationStack {
      WisdomView()
        .environmentObject(Profile.sampleHarvestLow)
        .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishMidnightDark") {
  PreviewContainerView {
    NavigationStack {
      WisdomView()
        .environmentObject(Profile.sampleMidnightLow)
        .preferredColorScheme(.dark)
    }
  }
}
