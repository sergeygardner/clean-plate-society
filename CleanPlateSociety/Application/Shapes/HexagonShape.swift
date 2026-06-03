//
//  HexagonShape.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 01.05.2026.
//

import SwiftUI

struct HexagonShape: Shape {
  func path(in rect: CGRect) -> Path {
    var path: Path = Path()
    let width: CGFloat = rect.width
    let height: CGFloat = rect.height
    let xCenter: CGFloat = rect.midX
    let yCenter: CGFloat = rect.midY
    let radius: CGFloat = min(width, height) / 2

    for i in 0..<6 {
      let angle: CGFloat = CGFloat(i) * .pi / 3
      let x: CGFloat = xCenter + radius * cos(angle)
      let y: CGFloat = yCenter + radius * sin(angle)

      if i == 0 {
        path.move(to: CGPoint(x: x, y: y))
      } else {
        path.addLine(to: CGPoint(x: x, y: y))
      }
    }

    path.closeSubpath()

    return path
  }
}
