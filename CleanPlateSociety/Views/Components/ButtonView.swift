//
//  ButtonView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 15.04.2026.
//

import SwiftUI

struct ButtonView: View {
  @State var viewModel: ViewModel

  var paddingHorizontal: CGFloat
  var paddingVertical: CGFloat
  var maxWidth: CGFloat
  var disabled: Bool
  var text: String?
  var command: () -> Void

  init(
    type: ViewModel.TypeEnum = .agree,
    paddingHorizontal: CGFloat = 50,
    paddingVertical: CGFloat = 10,
    maxWidth: CGFloat = .infinity,
    disabled: Bool = false,
    text: String? = nil,
    command: @escaping () -> Void
  ) {
    self.paddingHorizontal = paddingHorizontal
    self.paddingVertical = paddingVertical
    self.maxWidth = maxWidth
    self.text = text
    self.disabled = disabled
    self.command = command

    _viewModel = State(wrappedValue: ViewModel(type: type))
  }

  var body: some View {
    Button {
      command()
    } label: {
      label
    }
    .backgroundTheme(viewModel.getTheme())
    .frame(maxWidth: maxWidth)
    .disabled(disabled)
  }

  @ViewBuilder private var label: some View {
    switch viewModel.type {
    case .agree, .clear, .error, .tutorialStage1, .tutorialStage2, .tutorialStage3,
      .tutorialStage4:
      VStack {
        if let text = viewModel.getText() {
          Text(text)
            .foregroundStyleTheme(.text)
            .padding([.leading, .trailing], paddingHorizontal)
            .padding([.top, .bottom], paddingVertical)
        } else {
          EmptyView()
        }
      }
    case .profile:
      VStack {
        Image(systemName: "person.crop.circle")
          .resizable()
          .scaledToFit()
          .padding(.horizontal, paddingHorizontal)
          .padding(.top, paddingVertical)
          .foregroundStyleTheme(.icon)
          .overlay(alignment: .topTrailing) {
            CrownView(
              width: 50,
              height: 50,
              offsetX: -25,
              offsetY: -16,
              rorateDegree: 42
            )
          }

        if let text = text {
          Text(text)
            .padding(.bottom, paddingVertical)
            .foregroundStyleTheme(.text)
        }
      }
    case .subscription:
      if let text = text {
        Text(text)
          .foregroundStyleTheme(.text)
          .padding([.leading, .trailing], paddingHorizontal)
          .padding([.top, .bottom], paddingVertical)
      } else {
        EmptyView()
      }
    case .save:
      Image(systemName: "checkmark.circle")
        .fontTheme(.title3Bold)
        .foregroundStyleTheme(.toolbarIcon)
    case .dismiss:
      Image(systemName: "x.circle")
        .fontTheme(.title3Bold)
        .foregroundStyleTheme(.toolbarIcon)
    //        @unknown default:
    //            VStack {
    //                EmptyView()
    //            }
    }
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    Form {
      ButtonView(type: .agree) {

      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishFormalLightProfile") {
  PreviewContainerView {
    ScrollView {
      ButtonView(type: .profile, text: "Test") {

      }
      .frame(width: 200, height: 200)
      .padding()
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
      Spacer()
    }
  }
}

#Preview("EnglishRoyalLight") {
  PreviewContainerView {
    Form {
      ButtonView(type: .agree) {

      }
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishForestLight") {
  PreviewContainerView {
    Form {
      ButtonView(type: .agree) {

      }
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishHarvestLight") {
  PreviewContainerView {
    Form {
      ButtonView(type: .agree) {

      }
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishMidnightLight") {
  PreviewContainerView {
    Form {
      ButtonView(type: .agree) {

      }
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishFormalDark") {
  PreviewContainerView {
    Form {
      ButtonView(type: .agree) {

      }
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishRoyalDark") {
  PreviewContainerView {
    Form {
      ButtonView(type: .agree) {

      }
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishForestDark") {
  PreviewContainerView {
    Form {
      ButtonView(type: .agree) {

      }
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishHarvestDark") {
  PreviewContainerView {
    Form {
      ButtonView(type: .agree) {

      }
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishMidnightDark") {
  PreviewContainerView {
    Form {
      ButtonView(type: .agree) {

      }
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.dark)
    }
  }
}
