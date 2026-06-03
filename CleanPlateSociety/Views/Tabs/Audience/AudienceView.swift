//
//  AudienceView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 11.03.2026.
//

import SwiftData
import SwiftUI

struct AudienceView: View {
  @Environment(DataContainer.self) var dataContainer
  @EnvironmentObject var profile: Profile
  @Query var entryModels: [EntryModel]
  @Query var entriesPerDayModel: [EntryModel]
  @Query var lastModel: [EntryModel]
  @State var viewModel: ViewModel = ViewModel()

  let profileModelDTO: ProfileModelDTO
  let sticker: StickerEnum
  let date: Date
  let useScrollTransition: Bool
  let asyncScrolling: Bool
  let testing: Bool

  init(
    profileModelDTO: ProfileModelDTO,
    sticker: StickerEnum,
    date: Date = Date.timeZonedNow,
    useScrollTransition: Bool = true,
    asyncScrolling: Bool = true,
    testing: Bool = false,
  ) {
    self.profileModelDTO = profileModelDTO
    self.sticker = sticker
    self.date = date
    self.useScrollTransition = useScrollTransition
    self.asyncScrolling = asyncScrolling
    self.testing = testing

    let unwrappedUUID: String = profileModelDTO.uuid.uuidString
    let unwrappedStickerRawValue: String = sticker.rawValue
    var descriptorEntryModels: FetchDescriptor<EntryModel> = FetchDescriptor<EntryModel>()

    descriptorEntryModels.predicate = #Predicate<EntryModel> { entry in
      entry.profileUUIDRawValue == unwrappedUUID
        && entry.stickerRawValue == unwrappedStickerRawValue
    }
    descriptorEntryModels.sortBy = [
      SortDescriptor(\EntryModel.timestamp, order: .forward)
    ]

    _entryModels = Query(descriptorEntryModels)

    var descriptorLastModel: FetchDescriptor<EntryModel> = FetchDescriptor<EntryModel>()
    descriptorLastModel.predicate = #Predicate<EntryModel> { entry in
      entry.profileUUIDRawValue == unwrappedUUID
    }
    descriptorLastModel.fetchLimit = 1
    descriptorLastModel.sortBy = [
      SortDescriptor(\EntryModel.timestamp, order: .reverse)
    ]
    _lastModel = Query(descriptorLastModel)

    let startOfDay: Date = date.startOfDay
    let endOfDay: Date = date.endOfDay
    var descriptorEntriesPerDayModel: FetchDescriptor<EntryModel> = FetchDescriptor<EntryModel>()
    descriptorEntriesPerDayModel.predicate = #Predicate<EntryModel> { entry in
      entry.profileUUIDRawValue == unwrappedUUID
        && entry.timestamp >= startOfDay
        && entry.timestamp < endOfDay
    }
    descriptorEntriesPerDayModel.fetchLimit = 1
    descriptorEntriesPerDayModel.sortBy = [
      SortDescriptor(\EntryModel.timestamp, order: .reverse)
    ]
    _entriesPerDayModel = Query(descriptorEntriesPerDayModel)
  }

  var body: some View {
    let _ = viewModel.setCurrentIndex(
      entryModelsCount: profileModelDTO.settings.sticker.amount,
      stickerAmount: entryModels.count,
    )
    let _ = viewModel.canDo(
      entryModelsCount: entryModels.count,
      stickerAmount: profileModelDTO.settings.sticker.amount,
    )

    AudienceListView(
      viewModel: viewModel,
      sticker: profileModelDTO.settings.sticker,
      profileModelDTO: profileModelDTO,
      useScrollTransition: useScrollTransition,
      asyncScrolling: asyncScrolling,
      testing: testing,
    ) { index, width, height in

      switch viewModel.status {
      case .addButtonView:
        if viewModel.showAddButtonView(index: index) {
          addView(index: index)
        }
      case .chooseStickerView:
        if viewModel.showChooseStickerView(
          index: index, stickerAmount: profileModelDTO.settings.sticker.amount)
        {
          chooseStickerView(width, height)
        }
      }
    }
    .onChange(of: entryModels) {
      viewModel.setCurrentIndex(
        entryModelsCount: profileModelDTO.settings.sticker.amount,
        stickerAmount: entryModels.count,
      )
      viewModel.canDo(
        entryModelsCount: entryModels.count,
        stickerAmount: profileModelDTO.settings.sticker.amount,
      )
      viewModel.setDelay(
        difficultyLevel: profileModelDTO.settings.difficultyLevel,
        lastModelDate: lastModel.first?.timestamp,
      )
      viewModel.setDisabled()
      viewModel.setRemaining()
    }
  }

  @ViewBuilder private func chooseStickerView(
    _ width: CGFloat,
    _ height: CGFloat
  ) -> some View {
    VStack {
      StickerCompletionView {
        let bindingSticker: Binding<StickerEnum> = Binding(
          get: { sticker },
          set: { profile.setSticker($0) }
        )

        StickerChooserView(sticker: bindingSticker, withSpacer: false)
      }
      .frame(height: height)
      .frame(maxWidth: .infinity)
      .backgroundTheme(.sticker)
      .padding(.horizontal)
    }
  }

  @ViewBuilder private func addView(index: Int) -> some View {
    VStack {
      if viewModel.disabled {
        if !viewModel.remaining.isZero {
          if let difficultyLevel = profile.profileModelDTO?.settings.difficultyLevel {
            ChancellorNextAppointmentView(
              id: viewModel.getChancellorAppointmentId(
                day: date.dayOfMonth,
                difficultyLevel: difficultyLevel,
                entriesPerDay: entriesPerDayModel.count,
              )
            ) {
              CountdownTimerView(
                remaining: viewModel
                  .remaining
              )
              .fontTheme(.body)
              .foregroundStyleTheme(.text)
            }
            .padding(.horizontal)
          }
        }
      } else {
        if let difficultyLevel = profile.profileModelDTO?.settings.difficultyLevel {
          ChancellorAppointmentView(
            id: viewModel.getChancellorAppointmentId(
              day: date.dayOfMonth,
              difficultyLevel: difficultyLevel,
              entriesPerDay: entriesPerDayModel.count,
            ),
          ) {
            withAnimation(.easeInOut(duration: 1.0)) {
              add()
            }
          }
          .onAppear {
            viewModel.setDelay(
              difficultyLevel: profileModelDTO.settings.difficultyLevel,
              lastModelDate: lastModel.first?.timestamp,
            )
            viewModel.setDisabled()
            viewModel.setRemaining()
          }
          .opacity(
            viewModel.disabled
              ? 0.1 : 1
          )
          .disabled(
            viewModel.disabled
          )
          .padding(.horizontal)
        }
      }
    }
    .frame(maxWidth: .infinity)
  }
}

