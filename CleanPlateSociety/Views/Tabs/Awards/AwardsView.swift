//
//  AwardView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 02.04.2026.
//

import SwiftData
import SwiftUI

struct AwardsView: View {
  @Environment(\.locale) var locale: Locale
  @EnvironmentObject var profile: Profile
  @Query var awardModels: [AwardModel]

  let profileUUID: UUID

  init(profileUUID: UUID) {
    self.profileUUID = profileUUID

    let profileUUIDRawValue: String = profileUUID.uuidString

    _awardModels = Query(
      filter: #Predicate<AwardModel> { award in
        award.profileUUIDRawValue == profileUUIDRawValue
      },
      sort: \.timestamp,
      order: .reverse
    )
  }

  var body: some View {
    let count: Int = awardModels.count

    ScrollViewReader { proxy in
      VStack {
        ScrollView {
          LazyVStack(spacing: 10) {
            ForEach(
              Array(AwardEnum.allCases.enumerated()),
              id: \.offset
            ) {
              id,
              award in

              if let name = profile.profileModelDTO?.name {
                AwardDetailView(
                  award: award,
                  awardModel: awardModels[safe: id],
                  name: name
                )
                .id(id)
              }
            }
          }
          VStack {

          }
          .padding(.bottom, AppConfigDTO.viewScrollBottomPadding)
        }
      }
      .onAppear {
        onModify(count: count, proxy: proxy)
      }
      .onChange(of: awardModels) {
        onModify(count: count, proxy: proxy)
      }
    }
  }

  private func onModify(count: Int, proxy: ScrollViewProxy) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
      var transaction: Transaction = Transaction()
      transaction.disablesAnimations = true

      withTransaction(transaction) {
        proxy.scrollTo(count > 0 ? count - 1 : 0, anchor: .top)
      }
    }
  }
}

#Preview("EnglishFormalLightAllAwardsUnlocked") {
  @Previewable @State var profileUUID: UUID = UUID.sampleProfileUUID

  PreviewContainerView {
    AwardsView(
      profileUUID: profileUUID
    )
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightAllAwardsLocked") {
  @Previewable @State var profileUUID: UUID = UUID.sampleProfileUUID

  PreviewContainerView(PreviewContainerView.Samples.awardEmpty) {
    AwardsView(
      profileUUID: profileUUID
    )
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightHalfAwardsLocked") {
  @Previewable @State var profileUUID: UUID = UUID.sampleProfileUUID

  PreviewContainerView(PreviewContainerView.Samples.awardHalf) {
    AwardsView(
      profileUUID: profileUUID
    )
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}
