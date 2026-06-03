//
//  SharedToolbar.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 31.03.2026.
//

import Foundation
import SwiftUI

struct SharedToolbar: ViewModifier {
  func body(content: Content) -> some View {
    content
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          HStack {
            NavigationLink(value: NavigationEnum.chooseProfile) {
              Image(systemName: "switch.2")
                .fontTheme(.title3Bold)
                .foregroundStyleTheme(.icon)
            }
          }
        }
        ToolbarItem(placement: .topBarTrailing) {
          HStack {
            NavigationLink(value: NavigationEnum.modifyProfile) {
              Image(systemName: "person.crop.circle")
                .fontTheme(.title3Bold)
                .foregroundStyleTheme(.icon)
                .overlay(alignment: .topTrailing) {
                  CrownView(
                    width: 10,
                    height: 10,
                    offsetX: -1,
                    offsetY: -6,
                    rorateDegree: 32,
                  )
                }
            }
          }
        }
      }
  }
}

struct SharedNavigation: ViewModifier {
  func body(content: Content) -> some View {
    content
      .navigationDestination(for: NavigationEnum.self) {
        navigation in

        switch navigation {
        case .chooseProfile:
          ChooseProfileView()
        case .createProfile:
          ModifyProfileView(new: true)
        case .modifyProfile:
          ModifyProfileView(new: false)
        }
      }
  }
}

extension View {
  func sharedToolbar() -> some View {
    self.modifier(
      SharedToolbar()
    )
  }
  func sharedNavigation() -> some View {
    self.modifier(
      SharedNavigation()
    )
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    TabView {
      NavigationStack {
        VStack {

        }
        .sharedToolbar()
        .sharedNavigation()
      }
      .tabItem {
        Label {

        } icon: {
          Image(systemName: "plus.circle")
            .foregroundStyleTheme(.icon)
        }
        .padding(.top, 3)
      }
    }
    .tintTheme(.icon)
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightProfile") {
  PreviewContainerView {
    TabView {
      NavigationStack {
        VStack {

        }
        .sharedToolbar()
        .sharedNavigation()
      }
      .tabItem {
        Label {

        } icon: {
          Image(systemName: "plus.circle")
            .foregroundStyleTheme(.icon)
        }
        .padding(.top, 3)
      }
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLight") {
  PreviewContainerView {
    TabView {
      NavigationStack {
        VStack {

        }
        .sharedToolbar()
        .sharedNavigation()
      }
      .tabItem {
        Label {

        } icon: {
          Image(systemName: "plus.circle")
            .foregroundStyleTheme(.icon)
        }
        .padding(.top, 3)
      }
    }
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLight") {
  PreviewContainerView {
    TabView {
      NavigationStack {
        VStack {

        }
        .sharedToolbar()
        .sharedNavigation()
      }
      .tabItem {
        Label {

        } icon: {
          Image(systemName: "plus.circle")
            .foregroundStyleTheme(.icon)
        }
        .padding(.top, 3)
      }
    }
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLight") {
  PreviewContainerView {
    TabView {
      NavigationStack {
        VStack {

        }
        .sharedToolbar()
        .sharedNavigation()
      }
      .tabItem {
        Label {

        } icon: {
          Image(systemName: "plus.circle")
            .foregroundStyleTheme(.icon)
        }
        .padding(.top, 3)
      }
    }
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLight") {
  PreviewContainerView {
    TabView {
      NavigationStack {
        VStack {

        }
        .sharedToolbar()
        .sharedNavigation()
      }
      .tabItem {
        Label {

        } icon: {
          Image(systemName: "plus.circle")
            .foregroundStyleTheme(.icon)
        }
        .padding(.top, 3)
      }
    }
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalDark") {
  PreviewContainerView {
    TabView {
      NavigationStack {
        VStack {

        }
        .sharedToolbar()
        .sharedNavigation()
      }
      .tabItem {
        Label {

        } icon: {
          Image(systemName: "plus.circle")
            .foregroundStyleTheme(.icon)
        }
        .padding(.top, 3)
      }
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishRoyalDark") {
  PreviewContainerView {
    TabView {
      NavigationStack {
        VStack {

        }
        .sharedToolbar()
        .sharedNavigation()
      }
      .tabItem {
        Label {

        } icon: {
          Image(systemName: "plus.circle")
            .foregroundStyleTheme(.icon)
        }
        .padding(.top, 3)
      }
    }
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishForestDark") {
  PreviewContainerView {
    TabView {
      NavigationStack {
        VStack {

        }
        .sharedToolbar()
        .sharedNavigation()
      }
      .tabItem {
        Label {

        } icon: {
          Image(systemName: "plus.circle")
            .foregroundStyleTheme(.icon)
        }
        .padding(.top, 3)
      }
    }
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishHarvestDark") {
  PreviewContainerView {
    TabView {
      NavigationStack {
        VStack {

        }
        .sharedToolbar()
        .sharedNavigation()
      }
      .tabItem {
        Label {

        } icon: {
          Image(systemName: "plus.circle")
            .foregroundStyleTheme(.icon)
        }
        .padding(.top, 3)
      }
    }
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishMidnightDark") {
  PreviewContainerView {
    TabView {
      NavigationStack {
        VStack {

        }
        .sharedToolbar()
        .sharedNavigation()
      }
      .tabItem {
        Label {

        } icon: {
          Image(systemName: "plus.circle")
            .foregroundStyleTheme(.icon)
        }
        .padding(.top, 3)
      }
    }
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.dark)
  }
}
