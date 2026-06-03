//
//  PreviewContainerView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 02.04.2026.
//

import RevenueCat
import SwiftData
import SwiftUI

struct PreviewContainerView<Content: View>: View {
  let dataContainer: Result<DataContainer, Error> = DataContainer
    .previewShared
  let subscriptionServiceKeyed: Result<String, SubscriptionErrorEnum> = SubscriptionRepository.keyed
  @ViewBuilder let content: () -> Content
  let samples: Samples

  struct Samples {
    var award: Sample = sampleFull
    var entry: Sample = sampleFull
    var sticker: Sample = sampleStandardStickerFull
    var profile: Sample = sampleProfile
  }

  struct Sample {
    var from: Int
    var to: Int
    var stickers: [StickerEnum] = [.standard]
    var date: Date = Date.timeZonedNow
    var profileUUID: UUID = UUID.sampleProfileUUID
    var difficultyLevel: DifficultyLevelEnum = .low
    var awards: [AwardEnum] = AwardEnum.allCases
  }

  init(_ samples: Samples = Samples(), @ViewBuilder content: @escaping () -> Content) {
    self.content = content
    self.samples = samples
  }

  var body: some View {
    switch dataContainer {
    case .success(let dataContainer):
      switch subscriptionServiceKeyed {
      case .success(let apiKey):
        let _ = Purchases.logLevel = .debug
        let _ = Purchases.configure(withAPIKey: apiKey)
        let _ = Self.parseSamples(dataContainer, samples)

        content()
          .environment(ErrorManager.shared)
          .environment(dataContainer)
          .modelContainer(dataContainer.modelContainer)
      case .failure(let error):
        ErrorView(error: .core(error)) {

        }
        .environment(ErrorManager.shared)
        .environmentObject(Profile.sampleEmpty)
      }
    case .failure(let error):
      ErrorView(error: .core(error)) {

      }
      .environment(ErrorManager.shared)
      .environmentObject(Profile.sampleEmpty)
    }
  }
}

extension PreviewContainerView.Samples {
  static var awardEmpty: PreviewContainerView.Samples {
    PreviewContainerView.Samples(
      award: PreviewContainerView.sampleEmpty
    )
  }
  static var awardHalf: PreviewContainerView.Samples {
    PreviewContainerView.Samples(
      award: PreviewContainerView.sampleAwardHalf
    )
  }
  static var empty: PreviewContainerView.Samples {
    PreviewContainerView.Samples(
      award: PreviewContainerView.sampleEmpty,
      entry: PreviewContainerView.sampleEmpty,
      sticker: PreviewContainerView.sampleEmpty,
      profile: PreviewContainerView.sampleEmpty
    )
  }
  static var entryEmpty: PreviewContainerView.Samples {
    PreviewContainerView.Samples(
      entry: PreviewContainerView.sampleEmpty
    )
  }
  static var entryHalf: PreviewContainerView.Samples {
    PreviewContainerView.Samples(
      entry: PreviewContainerView.sampleEntryLowHalf
    )
  }
}

extension PreviewContainerView {
  static var sampleEmpty: Sample {
    Sample(from: -2, to: -2)
  }
  static var sampleFull: Sample {
    Sample(from: -1, to: -1)
  }
  static var sampleBadgersFull: Sample {
    Sample(from: -1, to: -1, stickers: [.badgers])
  }
  static var sampleAwardHalf: Sample {
    Sample(
      from: 0,
      to: Int(AwardEnum.allCases.count / 2)
    )
  }
  static var sampleEntryAlmost: Sample {
    Sample(
      from: 0,
      to: Int(
        (StickerEnum.standard.amount
          * DifficultyLevelEnum.low.progress)
          - 2
      )
    )
  }
  static var sampleEntryLowHalf: Sample {
    Sample(
      from: Int(
        ((StickerEnum.standard.amount / 2)
          * DifficultyLevelEnum.low.progress) - 1
      ),
      to: Int(
        (StickerEnum.standard.amount
          * DifficultyLevelEnum.low.progress)
          - 2
      )
    )
  }
  static var sampleEntryMediumHalf: Sample {
    Sample(
      from: Int(
        ((StickerEnum.standard.amount / 2)
          * DifficultyLevelEnum.medium.progress) - 1
      ),
      to: Int(
        (StickerEnum.standard.amount
          * DifficultyLevelEnum.medium.progress)
          - 2
      ),
      difficultyLevel: .medium
    )
  }
  static var sampleStickerFull: Sample {
    Sample(from: -1, to: -1, stickers: [.standard, .bears])
  }
  static var sampleStandardStickerFull: Sample { Sample(from: -1, to: -1) }

