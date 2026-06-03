//
//  ChancellorSealView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 14.04.2026.
//

import SwiftUI

struct ChancellorSealView: View {
  @State var viewModel: ViewModel = ViewModel()

  var opacity: CGFloat = 0.2
  var borderColor: Color = .chancellorSealBorder
  var backgroundColor: Color = .chancellorSealBackground
  var outerCircleWidth: CGFloat = 200
  var outerCircleHeight: CGFloat = 200
  var outerCircleLineWidth: CGFloat = 2
  var innerCircleWidth: CGFloat = 145
  var innerCircleHeight: CGFloat = 145
  var innerCircleLineWidth: CGFloat = 1
  var innerCircleColorOpacity: CGFloat = 0.75
  var textSize: CGFloat = 14
  var letterWidth: CGFloat = 20
  var iconWidth: CGFloat = 80
  var iconHeight: CGFloat = 80
  var iconRotationDegree: CGFloat = 35
  var iconOffsetX: CGFloat = 20
  var iconOffsetY: CGFloat = 0
  var sparkesSize: CGFloat = 30
  var sparkesOffsetX: CGFloat = 50
  var sparkesOffsetY: CGFloat = -50
  var radius: Double = 93

  var body: some View {
    ZStack {
      Circle()
        .strokeBorder(borderColor, lineWidth: 2)
        .background(Circle().fill(backgroundColor))
        .frame(width: outerCircleWidth, height: outerCircleHeight)

      Circle()
        .stroke(
          borderColor.opacity(innerCircleColorOpacity),
          lineWidth: innerCircleLineWidth
        )
        .frame(width: innerCircleWidth, height: innerCircleHeight)

      ForEach(viewModel.getName(), id: \.offset) { index, letter in
        VStack {
          Text(String(letter))
            .font(
              .system(
                size: textSize,
                weight: .bold,
                design: .serif
              )
            )
            .foregroundColor(borderColor)
          Spacer()
        }
        .frame(width: letterWidth, height: radius * 2)
        .rotationEffect(.degrees(Double(index) * 11 - 100))
      }

      HStack(spacing: 8) {
        Image(systemName: "fork.knife")
          .resizable()
          .scaledToFit()
          .aspectRatio(contentMode: .fit)
          .foregroundStyle(borderColor)
          .frame(maxWidth: .infinity)
      }
      .frame(width: iconWidth, height: iconHeight)
      .rotationEffect(.degrees(iconRotationDegree))
      .offset(x: iconOffsetX, y: iconOffsetY)

      Image(systemName: "sparkles")
        .font(.system(size: sparkesSize))
        .foregroundColor(borderColor)
        .offset(x: sparkesOffsetX, y: sparkesOffsetY)
    }
    .opacity(opacity)
    .drawingGroup()
    .accessibilityLabel("Clean Plate Society Ver 1.1.0")
  }
}

#Preview("EnglishLight") {
  ChancellorSealView()
    .preferredColorScheme(.light)
}

#Preview("EnglishDark") {
  ChancellorSealView()
    .preferredColorScheme(.dark)
}