#Preview("EnglishFormalLightWithData") {
  @Previewable @State var profile: Profile = Profile.sampleFormalLow

  PreviewContainerView {
    NavigationStack {
      AudienceView(
        profileModelDTO: profile.profileModelDTO!,
        sticker: StickerEnum.standard
      )
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightWithAlmostData") {
  @Previewable @State var profile: Profile = Profile.sampleFormalLow

  PreviewContainerView(
    PreviewContainerView.Samples(
      entry: PreviewContainerView.sampleEntryAlmost
    )
  ) {
    NavigationStack {
      AudienceView(
        profileModelDTO: profile.profileModelDTO!,
        sticker: StickerEnum.standard
      )
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightWithHalfData") {
  @Previewable @State var profile: Profile = Profile.sampleFormalLow

  PreviewContainerView(PreviewContainerView.Samples.entryHalf) {
    NavigationStack {
      AudienceView(
        profileModelDTO: profile.profileModelDTO!,
        sticker: StickerEnum.standard
      )
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightWithAlmdostDataUnlockedAward") {
  @Previewable @State var profile: Profile = Profile.sampleFormalLow

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
      ),
    )
  ) {
    NavigationStack {
      AudienceView(
        profileModelDTO: profile.profileModelDTO!,
        sticker: StickerEnum.standard
      )
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalDarkWithData") {
  @Previewable @State var profile: Profile = Profile.sampleFormalLow

  PreviewContainerView {
    NavigationStack {
      AudienceView(
        profileModelDTO: profile.profileModelDTO!,
        sticker: StickerEnum.standard
      )
    }

    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishFormalDarkWithoutData") {
  @Previewable @State var profile: Profile = Profile.sampleFormalLow

  PreviewContainerView(PreviewContainerView.Samples.entryEmpty) {
    NavigationStack {
      AudienceView(
        profileModelDTO: profile.profileModelDTO!,
        sticker: StickerEnum.standard
      )
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.dark)
  }
}
