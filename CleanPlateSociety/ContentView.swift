//
//  ContentView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 05.01.2026.
//

import SwiftUI

struct ContentView: View {
  @Binding var persistableUUID: PersistableUUID
  @Binding var stage: StageEnum
  @EnvironmentObject private var profile: Profile
  @State var viewModel: ViewModel = ViewModel()

  var body: some View {
    VStack {
      if stage.isFinal() {
        if viewModel.canShowTabs() {
          CustomTabView()
            .ignoresSafeArea(.container, edges: .all)
            .overlay(alignment: .top) {
              NotificationListenerView(state: .top)
            }
            .overlay(alignment: .bottom) {
              NotificationListenerView(state: .bottom)
            }
        } else {
          NavigationStack {
            ChooseProfileView()
              .sharedNavigation()
          }
        }
      } else {
        NavigationStack {
          TutorialView(stage: $stage)
        }
      }
    }
    .onChange(of: profile.profileModelDTO) {
      if let profileModelDTO = profile.profileModelDTO {
        viewModel.profileModelDTO = profileModelDTO
        persistableUUID.uuid = profileModelDTO.uuid
      }
    }
    .onChange(of: profile.profileModelDTO?.settings.sticker) {
      if let profileModelDTO = profile.profileModelDTO {
        viewModel.sticker = profileModelDTO.settings.sticker
      }
    }
    .onAppear {
      if let profileModelDTO = profile.profileModelDTO,
        let sticker = profile.profileModelDTO?.settings.sticker
      {
        viewModel.profileModelDTO = profileModelDTO
        viewModel.sticker = sticker
      }

      //            exportLaunchImage(
      //                from: ChancellorSealView(
      //                    opacity: 1,
      //                    borderColor: .white,
      //                    backgroundColor: .clear,
      //                    outerCircleWidth: CGFloat(200.0 * 5.12),
      //                    outerCircleHeight: CGFloat(200.0 * 5.12),
      //                    outerCircleLineWidth: CGFloat(2.0 * 5.12),
      //                    innerCircleWidth: CGFloat(145.0 * 5.12),
      //                    innerCircleHeight: CGFloat(145.0 * 5.12),
      //                    innerCircleLineWidth: 1,
      //                    innerCircleColorOpacity: 0.75,
      //                    textSize: CGFloat(14.0 * 5.12),
      //                    letterWidth: CGFloat(20.0 * 5.12),
      //                    iconWidth: CGFloat(80.0 * 5.12),
      //                    iconHeight: CGFloat(80.0 * 5.12),
      //                    iconRotationDegree: 35.0,
      //                    iconOffsetX: CGFloat(20.0 * 5.12),
      //                    iconOffsetY: 0,
      //                    sparkesSize: CGFloat(30.0 * 5.12),
      //                    sparkesOffsetX: CGFloat(50.0 * 5.12),
      //                    sparkesOffsetY: CGFloat(-50.0 * 5.12),
      //                    radius: Double(93.0 * 5.12),
      //                )
      //                .environmentObject(profile)
      //            )
      viewModel.notificationRepository.send(
        subscriptionUpdatedDTO: SubscriptionUpdatedDTO(state: .silent))
    }
    NotificationListenerView(state: .hidden)
  }
}

