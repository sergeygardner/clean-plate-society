//
//  StickerUploadView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 01.04.2026.
//

import PhotosUI
import SwiftData
import SwiftUI

struct StickerUploadView: View {
  @Environment(DataContainer.self) var dataContainer: DataContainer
  @EnvironmentObject var profile: Profile
  @Query var stickerModels: [StickerModel]
  @State var viewModel: ViewModel = ViewModel()

  let sticker: StickerEnum
  let iconWidth: CGFloat = 25
  let iconHeight: CGFloat = 25

  init(
    sticker: StickerEnum,
  ) {
    self.sticker = sticker

    let stickerRawValue: String = sticker.rawValue

    _stickerModels = Query(
      filter: #Predicate<StickerModel> { sticker in
        sticker.stickerRawValue == stickerRawValue
      }
    )
  }

  var body: some View {
    VStack {
      HStack(alignment: .top) {
        if let oath = viewModel.societyRepository.stickerOath() {
          Text(oath)
            .fixedSize(horizontal: false, vertical: true)
            .fontTheme(.caption)
            .foregroundStyleTheme(.text)
        }

        Button {
          profile.setSticker(sticker)
        } label: {
          Image(systemName: "checkmark.circle")
            .resizable()
            .padding(.top, 3)
            .frame(width: iconWidth, height: iconHeight)
            .scaledToFit()
            .foregroundStyleTheme(.icon)
        }
        .buttonStyle(.plain)
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
        .disabled(activated())
        .opacity(activated() ? 0.5 : 1)
      }
      .padding(.horizontal)

      HStack(alignment: .top) {
        if let oath = viewModel.societyRepository.stickerUploadOath() {
          Text(oath)
            .fixedSize(horizontal: false, vertical: true)
            .fontTheme(.caption)
            .foregroundStyleTheme(.text)
        }

        VStack {
          switch viewModel.status {
          case .idle, .error:
            PhotosPicker(
              selection: $viewModel.selectedItems,
              maxSelectionCount: sticker.amount,
              matching: .images
            ) {
              Image(systemName: "photo.on.rectangle.angled")
                .resizable()
                .padding(.top, 3)
                .frame(width: iconWidth, height: iconHeight)
                .scaledToFit()
                .foregroundStyleTheme(.icon)
            }
            .onChange(of: viewModel.selectedItems) { _, newItems in
              if !newItems.isEmpty {
                Task {
                  await upload(from: newItems)
                }
              }
            }
          case .indexing:
            Button {
            } label: {
              ProgressView()
                .frame(width: iconWidth, height: iconHeight)
            }
            .buttonStyle(.plain)
            .fontTheme(.body)
            .foregroundStyleTheme(.text)
            .disabled(true)
            .opacity(0.5)
          case .completed:
            Button {
            } label: {
              Image(systemName: "arrow.up.circle")
                .resizable()
                .padding(.top, 3)
                .frame(width: iconWidth, height: iconHeight)
                .scaledToFit()
                .foregroundStyleTheme(.icon)
            }
            .buttonStyle(.plain)
            .fontTheme(.body)
            .foregroundStyleTheme(.text)
            .opacity(0.5)
            .disabled(true)
          }
        }
      }
      .padding(.horizontal)
    }
    .onAppear {
      viewModel.setStatus(
        sticker: sticker,
        actualAmount: stickerModels.count
      )
    }
  }
}

#Preview("EnglishFormalLightStandardNotDownloadedActive") {
  @Previewable @State var sticker: StickerEnum = StickerEnum.standard

  PreviewContainerView(
    PreviewContainerView.Samples(
      sticker: PreviewContainerView.sampleEmpty
    )
  ) {
    StickerUploadView(sticker: sticker)
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightStandardPartlyDownloadedActive") {
  @Previewable @State var sticker: StickerEnum = StickerEnum.standard

  PreviewContainerView(
    PreviewContainerView.Samples(
      sticker: PreviewContainerView.sampleStandardStickerHalf
    )
  ) {
    StickerUploadView(sticker: sticker)
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightStandardDownloadedActive") {
  @Previewable @State var sticker: StickerEnum = StickerEnum.standard

  PreviewContainerView {
    StickerUploadView(sticker: sticker)
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightBearsNotDownloadedNotActive") {
  @Previewable @State var sticker: StickerEnum = StickerEnum.bears

  PreviewContainerView(
    PreviewContainerView.Samples(
      sticker: PreviewContainerView.sampleEmpty
    )
  ) {
    StickerUploadView(sticker: sticker)
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightBearsDownloadedNotActive") {
  @Previewable @State var sticker: StickerEnum = StickerEnum.bears

  PreviewContainerView(
    PreviewContainerView.Samples(
      sticker: PreviewContainerView.sampleBearsStickerFull
    )
  ) {
    StickerUploadView(sticker: sticker)
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
  }
}
