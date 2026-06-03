//
//  Profile.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 19.03.2026.
//

import Combine

final class Profile: ObservableObject {
  @Published var profileModel: ProfileModel?
  @Published var profileModelDTO: ProfileModelDTO?
  @Published var subscriptionDTO: SubscriptionDTO

  private let profileModelDTOFactory: ProfileModelDTOFactory

  init(
    profileModel: ProfileModel?,
    profileModelDTO: ProfileModelDTO? = nil,
    profileModelDTOFactory: ProfileModelDTOFactory = ProfileModelDTOFactory(),
    subscriptionDTO: SubscriptionDTO = SubscriptionDTO(),
  ) {
    self.profileModel = profileModel
    self.profileModelDTO = profileModelDTO
    self.profileModelDTOFactory = profileModelDTOFactory
    self.subscriptionDTO = subscriptionDTO
  }

  func updateProfileModel(_ profileModelDTO: ProfileModelDTO?) {
    if let profileModelDTO = profileModelDTO {
      self.profileModel = profileModelDTOFactory.toModel(profileModelDTO)

      resetProfileDTO()
    }
  }

  func setProfileModel(_ profileModel: ProfileModel?) {
    self.profileModel = profileModel

    resetProfileDTO()
  }

  func resetProfileDTO() {
    if let profileModel = self.profileModel {
      profileModelDTO = profileModelDTOFactory.fromModel(profileModel)
    }
  }

  func setDifficultyLevel(_ difficultyLevel: DifficultyLevelEnum) {
    if let profileModel = self.profileModel {
      profileModel.settings.difficultyLevel = difficultyLevel

      resetProfileDTO()
    }
  }

  func setSticker(_ sticker: StickerEnum) {
    if let profileModel = self.profileModel {
      profileModel.settings.sticker = sticker

      resetProfileDTO()
    }
  }

  func setTheme(_ theme: Theme) {
    if let profileModel = self.profileModel {
      profileModel.settings.theme = theme

      resetProfileDTO()
    }
  }

  func deleteSubscriptions(_ subscriptions: SubscriptionEnum...) {
    for subscription in subscriptions {
      if let index = subscriptionDTO.list.firstIndex(of: subscription) {
        subscriptionDTO.list.remove(at: index)
      }
    }
  }

  func addSubscription(_ subscription: SubscriptionEnum) {
    if !hasSubscription(subscription) {
      subscriptionDTO.list.append(subscription)
    }
  }

  func hasSubscription(_ subscription: SubscriptionEnum) -> Bool {
    return subscriptionDTO.list.contains(subscription)
  }

  func countSubscriptions() -> Int {
    return subscriptionDTO.list.count
  }

  func addSubscriptionTier(_ subscriptionTier: SubscriptionTierEnum) {
    if !subscriptionDTO.tiers.contains(subscriptionTier) {
      subscriptionDTO.tiers.append(subscriptionTier)
    }
  }

  func deleteSubscriptionTier(_ subscriptionTier: SubscriptionTierEnum) {
    if let index = subscriptionDTO.tiers.firstIndex(of: subscriptionTier) {
      subscriptionDTO.tiers.remove(at: index)
    }
  }

  func hasPerkCrown() -> Bool {
    for tier in subscriptionDTO.tiers {
      if tier.hasPerk(.crown) {
        return true
      }
    }

    return false
  }

  func hasPerkProfile(amount: Int) -> Bool {
    for tier in subscriptionDTO.tiers {
      if tier.hasPerk(.profiles) && PerkEnum.profiles.canCreateNewProfile(amount) {
        return true
      }

      if tier.hasPerk(.unlimitedProfiles) && PerkEnum.unlimitedProfiles.canCreateNewProfile(amount)
      {
        return true
      }
    }

    return false
  }

  func hasPerkManualStickers() -> Bool {
    for tier in subscriptionDTO.tiers {
      if tier.hasPerk(.manualStickers) {
        return true
      }
    }

    return false
  }
}

extension Profile {
  static var sampleEmpty: Profile = Profile(
    profileModel: nil,
    profileModelDTO: nil,
  )
  static var sampleFormalLow: Profile = Profile(
    profileModel: .sampleFormalLow,
    profileModelDTO: ProfileModelDTOFactory().fromModel(.sampleFormalLow),
  )
  static var sampleFormalLowBadgers: Profile = Profile(
    profileModel: .sampleFormalLowBadgers,
    profileModelDTO: ProfileModelDTOFactory().fromModel(.sampleFormalLowBadgers),
  )
  static var sampleFormalMedium: Profile = Profile(
    profileModel: .sampleFormalMedium,
    profileModelDTO: ProfileModelDTOFactory().fromModel(.sampleFormalMedium),
  )
  static var sampleFormalHigh: Profile = Profile(
    profileModel: .sampleFormalHigh,
    profileModelDTO: ProfileModelDTOFactory().fromModel(.sampleFormalHigh),
  )
  static var sampleRoyalLow: Profile = Profile(
    profileModel: .sampleRoyalLow,
    profileModelDTO: ProfileModelDTOFactory().fromModel(.sampleRoyalLow),
  )
  static var sampleRoyalMedium: Profile = Profile(
    profileModel: .sampleRoyalMedium,
    profileModelDTO: ProfileModelDTOFactory().fromModel(.sampleRoyalMedium),
  )
  static var sampleRoyalHigh: Profile = Profile(
    profileModel: .sampleRoyalHigh,
    profileModelDTO: ProfileModelDTOFactory().fromModel(.sampleRoyalHigh),
  )
  static var sampleForestLow: Profile = Profile(
    profileModel: .sampleForestLow,
    profileModelDTO: ProfileModelDTOFactory().fromModel(.sampleForestLow),
  )
  static var sampleForestMedium: Profile = Profile(
    profileModel: .sampleForestMedium,
    profileModelDTO: ProfileModelDTOFactory().fromModel(.sampleForestMedium),
  )
  static var sampleForestHigh: Profile = Profile(
    profileModel: .sampleForestHigh,
    profileModelDTO: ProfileModelDTOFactory().fromModel(.sampleForestHigh),
  )
  static var sampleHarvestLow: Profile = Profile(
    profileModel: .sampleHarvestLow,
    profileModelDTO: ProfileModelDTOFactory().fromModel(.sampleHarvestLow),
  )
  static var sampleHarvestMedium: Profile = Profile(
    profileModel: .sampleHarvestMedium,
    profileModelDTO: ProfileModelDTOFactory().fromModel(.sampleHarvestMedium),
  )
  static var sampleHarvestHigh: Profile = Profile(
    profileModel: .sampleHarvestHigh,
    profileModelDTO: ProfileModelDTOFactory().fromModel(.sampleHarvestHigh),
  )
  static var sampleMidnightLow: Profile = Profile(
    profileModel: .sampleMidnightLow,
    profileModelDTO: ProfileModelDTOFactory().fromModel(.sampleMidnightLow),
  )
  static var sampleMidnightMedium: Profile = Profile(
    profileModel: .sampleMidnightMedium,
    profileModelDTO: ProfileModelDTOFactory().fromModel(
      .sampleMidnightMedium
    ),
  )
  static var sampleMidnightHigh: Profile = Profile(
    profileModel: .sampleMidnightHigh,
    profileModelDTO: ProfileModelDTOFactory().fromModel(.sampleMidnightHigh),
  )
  static var sampleFormalLowGold: Profile = Profile(
    profileModel: .sampleFormalLow,
    profileModelDTO: ProfileModelDTOFactory().fromModel(.sampleFormalLow),
    subscriptionDTO: .gold,
  )
}
