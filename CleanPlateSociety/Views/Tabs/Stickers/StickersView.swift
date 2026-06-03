//
//  StickersView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 20.03.2026.
//

import SwiftUI

struct StickersView: View {
  @Environment(DataContainer.self) var dataContainer
  @EnvironmentObject var profile: Profile

  var body: some View {
    ScrollView {
      LazyVStack(spacing: 10) {
        ForEach(StickerEnum.all(withManual: profile.hasPerkManualStickers()), id: \.self) {
          sticker in
          StickerView(
            sticker: sticker
          ) {

          }
        }
      }
      VStack {

      }
      .padding(.bottom, AppConfigDTO.viewScrollBottomPadding)
    }
  }
}

#Preview("EnglishFormalLightStandardDownloaded") {
  PreviewContainerView {
    NavigationStack {
      StickersView()
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightGoldStandardDownloaded") {
  PreviewContainerView {
    NavigationStack {
      StickersView()
    }
    .environmentObject(Profile.sampleFormalLowGold)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightBearsDownloaded") {
  PreviewContainerView(
    PreviewContainerView.Samples(
      sticker: PreviewContainerView.sampleBearsStickerFull
    )
  ) {
    NavigationStack {
      StickersView()
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightStandardNotDownloaded") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      StickersView()
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLightStandardNotDownloaded") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      StickersView()
    }
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLightStandardNotDownloaded") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      StickersView()
    }
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLightStandardNotDownloaded") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      StickersView()
    }
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLightStandardNotDownloaded") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      StickersView()
    }
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.light)
  }
}
