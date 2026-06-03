//
//  CleanPlateSocietyApp.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 05.01.2026.
//

import Foundation
import RevenueCat
import SwiftData
import SwiftUI

@main
struct CleanPlateSocietyApp: App {
  @AppStorage("profileUUID") private var persistableUUID: PersistableUUID =
    PersistableUUID(uuid: UUID())
  @AppStorage("stage") private var stage: StageEnum = .stage1
  @State private var errorManager: ErrorManager = ErrorManager.shared

  let dataContainer: Result<DataContainer, Error> = DataContainer.shared
  let subscriptionServiceKeyed: Result<String, SubscriptionErrorEnum> = SubscriptionRepository.keyed

  var body: some Scene {
    WindowGroup {
      ZStack {
        switch dataContainer {
        case .success(let container):
          switch subscriptionServiceKeyed {
          case .success(let apiKey):
            #if DEBUG
              let _ = Purchases.logLevel = .debug
            #endif

            let _ = Purchases.configure(withAPIKey: apiKey)

            ContentView(
              persistableUUID: $persistableUUID,
              stage: $stage
            )
            .modelContainer(container.modelContainer)
            .environment(container)
            .environment(errorManager)
            .environmentObject(getProfile())
          case .failure(let error):
            let _ = errorManager.trigger(.core(error))
          }
        case .failure(let error):
          let _ = errorManager.trigger(.core(error))
        }

        if errorManager.canBeShowed() {
          if let error = errorManager.error {
            ErrorView(
              error: error,
            ) {
              withAnimation {
                errorManager.hide()
              }
            }
            .environmentObject(Profile.sampleEmpty)
            .transition(.move(edge: .bottom).combined(with: .opacity))
            .zIndex(1)
          }
        }
      }
      .animation(.spring(), value: errorManager.canBeShowed())
    }
  }

  private func getProfile() -> Profile {
    let profileUUID: UUID = persistableUUID.uuid
    var descriptor: FetchDescriptor<ProfileModel> = FetchDescriptor<ProfileModel>()
    descriptor.fetchLimit = 1
    descriptor.predicate = #Predicate<ProfileModel> { profile in
      profile.uuid == profileUUID
    }

    switch dataContainer {
    case .success(let container):
      let profileModel: ProfileModel? =
        try? container
        .modelContainer
        .mainContext
        .fetch(descriptor)
        .first

      if let profileModel = profileModel {
        let profile: Profile = Profile(profileModel: profileModel)

        profile.resetProfileDTO()

        return profile
      } else {
        return Profile.sampleEmpty
      }
    case .failure:
      return Profile.sampleEmpty
    }
  }
}
