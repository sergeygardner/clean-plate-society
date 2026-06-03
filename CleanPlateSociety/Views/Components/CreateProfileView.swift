//
//  SwiftUIView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 10.04.2026.
//

import SwiftUI

struct CreateProfileView: View {
  @EnvironmentObject var profile: Profile

  var amount: Int

  var body: some View {
    if profile.hasPerkProfile(amount: amount) {
      NavigationLink(value: NavigationEnum.createProfile) {
        VStack {
          Image(systemName: "plus.circle")
            .foregroundStyleTheme(.icon)
            .padding(.top, 3)
          Text("profile.create.text")
            .foregroundStyleTheme(.text)
        }
      }
    }
  }
}

#Preview("EnglishLightEmpty") {
  PreviewContainerView {
    NavigationStack {
      CreateProfileView(amount: 0)
    }
    .environmentObject(Profile.sampleEmpty)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    NavigationStack {
      CreateProfileView(amount: 1)
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightFull") {
  PreviewContainerView {
    NavigationStack {
      CreateProfileView(amount: 3)
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLight") {
  PreviewContainerView {
    NavigationStack {
      CreateProfileView(amount: 1)
    }
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLight") {
  PreviewContainerView {
    NavigationStack {
      CreateProfileView(amount: 1)
    }
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLight") {
  PreviewContainerView {
    NavigationStack {
      CreateProfileView(amount: 1)
    }
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLight") {
  PreviewContainerView {
    NavigationStack {
      CreateProfileView(amount: 1)
    }
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightGold") {
  PreviewContainerView {
    NavigationStack {
      CreateProfileView(amount: 4)
    }
    .environmentObject(Profile.sampleFormalLowGold)
    .preferredColorScheme(.light)
  }
}
