//
//  Hexagon.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 17.04.2026.
//

import SwiftUI

struct StickerContentView: View {
  @State var viewModel: ViewModel = ViewModel()

  var borderWidth: CGFloat = 2.0
  var filename: String
  var sticker: StickerEnum?
  var layoutSize: CGFloat = 300

  var body: some View {
    VStack {
      Group {
        if let image = viewModel.image {
          Image(uiImage: image)
            .resizable()
            .scaledToFill()
            .frame(width: layoutSize, height: layoutSize)
            .borderTheme(sticker?.borderTheme ?? .border)
            .padding(35)
        } else {
          ProgressView()
            .frame(width: layoutSize, height: layoutSize)
            .foregroundStyleTheme(.icon)
            .padding(35)
            .onAppear {
              load()
            }
        }
      }
    }
    .borderTheme(.border)
    .backgroundTheme(.plain)
    .frame(maxWidth: .infinity)
  }

  func load() {
    if let image = viewModel.stickerManager.getCachedSticker(filename) {
      viewModel.image = image
    } else {
      DispatchQueue.global(qos: .userInteractive).async {
        let (image, error) = viewModel.stickerManager.cacheSticker(filename)

        if error == nil,
          let image = image
        {
          DispatchQueue.main.async {
            viewModel.image = image
          }
        }
      }
    }
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    StickerContentView(
      filename: StickerModel.sampleData.first!.filename,
      sticker: .standard,
    )
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLight") {
  PreviewContainerView {
    StickerContentView(
      filename: StickerModel.sampleData.first!.filename,
      sticker: .standard,
    )
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLight") {
  PreviewContainerView {
    StickerContentView(
      filename: StickerModel.sampleData.first!.filename,
      sticker: .standard,
    )
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLight") {
  PreviewContainerView {
    StickerContentView(
      filename: StickerModel.sampleData.first!.filename,
      sticker: .standard,
    )
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLight") {
  PreviewContainerView {
    StickerContentView(
      filename: StickerModel.sampleData.first!.filename,
      sticker: .standard,
    )
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.light)
  }
}
