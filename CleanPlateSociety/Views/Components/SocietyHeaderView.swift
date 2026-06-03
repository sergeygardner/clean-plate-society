//
//  SocietyHeaderView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 10.04.2026.
//

import SwiftUI

struct SocietyHeaderView: View {
  @State var viewModel: ViewModel = ViewModel()

  var body: some View {
    VStack {
      if let societyName = viewModel.societyRepository
        .name()
      {
        Text(societyName)
          .fontTheme(.title)
          .foregroundStyleTheme(.text)
          .padding()
      }

      if let societySloganLatin = viewModel.societyRepository
        .sloganLating()
      {
        Text(societySloganLatin)
          .fontTheme(.headline)
          .foregroundStyleTheme(.text)
          .padding(.horizontal)
      }

      if let societySlogan = viewModel.societyRepository.slogan() {
        Text(societySlogan)
          .fontTheme(.subheadlineLight)
          .foregroundStyleTheme(.text)
          .padding()
      }

      Divider()
        .padding()
    }
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    SocietyHeaderView()
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLight") {
  PreviewContainerView {
    SocietyHeaderView()
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLight") {
  PreviewContainerView {
    SocietyHeaderView()
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLight") {
  PreviewContainerView {
    SocietyHeaderView()
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLight") {
  PreviewContainerView {
    SocietyHeaderView()
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalDark") {
  PreviewContainerView {
    SocietyHeaderView()
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.dark)
  }
}

#Preview("EnglishRoyalDark") {
  PreviewContainerView {
    SocietyHeaderView()
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.dark)
  }
}

#Preview("EnglishForestDark") {
  PreviewContainerView {
    SocietyHeaderView()
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.dark)
  }
}

#Preview("EnglishHarvestDark") {
  PreviewContainerView {
    SocietyHeaderView()
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.dark)
  }
}

#Preview("EnglishMidnightDark") {
  PreviewContainerView {
    SocietyHeaderView()
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.dark)
  }
}
