//
//  CrownView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 06.05.2026.
//

import SwiftUI

struct CrownView: View {
  @EnvironmentObject var profile: Profile

  var width: CGFloat = 100
  var height: CGFloat = 100
  var offsetX: CGFloat = 0
  var offsetY: CGFloat = 0
  var rorateDegree: CGFloat = 0

  var body: some View {
    if profile.hasPerkCrown() {
      Image(systemName: "crown.fill")
        .resizable()
        .scaledToFit()
        .foregroundStyleTheme(.icon)
        .frame(width: width, height: height)
        .rotationEffect(.degrees(rorateDegree))
        .offset(x: offsetX, y: offsetY)
    }
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    CrownView()
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightGold") {
  PreviewContainerView {
    CrownView()
      .environmentObject(Profile.sampleFormalLowGold)
      .preferredColorScheme(.light)
  }
}
