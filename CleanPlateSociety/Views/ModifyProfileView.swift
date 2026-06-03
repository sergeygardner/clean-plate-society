//
//  ModifyProfileView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 19.03.2026.
//

import SwiftData
import SwiftUI

struct ModifyProfileView: View {
  @Environment(DataContainer.self) var dataContainer
  @Environment(\.dismiss) var dismiss
  @EnvironmentObject var profile: Profile
  @State var viewModel: ViewModel

  init(new: Bool) {
    _viewModel = State(wrappedValue: ViewModel(disabled: !new))
  }

  var body: some View {
    VStack(alignment: .leading) {
      Form {
        Section(
          header: Text("settings.main")
            .fontTheme(.body)
            .foregroundStyleTheme(.text)
        ) {
          ModifyProfileNameView(name: $viewModel.name)

          ModifyProfileThemeView(theme: $viewModel.theme)
            .onChange(of: viewModel.theme) {
              viewModel.themeChanged()
            }

          ModifyProfileDifficultyLevelView(
            difficultyLevel: $viewModel.difficultyLevel,
            disabled: viewModel.disabled
          )

          StickerChooserView(sticker: $viewModel.sticker)
        }
        .listRowBackgroundTheme(.list)

        Section(
          header: Text("settings.additional")
            .fontTheme(.body)
            .foregroundStyleTheme(.text)
        ) {
          HStack(alignment: .top) {
            Image(
              systemName:
                "iphone.radiowaves.left.and.right"
            )
            .foregroundStyleTheme(.icon)

            Toggle(isOn: $viewModel.haptic) {
              Text("settings.haptic.text")
                .fontTheme(.body)
                .foregroundStyleTheme(.text)
            }
          }
          .alignmentGuide(.listRowSeparatorLeading) { d in d[.leading]
          }

          HStack(alignment: .top) {
            ButtonView(
              type: .clear,
            ) {
              viewModel.imageCacheManager.clear()

              if let message = viewModel.mainRepository.clearCache() {
                viewModel.notificationRepository.send(
                  serviceMessage: ServiceMessageDTO(
                    message: message
                  ))
              }
            }
          }
        }
        .listRowBackgroundTheme(.list)

        OathView(name: viewModel.name)
          .listRowBackgroundTheme(.list)

        HStack {

        }
      }
      .padding()
      .frame(maxWidth: .infinity, alignment: .leading)
      .scrollContentBackground(.hidden)
    }
    .onAppear {
      viewModel.reset(profileModelDTO: profile.profileModelDTO)
    }
    .navigationTitle("settings.text")
    .toolbarTheme(.navigationTitle)
    .toolbar {
      ToolbarItem(placement: .topBarTrailing) {
        ButtonView(type: .save, maxWidth: 30) {
          save()

          dismiss()
        }
      }
    }
    .toolbar {
      ToolbarItem(placement: .topBarTrailing) {
        ButtonView(type: .dismiss, maxWidth: 30) {
          viewModel.reset(profileModelDTO: profile.profileModelDTO)

          dismiss()
        }
      }
    }
  }
}

#Preview("EnglishLightWithoutData") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    ModifyProfileView(new: true)
      .environmentObject(Profile.sampleEmpty)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightWithData") {
  PreviewContainerView {
    ModifyProfileView(new: false)
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
  }
}
