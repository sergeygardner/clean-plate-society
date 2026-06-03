//
//  ErrorView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 20.04.2026.
//

import SwiftUI

struct ErrorView: View {
  @State var viewModel: ViewModel = ViewModel()

  let error: AppErrorEnum
  let onDismiss: () -> Void

  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 10) {
        SocietyHeaderView()
          .fixedSize()
        VStack(alignment: .leading, spacing: 10) {
          if let title = viewModel.societyRepository.errorTitle() {
            Text(title)
              .fontTheme(.headline)
              .foregroundStyleTheme(.text)
          }

          if let note1 = viewModel.societyRepository.errorNote1() {
            Text(note1)
              .fontTheme(.caption2)
              .foregroundStyleTheme(.text)
          }

          if let hello = viewModel.societyRepository.errorHello() {
            Text(hello)
              .fontTheme(.subheadlineBold)
              .foregroundStyleTheme(.text)
          }

          if let intro = viewModel.societyRepository.errorIntro() {
            Text(intro)
              .fontTheme(.caption)
              .foregroundStyleTheme(.text)
          }

          if let description = viewModel.societyRepository
            .errorDescription()
          {
            Text(description)
              .fontTheme(.title3)
              .foregroundStyleTheme(.text)
          }

          Text(error.localizedDescription)
            .fontTheme(.captionBold)
            .foregroundStyleTheme(.text)

          if let outro = viewModel.societyRepository.errorOutro() {
            Text(outro)
              .fontTheme(.caption)
              .foregroundStyleTheme(.text)
          }

          if let note2 = viewModel.societyRepository.errorNote2() {
            Text(note2)
              .fontTheme(.caption2LightSerif)
              .foregroundStyleTheme(.text)
          }

          ButtonView(
            type: .error,
          ) {
            onDismiss()
          }
        }
        .padding([.bottom, .horizontal])
        .frame(maxWidth: .infinity, alignment: .leading)
      }
      .borderTheme(.border)
      .backgroundTheme(.plain)
      .frame(minHeight: 200)
      .frame(maxWidth: .infinity)
      .padding()
    }
  }
}

#Preview("EnglishLight") {
  ErrorView(error: .core(URLError(.unknown))) {

  }
  .environmentObject(Profile.sampleEmpty)
  .preferredColorScheme(.light)
}

#Preview("EnglishFormalLight") {
  ErrorView(error: .core(URLError(.unknown))) {

  }
  .environmentObject(Profile.sampleFormalLow)
  .preferredColorScheme(.light)
}

#Preview("EnglishRoyalLight") {
  ErrorView(error: .core(URLError(.unknown))) {

  }
  .environmentObject(Profile.sampleRoyalLow)
  .preferredColorScheme(.light)
}

#Preview("EnglishForestLight") {
  ErrorView(error: .core(URLError(.unknown))) {

  }
  .environmentObject(Profile.sampleForestLow)
  .preferredColorScheme(.light)
}

#Preview("EnglishHarvestLight") {
  ErrorView(error: .core(URLError(.unknown))) {

  }
  .environmentObject(Profile.sampleHarvestLow)
  .preferredColorScheme(.light)
}

#Preview("EnglishMidnightLight") {
  ErrorView(error: .core(URLError(.unknown))) {

  }
  .environmentObject(Profile.sampleMidnightLow)
  .preferredColorScheme(.light)
}

#Preview("EnglishDark") {
  ErrorView(error: .core(URLError(.unknown))) {

  }
  .environmentObject(Profile.sampleEmpty)
  .preferredColorScheme(.dark)
}

#Preview("EnglishFormalDark") {
  ErrorView(error: .core(URLError(.unknown))) {

  }
  .environmentObject(Profile.sampleFormalLow)
  .preferredColorScheme(.dark)
}

#Preview("EnglishRoyalDark") {
  ErrorView(error: .core(URLError(.unknown))) {

  }
  .environmentObject(Profile.sampleRoyalLow)
  .preferredColorScheme(.dark)
}

#Preview("EnglishForestDark") {
  ErrorView(error: .core(URLError(.unknown))) {

  }
  .environmentObject(Profile.sampleForestLow)
  .preferredColorScheme(.dark)
}

#Preview("EnglishHarvestDark") {
  ErrorView(error: .core(URLError(.unknown))) {

  }
  .environmentObject(Profile.sampleHarvestLow)
  .preferredColorScheme(.dark)
}

#Preview("EnglishMidnightDark") {
  ErrorView(error: .core(URLError(.unknown))) {

  }
  .environmentObject(Profile.sampleMidnightLow)
  .preferredColorScheme(.dark)
}
