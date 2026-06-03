//
//  ChancellorSignatureView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 17.04.2026.
//

import SwiftUI

struct ChancellorSignatureView: View {
  @State var viewModel: ViewModel = ViewModel()

  var body: some View {
    VStack {
      if let chancellorName = viewModel.societyRepository
        .chancellorName()
      {
        HStack(alignment: .firstTextBaseline) {
          Text("signature")
            .fontTheme(.caption2LightSerif)
            .foregroundStyleTheme(.text)
          Text(chancellorName)
            .fontTheme(.caption2LightSerif)
            .foregroundStyleTheme(.text)
        }
        .padding([.leading])
      }
    }
  }
}

#Preview("EnglishFormalLight") {
  ChancellorSignatureView()
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
}

#Preview("EnglishRoyalLight") {
  ChancellorSignatureView()
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.light)
}

#Preview("EnglishForestLight") {
  ChancellorSignatureView()
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.light)
}

#Preview("EnglishHarvestLight") {
  ChancellorSignatureView()
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.light)
}

#Preview("EnglishMidnightLight") {
  ChancellorSignatureView()
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.light)
}

#Preview("EnglishFormalDark") {
  ChancellorSignatureView()
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.dark)
}

#Preview("EnglishRoyalDark") {
  ChancellorSignatureView()
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.dark)
}

#Preview("EnglishForestDark") {
  ChancellorSignatureView()
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.dark)
}

#Preview("EnglishHarvestDark") {
  ChancellorSignatureView()
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.dark)
}

#Preview("EnglishMidnightDark") {
  ChancellorSignatureView()
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.dark)
}
