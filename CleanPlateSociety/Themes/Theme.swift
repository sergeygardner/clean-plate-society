//
//  FormalTheme.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 03.03.2026.
//

import SwiftUI

enum Theme: String, CaseIterable, Hashable, Codable, Equatable {
  case formal = "formal"
  case royal = "royal"
  case harvest = "harvest"
  case forest = "forest"
  case midnight = "midnight"

  var name: String {
    return String(describing: self)
  }

  var shadowX: CGFloat {
    switch self {
    case .formal:
      return 0
    case .royal:
      return 0
    case .harvest:
      return 0
    case .forest:
      return 0
    case .midnight:
      return 0
    //        @unknown default:
    //            return nil
    }
  }

  var shadowY: CGFloat {
    switch self {
    case .formal:
      return 5
    case .royal:
      return 5
    case .harvest:
      return 5
    case .forest:
      return 5
    case .midnight:
      return 5
    //        @unknown default:
    //            return nil
    }
  }

  var shadowRadius: CGFloat {
    switch self {
    case .formal:
      return 5
    case .royal:
      return 5
    case .harvest:
      return 5
    case .forest:
      return 5
    case .midnight:
      return 5
    //        @unknown default:
    //            return nil
    }
  }

  var shadow: Color {
    switch self {
    case .formal:
      return .formalShadow
    case .royal:
      return .royalShadow
    case .harvest:
      return .harvestShadow
    case .forest:
      return .forestShadow
    case .midnight:
      return .midnightShadow
    //        @unknown default:
    //            return nil
    }
  }

  var background: Color {
    switch self {
    case .formal:
      return .formalBackground
    case .royal:
      return .royalBackground
    case .harvest:
      return .harvestBackground
    case .forest:
      return .forestBackground
    case .midnight:
      return .midnightBackground
    //        @unknown default:
    //            return nil
    }
  }

  var border: Color {
    switch self {
    case .formal:
      return .formalBorder
    case .royal:
      return .royalBorder
    case .harvest:
      return .harvestBorder
    case .forest:
      return .forestBorder
    case .midnight:
      return .midnightBorder
    //        @unknown default:
    //            return nil
    }
  }

  var borderWidth: CGFloat {
    switch self {
    case .formal:
      return 1
    case .royal:
      return 1
    case .harvest:
      return 1
    case .forest:
      return 1
    case .midnight:
      return 1
    //        @unknown default:
    //            return nil
    }
  }

  var text: Color {
    switch self {
    case .formal:
      return .formalText
    case .royal:
      return .royalText
    case .harvest:
      return .harvestText
    case .forest:
      return .forestText
    case .midnight:
      return .midnightText
    //        @unknown default:
    //            return .formalText
    }
  }

  var invertedText: Color {
    switch self {
    case .formal:
      return .formalInvertedText
    case .royal:
      return .royalInvertedText
    case .harvest:
      return .harvestInvertedText
    case .forest:
      return .forestInvertedText
    case .midnight:
      return .midnightInvertedText
    //        @unknown default:
    //            return .formalInvertedText
    }
  }

  var icon: String {
    switch self {
    case .formal:
      return "FormalIcon"
    case .royal:
      return "RoyalIcon"
    case .harvest:
      return "HarvestIcon"
    case .forest:
      return "ForestIcon"
    case .midnight:
      return "MidnightIcon"
    //        @unknown default:
    //            return "AppIcon"
    }
  }

  var gradient: LinearGradient {
    switch self {
    case .formal:
      return LinearGradient(
        stops: [
          .init(color: .formalGradientShadowDeep, location: 0.0),
          .init(color: .formalGradientBase, location: 0.45),
          .init(color: .formalGradientShine, location: 0.5),
          .init(color: .formalGradientBase, location: 0.55),
          .init(color: .formalGradientShadow, location: 1.0),
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
    case .royal:
      return LinearGradient(
        stops: [
          .init(color: .royalGradientShadowDeep, location: 0.0),
          .init(color: .royalGradientBase, location: 0.45),
          .init(color: .royalGradientShine, location: 0.5),
          .init(color: .royalGradientBase, location: 0.55),
          .init(color: .royalGradientShadow, location: 1.0),
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
    case .harvest:
      return LinearGradient(
        stops: [
          .init(color: .harvestGradientShadowDeep, location: 0.0),
          .init(color: .harvestGradientBase, location: 0.45),
          .init(color: .harvestGradientShine, location: 0.5),
          .init(color: .harvestGradientBase, location: 0.55),
          .init(color: .harvestGradientShadow, location: 1.0),
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
    case .forest:
      return LinearGradient(
        stops: [
          .init(color: .forestGradientShadowDeep, location: 0.0),
          .init(color: .forestGradientBase, location: 0.45),
          .init(color: .forestGradientShine, location: 0.5),
          .init(color: .forestGradientBase, location: 0.55),
          .init(color: .forestGradientShadow, location: 1.0),
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
    case .midnight:
      return LinearGradient(
        stops: [
          .init(color: .midnightGradientShadowDeep, location: 0.0),
          .init(color: .midnightGradientBase, location: 0.45),
          .init(color: .midnightGradientShine, location: 0.5),
          .init(color: .midnightGradientBase, location: 0.55),
          .init(color: .midnightGradientShadow, location: 1.0),
        ],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
      )
    //        @unknown default:
    //            return nil
    }
  }
}
