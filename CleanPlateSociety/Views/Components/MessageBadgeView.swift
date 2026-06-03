//
//  MessageBadge.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 07.04.2026.
//

import SwiftUI

struct MessageBadgeView<Content: View>: View {
  @State var viewModel: ViewModel

  @ViewBuilder let content: () -> Content

  init(
    type: MessageBadgeView.ViewModel.TypeEnum,
    @ViewBuilder content: @escaping () -> Content
  ) {
    _viewModel = State(wrappedValue: ViewModel(type: type))

    self.content = content
  }

  var body: some View {
    VStack {
      HStack(spacing: 15) {
        Image(systemName: viewModel.getImageName())
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)

        VStack(alignment: .leading) {
          Text(viewModel.getTitle())
            .fontTheme(.headline)
            .foregroundStyleTheme(.text)
          content()
            .foregroundStyleTheme(.text)
        }
      }
      .padding(.vertical, 6)
      .padding(.horizontal, 20)
    }
    .backgroundTheme(.message)
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    MessageBadgeView(type: .award) {
      Text(AwardTitleRepository().find(id: .level1)!)
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLight") {
  PreviewContainerView {
    MessageBadgeView(type: .award) {
      Text(AwardTitleRepository().find(id: .level1)!)
    }
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLight") {
  PreviewContainerView {
    MessageBadgeView(type: .award) {
      Text(AwardTitleRepository().find(id: .level1)!)
    }
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLight") {
  PreviewContainerView {
    MessageBadgeView(type: .award) {
      Text(AwardTitleRepository().find(id: .level1)!)
    }
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLight") {
  PreviewContainerView {
    MessageBadgeView(type: .award) {
      Text(AwardTitleRepository().find(id: .level1)!)
    }
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalDark") {
  PreviewContainerView {
    MessageBadgeView(type: .award) {
      Text(AwardTitleRepository().find(id: .level1)!)
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishRoyalDark") {
  PreviewContainerView {
    MessageBadgeView(type: .award) {
      Text(AwardTitleRepository().find(id: .level1)!)
    }
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishForestDark") {
  PreviewContainerView {
    MessageBadgeView(type: .award) {
      Text(AwardTitleRepository().find(id: .level1)!)
    }
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishHarvestDark") {
  PreviewContainerView {
    MessageBadgeView(type: .award) {
      Text(AwardTitleRepository().find(id: .level1)!)
    }
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishMidnightDark") {
  PreviewContainerView {
    MessageBadgeView(type: .award) {
      Text(AwardTitleRepository().find(id: .level1)!)
    }
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.dark)
  }
}
