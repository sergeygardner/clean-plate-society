//
//  StickerChooserView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 02.04.2026.
//

import SwiftUI

struct StickerChooserView: View {
  @Binding var sticker: StickerEnum
  @EnvironmentObject var profile: Profile
  @State var viewModel: ViewModel = ViewModel()

  var withSpacer: Bool = true

  var body: some View {
    HStack(alignment: .firstTextBaseline) {
      HStack(alignment: .firstTextBaseline) {
        Image(
          systemName:
            "photo.stack"
        )
        .foregroundStyleTheme(.icon)
        Text("settings.sticker.text")
          .fontTheme(.body)
          .foregroundStyleTheme(.text)
      }
      //      .padding(5)

      if withSpacer {
        Spacer()
      }

      Picker(selection: $sticker) {
        ForEach(StickerEnum.all(withManual: profile.hasPerkManualStickers()), id: \.self) {
          sticker in
          if let text = viewModel.societyRepository.stickerName(sticker: sticker) {
            Text(text)
              .fontTheme(.body)
              .foregroundStyleTheme(.text)
          }
        }
      } label: {

      }
      .pickerStyle(.menu)
      .tintTheme(.text)
      .alignmentGuide(.listRowSeparatorLeading) { d in d[.leading] }
    }
  }
}

#Preview("EnglishFormalLight") {
  @Previewable @State var sticker: StickerEnum = .standard

  PreviewContainerView {
    StickerChooserView(sticker: $sticker)
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLight") {
  @Previewable @State var sticker: StickerEnum = .standard

  PreviewContainerView {
    StickerChooserView(sticker: $sticker)
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLight") {
  @Previewable @State var sticker: StickerEnum = .standard

  PreviewContainerView {
    StickerChooserView(sticker: $sticker)
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLight") {
  @Previewable @State var sticker: StickerEnum = .standard

  PreviewContainerView {
    StickerChooserView(sticker: $sticker)
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLight") {
  @Previewable @State var sticker: StickerEnum = .standard

  PreviewContainerView {
    StickerChooserView(sticker: $sticker)
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightForm") {
  @Previewable @State var sticker: StickerEnum = .standard

  PreviewContainerView {
    Form {
      StickerChooserView(sticker: $sticker)
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishRoyalLightForm") {
  @Previewable @State var sticker: StickerEnum = .standard

  PreviewContainerView {
    Form {
      StickerChooserView(sticker: $sticker)
        .environmentObject(Profile.sampleRoyalLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishForestLightForm") {
  @Previewable @State var sticker: StickerEnum = .standard

  PreviewContainerView {
    Form {
      StickerChooserView(sticker: $sticker)
        .environmentObject(Profile.sampleForestLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishHarvestLightForm") {
  @Previewable @State var sticker: StickerEnum = .standard

  PreviewContainerView {
    Form {
      StickerChooserView(sticker: $sticker)
        .environmentObject(Profile.sampleHarvestLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishMidnightLightForm") {
  @Previewable @State var sticker: StickerEnum = .standard

  PreviewContainerView {
    Form {
      StickerChooserView(sticker: $sticker)
        .environmentObject(Profile.sampleMidnightLow)
        .preferredColorScheme(.light)
    }
  }
}
