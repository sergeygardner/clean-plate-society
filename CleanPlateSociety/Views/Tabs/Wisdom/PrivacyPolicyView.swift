//
//  PrivacyPolicyView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 05.05.2026.
//

import SwiftUI

struct PrivacyPolicyView: View {
  @State var viewModel: ViewModel = ViewModel()

  var fontTheme: FontAdaptiveModifier.FontThemeEnum = .title
  var paddingEdges: Edge.Set = .all
  var useSpacer: Bool = true

  var body: some View {
    VStack {
      if let title = viewModel.societyRepository.privacyPolicyIntroductionTitle(),
        let url = URL(string: viewModel.linkRepository.getPrivacyPolicyUrl())
      {
        HStack {
          Image(systemName: "lock.shield")
            .fontTheme(fontTheme)
            .foregroundStyleTheme(.icon)
          Link(title, destination: url)
            .fontTheme(fontTheme)
            .foregroundStyleTheme(.text)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(paddingEdges)
      }
      if let title = viewModel.societyRepository.termsOfUseIntroductionTitle(),
        let url = URL(string: viewModel.linkRepository.getTermsOfUsageUrl())
      {
        HStack {
          Image(systemName: "text.page.badge.magnifyingglass")
            .fontTheme(fontTheme)
            .foregroundStyleTheme(.icon)
          Link(title, destination: url)
            .fontTheme(fontTheme)
            .foregroundStyleTheme(.text)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(paddingEdges)
      }
      if let title = viewModel.societyRepository.supportIntroductionTitle(),
        let url = URL(string: viewModel.linkRepository.getSupportUrl())
      {
        HStack {
          Image(systemName: "globe")
            .fontTheme(fontTheme)
            .foregroundStyleTheme(.icon)
          Link(title, destination: url)
            .fontTheme(fontTheme)
            .foregroundStyleTheme(.text)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(paddingEdges)
      }

      if useSpacer {
        Spacer()
      }
    }
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    PrivacyPolicyView()
      .preferredColorScheme(.light)
      .environmentObject(Profile.sampleFormalLow)
  }
}
