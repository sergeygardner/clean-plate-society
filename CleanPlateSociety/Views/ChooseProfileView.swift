//
//  ChooseProfileView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 19.03.2026.
//

import SwiftData
import SwiftUI

struct ChooseProfileView: View {
  @Environment(\.dismiss) private var dismiss
  @EnvironmentObject private var profile: Profile
  @Query private var profileModels: [ProfileModel] = []

  var body: some View {
    ScrollView {
      ForEach(profileModels) { profileModel in
        ButtonView(
          type: .profile,
          text: profileModel.name,
        ) {
          profile.setProfileModel(profileModel)

          NotificationCenter.default.post(
            name: .settingsUpdated,
            object: profile,
            userInfo: [:],
          )

          dismiss()
        }
        .frame(width: 200, height: 200)
        .padding()
      }
      Spacer()
      CreateProfileView(
        amount: profileModels.count
      )
    }
    .navigationTitle("choose.profile")
    .toolbarTheme(.navigationTitle)
  }
}

#Preview("EnglishFormalLightWithoutData") {
  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      ChooseProfileView()
        .sharedNavigation()
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightWithData") {
  PreviewContainerView {
    NavigationStack {
      ChooseProfileView()
        .sharedNavigation()
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightGoldWithData") {
  PreviewContainerView {
    NavigationStack {
      ChooseProfileView()
        .sharedNavigation()
    }
    .environmentObject(Profile.sampleFormalLowGold)
    .preferredColorScheme(.light)
  }
}
