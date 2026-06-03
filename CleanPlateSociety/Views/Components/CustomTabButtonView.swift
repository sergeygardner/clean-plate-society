//
//  FloatingTabButtonView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 14.05.2026.
//

import SwiftUI

struct CustomTabButtonView: View {
  @State var viewModel: ViewModel = ViewModel()

  let systemImage: String
  let title: String
  let isSelected: Bool
  let action: () -> Void

  var body: some View {
    Button {
      action()

      withAnimation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0)) {
        viewModel.pulsing = true
      }

      DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
        viewModel.pulsing = false
      }
    } label: {
      VStack(spacing: 4) {
        ZStack(alignment: .center) {
          Image(systemName: systemImage)
            .fontTheme(.title2)
            .foregroundStyleTheme(isSelected ? .icon : .iconDisabled)
            .scaleEffect(viewModel.pulsing ? 1.2 : (isSelected ? 1.05 : 1.0), anchor: .center)
        }
        .frame(width: 32, height: 32)

        if let title = viewModel.mainRepository.tabButton(title) {
          Text(title)
            .fontTheme(.caption2)
            .foregroundStyleTheme(.text)
            .lineLimit(1)
            .frame(height: 14, alignment: .top)
        }
      }
      .frame(maxWidth: .infinity)
    }
  }

}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    CustomTabButtonView(
      systemImage: "plus.circle",
      title: "tabs.audience",
      isSelected: true,
    ) {

    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}