  static var sampleStandardStickerHalf: Sample {
    Sample(from: 0, to: Int(StickerEnum.standard.amount / 2))
  }
  static var sampleBearsStickerFull: Sample {
    Sample(from: -1, to: -1, stickers: [.bears])
  }
  static var sampleProfile: Sample { Sample(from: 0, to: 1) }

  static func parseSamples(_ dataContainer: DataContainer, _ samples: Samples) {
    var delta: Int
    do {
      try dataContainer.context.delete(model: AwardModel.self)
      try dataContainer.context.delete(model: EntryModel.self)
      try dataContainer.context.delete(model: StickerModel.self)
      try dataContainer.context.delete(model: ProfileModel.self)
      try dataContainer.context.save()

      if samples.award.to != -2
        || samples.award.from != -2
      {
        delta = samples.award.to - samples.award.from

        let awardModelSamples: [AwardModel] = AwardModel.generateSampleData(
          stickers: samples.award.stickers,
          awards: samples.award.awards,
          date: samples.award.date,
        )

        if samples.award.to == -1
          || samples.award.from == -1
        {
          for award in awardModelSamples {
            dataContainer.context.insert(award)
          }
        } else {
          if delta > 0 && awardModelSamples.count > delta {
            for award in awardModelSamples.slice(
              from: samples.award.from,
              to: samples.award.to
            )! {
              dataContainer.context.insert(award)
            }
          }
        }
      }

      if samples.entry.to != -2
        || samples.entry.from != -2
      {
        delta = samples.entry.to - samples.entry.from

        let entryModelSamples: [EntryModel] = EntryModel.generateSampleData(
          profileUUID: samples.entry.profileUUID,
          difficultyLevel: samples.entry.difficultyLevel,
          stickers: samples.entry.stickers,
          date: samples.entry.date,
        )

        if samples.entry.to == -1
          || samples.entry.from == -1
        {
          for entry in entryModelSamples {
            dataContainer.context.insert(entry)
          }
        } else {
          if delta >= 0 && entryModelSamples.count > delta {
            for entry in entryModelSamples.slice(
              from: samples.entry.from,
              to: samples.entry.to
            )! {
              dataContainer.context.insert(entry)
            }
          }
        }
      }

      if samples.sticker.to != -2
        || samples.sticker.from != -2
      {
        let sampleData: [StickerModel] = StickerModel.generateSampleData(
          stickers: samples.sticker.stickers
        )

        delta = samples.sticker.to - samples.sticker.from

        if samples.sticker.to == -1
          || samples.sticker.from == -1
        {
          for sticker in sampleData {
            dataContainer.context.insert(sticker)
          }
        } else {
          if delta > 0 && sampleData.count > delta {
            for sticker in sampleData.slice(
              from: samples.sticker.from,
              to: samples.sticker.to
            )! {
              dataContainer.context.insert(sticker)
            }
          }
        }
      }

      if samples.profile.to != -2
        || samples.profile.from != -2
      {
        delta = samples.profile.to - samples.profile.from

        if delta > 0 {
          dataContainer.context.insert(ProfileModel.sampleFormalLow)
        }
      }

      try dataContainer.context.save()
    } catch {
      print(error.localizedDescription)
    }
  }
}

#Preview("English") {
  PreviewContainerView {

  }
}
