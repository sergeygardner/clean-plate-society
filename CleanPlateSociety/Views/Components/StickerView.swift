//
//  StickerView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 16.04.2026.
//

import SwiftUI

struct StickerView<Content: View>: View {
  @EnvironmentObject var profile: Profile
  @State var viewModel: ViewModel = ViewModel()

  let sticker: StickerEnum

  @ViewBuilder let content: () -> Content

  let stickerMinHeight: CGFloat = 200
  let stickerImageWidth: CGFloat = 150
  let stickerImageHeight: CGFloat = 150

  var body: some View {
    VStack(spacing: 10) {

      VStack(spacing: 10) {
        if let title = viewModel.societyRepository
          .stickerTitle(sticker: sticker)
        {
          Text(title)
            .padding([.top, .horizontal])
            .fontTheme(.headline)
            .foregroundStyleTheme(.text)
        }

        if let note = viewModel.societyRepository
          .stickerNote(sticker: sticker)
        {
          Text(note)
            .padding(.horizontal)
            .fontTheme(.caption)
            .foregroundStyleTheme(.text)
        }
      }

      if let image = viewModel.image {
        Image(
          uiImage: image
        )
        .resizable()
        .scaledToFit()
        .frame(width: stickerImageWidth, height: stickerImageHeight)
        .borderTheme(.border)
      } else {
        VStack {
          ProgressView()
        }
        .frame(width: stickerImageWidth, height: stickerImageHeight)
        .borderTheme(.border)
        .onAppear {
          Task {
            await load()
          }
        }
      }
      HStack(alignment: .top) {
        if let vibe = viewModel.societyRepository
          .stickerVibe()
        {
          Text(vibe)
            .fontTheme(.footnote)
            .foregroundStyleTheme(.text)
        }

        if let vibed = viewModel.societyRepository
          .stickerVibed(sticker: sticker)
        {
          Text(vibed)
            .fixedSize(horizontal: false, vertical: true)
            .fontTheme(.footnote)
            .foregroundStyleTheme(.text)
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.horizontal)

      HStack(alignment: .top) {
        if let hook = viewModel.societyRepository
          .stickerHook()
        {
          Text(hook)
            .fontTheme(.footnote)
            .foregroundStyleTheme(.text)
        }

        if let hooked = viewModel.societyRepository
          .stickerHooked(sticker: sticker)
        {
          Text(hooked)
            .fixedSize(horizontal: false, vertical: true)
            .fontTheme(.footnote)
            .foregroundStyleTheme(.text)
        }
      }
      .frame(maxWidth: .infinity, alignment: .leading)
      .padding(.horizontal)

      ChancellorSignatureView()
        .overlay(alignment: .leading) {
          ChancellorSealView()
            .padding()
        }

      if sticker.isManual() {
        VStack {
          StickerUploadView(sticker: sticker)
        }
      } else {
        VStack {
          StickerDownloadView(sticker: sticker)
        }
      }

      VStack {
        content()
          .padding([.horizontal, .bottom])
      }
    }
    .borderTheme(.border)
    .backgroundTheme(.plain)
    .frame(minHeight: stickerMinHeight)
    .frame(maxWidth: .infinity)
    .padding()
  }

  func load() async {
    if let image = viewModel.stickerManager.getCachedSticker(sticker) {
      viewModel.image = image
    } else {
      let (image, error) = await viewModel.stickerManager.cacheSticker(sticker)

      if error == nil,
        let image = image
      {
        DispatchQueue.main.async {
          viewModel.image = image
        }
      } else {
        if let error = error {
          viewModel.notificationRepository.send(errorDTO: ErrorDTO(error: .sticker(error)))
        } else {
          viewModel.notificationRepository.send(errorDTO: ErrorDTO(error: .undefined))
        }
      }
    }
  }
}

#Preview("EnglishFormalLightStandardDownloadedChoosen") {
  PreviewContainerView {
    NavigationStack {
      StickerView(sticker: .standard) {
        Form {
          Section {
            StickerChooserView(sticker: .constant(StickerEnum.standard))
          }
          .listRowSeparator(.hidden)
        }
        .padding(0)
        .scrollContentBackground(.hidden)
        .listStyle(.plain)
      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishFormalLightStandardNotDownloadedChoosen") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      StickerView(sticker: .standard) {
        Text("Content")
          .fontTheme(.body)
          .foregroundStyleTheme(.text)

      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishFormalLightBearsDownloadedNotChoosen") {
  PreviewContainerView {
    NavigationStack {
      StickerView(sticker: .bears) {
        Text("Content")
          .fontTheme(.body)
          .foregroundStyleTheme(.text)

      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishFormalLightBearsNotDownloadedNotChoosen") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      StickerView(sticker: .bears) {
        Text("Content")
          .fontTheme(.body)
          .foregroundStyleTheme(.text)

      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }
  }
}