#Preview("EnglishFormalLightStage5") {
  @Previewable @State var persistableUUID: PersistableUUID = PersistableUUID
    .sampleProfileUUID
  @Previewable @State var stage: StageEnum = .stage5

  PreviewContainerView {
    ContentView(
      persistableUUID: $persistableUUID,
      stage: $stage,
    )
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightWithAlmostDataUnlockedAward") {
  @Previewable @State var persistableUUID: PersistableUUID = PersistableUUID
    .sampleProfileUUID
  @Previewable @State var stage: StageEnum = .stage5

  PreviewContainerView(
    PreviewContainerView.Samples(
      award: PreviewContainerView.Sample(
        from: 0,
        to: 8,
      ),
      entry: PreviewContainerView.Sample(
        from: EntryModel.sampleData.count
          - AwardEnum.level10.requirement,
        to: EntryModel.sampleData.count - 2,
      )
    )
  ) {
    ContentView(
      persistableUUID: $persistableUUID,
      stage: $stage,
    )
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightMedium") {
  @Previewable @State var persistableUUID: PersistableUUID = PersistableUUID
    .sampleProfileUUID
  @Previewable @State var stage: StageEnum = .stage5

  PreviewContainerView(
    PreviewContainerView.Samples(
      award: PreviewContainerView.Sample(
        from: 0,
        to: 8,
      ),
      entry: PreviewContainerView.Sample(
        from: EntryModel.sampleData.count
          - AwardEnum.level10.requirement * DifficultyLevelEnum.medium.progress,
        to: EntryModel.sampleData.count - 2,
      )
    )
  ) {
    ContentView(
      persistableUUID: $persistableUUID,
      stage: $stage,
    )
    .environmentObject(Profile.sampleFormalMedium)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightMediumHalfEntries") {
  @Previewable @State var persistableUUID: PersistableUUID = PersistableUUID
    .sampleProfileUUID
  @Previewable @State var stage: StageEnum = .stage5

  PreviewContainerView(
    PreviewContainerView.Samples(
      entry: PreviewContainerView.sampleEntryMediumHalf,
    )
  ) {
    ContentView(
      persistableUUID: $persistableUUID,
      stage: $stage,
    )
    .environmentObject(Profile.sampleFormalMedium)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishLightEmpty") {
  @Previewable @State var persistableUUID: PersistableUUID = PersistableUUID
    .sampleProfileUUID
  @Previewable @State var stage: StageEnum = .stage1

  PreviewContainerView(PreviewContainerView.Samples.empty) {
    ContentView(
      persistableUUID: $persistableUUID,
      stage: $stage,
    )
    .environmentObject(Profile.sampleEmpty)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightEmptyWithProfile") {
  @Previewable @State var persistableUUID: PersistableUUID = PersistableUUID
    .sampleProfileUUID
  @Previewable @State var stage: StageEnum = .stage5

  PreviewContainerView(PreviewContainerView.Samples.empty) {
    ContentView(
      persistableUUID: $persistableUUID,
      stage: $stage,
    )
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightStandardStickerEmpty") {
  @Previewable @State var persistableUUID: PersistableUUID = PersistableUUID
    .sampleProfileUUID
  @Previewable @State var stage: StageEnum = .stage5

  PreviewContainerView(
    PreviewContainerView.Samples(
      sticker: PreviewContainerView.sampleEmpty
    )
  ) {
    ContentView(
      persistableUUID: $persistableUUID,
      stage: $stage,
    )
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightBadgersStickerEmpty") {
  @Previewable @State var persistableUUID: PersistableUUID = PersistableUUID
    .sampleProfileUUID
  @Previewable @State var stage: StageEnum = .stage5

  PreviewContainerView(
    PreviewContainerView.Samples(
      entry: PreviewContainerView.sampleBadgersFull,
      sticker: PreviewContainerView.sampleEmpty,
    )
  ) {
    ContentView(
      persistableUUID: $persistableUUID,
      stage: $stage,
    )
    .environmentObject(Profile.sampleFormalLowBadgers)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightGold") {
  @Previewable @State var persistableUUID: PersistableUUID = PersistableUUID
    .sampleProfileUUID
  @Previewable @State var stage: StageEnum = .stage5

  PreviewContainerView {
    ContentView(
      persistableUUID: $persistableUUID,
      stage: $stage,
    )
    .environmentObject(Profile.sampleFormalLowGold)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalDark") {
  @Previewable @State var persistableUUID: PersistableUUID = PersistableUUID
    .sampleProfileUUID
  @Previewable @State var stage: StageEnum = .stage5

  PreviewContainerView {
    ContentView(
      persistableUUID: $persistableUUID,
      stage: $stage,
    )
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.dark)
  }
}
