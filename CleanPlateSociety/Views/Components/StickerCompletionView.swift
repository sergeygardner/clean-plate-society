//
//  StickerCompletionView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 16.04.2026.
//

import SwiftUI

struct StickerCompletionView<Content: View>: View {
  @EnvironmentObject var profile: Profile
  @State var viewModel: ViewModel = ViewModel()

  @ViewBuilder let content: () -> Content

  var body: some View {
    VStack(spacing: 15) {
      VStack(spacing: 10) {
        if let title1 = viewModel.societyRepository
          .stickersOutOfDataTitle1()
        {
          Text(title1)
            .padding([.top, .horizontal])
            .fontTheme(.headline)
            .foregroundStyleTheme(.text)
        }

        if let title2 = viewModel.societyRepository
          .stickersOutOfDataTitle2()
        {
          Text(title2)
            .padding(.horizontal)
            .fontTheme(.headline)
            .foregroundStyleTheme(.text)
        }

        if let note = viewModel.societyRepository
          .stickersOutOfDataNote()
        {
          Text(note)
            .padding(.horizontal)
            .fontTheme(.caption)
            .foregroundStyleTheme(.text)
        }
      }

      if let name = profile.profileModelDTO?.name,
        let description1 = viewModel.societyRepository
          .stickersOutOfDataDescription1(name: name)
      {
        Text(description1)
          .padding(.horizontal)
          .fontTheme(.footnote)
          .foregroundStyleTheme(.text)
      }

      if let description2 = viewModel.societyRepository
        .stickersOutOfDataDescription2()
      {
        Text(description2)
          .padding(.horizontal)
          .fontTheme(.footnote)
          .foregroundStyleTheme(.text)
      }

      if let footnote = viewModel.societyRepository
        .stickersOutOfDataFootnote()
      {
        Text(footnote)
          .padding(.horizontal)
          .fontTheme(.caption)
          .foregroundStyleTheme(.text)
      }

      ChancellorSignatureView()
        .overlay(alignment: .leading) {
          ChancellorSealView()
            .padding()
        }

      if let engagement = viewModel.societyRepository
        .stickersOutOfDataEngagement()
      {
        Text(engagement)
          .padding(.horizontal)
          .fontTheme(.headline)
          .foregroundStyleTheme(.text)
      }

      VStack {
        content()
          .padding([.horizontal, .bottom])
      }
    }
    .borderTheme(.border)
    .backgroundTheme(.plain)
    .frame(minHeight: 200)
    .frame(maxWidth: .infinity)
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    StickerCompletionView {
      Text("Content")
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLight") {
  PreviewContainerView {
    StickerCompletionView {
      Text("Content")
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
    }
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLight") {
  PreviewContainerView {
    StickerCompletionView {
      Text("Content")
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
    }
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLight") {
  PreviewContainerView {
    StickerCompletionView {
      Text("Content")
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
    }
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLight") {
  PreviewContainerView {
    StickerCompletionView {
      Text("Content")
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
    }
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalDark") {
  PreviewContainerView {
    StickerCompletionView {
      Text("Content")
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishRoyalDark") {
  PreviewContainerView {
    StickerCompletionView {
      Text("Content")
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
    }
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishForestDark") {
  PreviewContainerView {
    StickerCompletionView {
      Text("Content")
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
    }
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishHarvestDark") {
  PreviewContainerView {
    StickerCompletionView {
      Text("Content")
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
    }
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishMidnightDark") {
  PreviewContainerView {
    StickerCompletionView {
      Text("Content")
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
    }
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.dark)
  }
}
