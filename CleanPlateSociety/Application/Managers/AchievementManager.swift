//
//  ProfileManager.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 19.03.2026.
//

import Foundation
import SwiftData

@MainActor
class AwardManager {
  private let modelContainer: ModelContainer

  init(modelContainer: ModelContainer) {
    self.modelContainer = modelContainer
  }

  @MainActor func add(
    count: Int,
    profileUUID: UUID,
    sticker: StickerEnum
  ) -> AwardModel? {
    if let award = isNeededToUnlock(
      count: count,
      profileUUID: profileUUID,
    ) {
      let awardModel: AwardModel = AwardModel(
        profileUUID: profileUUID,
        value: award,
        sticker: sticker,
        timestamp: Date.timeZonedNow
      )

      modelContainer.mainContext.insert(awardModel)

      return awardModel
    }

    return nil
  }

  @MainActor func isNeededToUnlock(
    count: Int,
    profileUUID: UUID,
  ) -> AwardEnum? {
    let profileUUIDRawValue: String = profileUUID.uuidString

    do {
      let awardUnlockedAmount: Int = try modelContainer.mainContext
        .fetchCount(
          FetchDescriptor<AwardModel>(
            predicate: #Predicate<AwardModel> { award in
              award.profileUUIDRawValue == profileUUIDRawValue
            }
          )
        )

      if awardUnlockedAmount == AwardEnum.allCases.count {
        return nil
      }

      for (index, award) in AwardEnum.allCases.enumerated() {
        if index == awardUnlockedAmount
          && award.requirement == count
        {
          return award
        }
      }
    } catch {
      return nil
    }

    return nil
  }
}
