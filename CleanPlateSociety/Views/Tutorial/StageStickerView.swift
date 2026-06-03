//
//  StageStickerView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 10.04.2026.
//

import SwiftUI

struct StageStickerView: View {
  @EnvironmentObject var profile: Profile
  @State var viewModel: ViewModel = ViewModel()

  var next: () -> Void

  var body: some View {
    ScrollView {
      VStack {
        if let text = viewModel.societyRepository.tutorialStage3Title() {
          VStack(alignment: .leading) {
            Text(text)
              .fontTheme(.headline)
              .foregroundStyleTheme(.text)
          }
        }

        if let text = viewModel.societyRepository
          .tutorialStage3Description1()
        {
          VStack(alignment: .leading) {
            Text(text)
              .fontTheme(.subheadline)
              .foregroundStyleTheme(.text)
          }
          .padding(.vertical)
        }

        if let text = viewModel.societyRepository
          .tutorialStage3Description2()
        {
          VStack(alignment: .leading) {
            Text(text)
              .fontTheme(.subheadline)
              .foregroundStyleTheme(.text)
          }
        }
      }
      .padding()

      ForEach(StickerEnum.all(withManual: false), id: \.self) { sticker in
        StickerView(
          sticker: sticker
        ) {

        }
        .padding()
      }

      ButtonView(
        type: .tutorialStage3,
      ) {
        next()
      }
      .padding()
    }
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    StageStickerView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLight") {
  PreviewContainerView {
    StageStickerView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLight") {
  PreviewContainerView {
    StageStickerView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLight") {
  PreviewContainerView {
    StageStickerView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLight") {
  PreviewContainerView {
    StageStickerView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalDark") {
  PreviewContainerView {
    StageStickerView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishRoyalDark") {
  PreviewContainerView {
    StageStickerView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishForestDark") {
  PreviewContainerView {
    StageStickerView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishHarvestDark") {
  PreviewContainerView {
    StageStickerView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishMidnightDark") {
  PreviewContainerView {
    StageStickerView(next: {
      print("Sent")
    })
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.dark)
  }
}
