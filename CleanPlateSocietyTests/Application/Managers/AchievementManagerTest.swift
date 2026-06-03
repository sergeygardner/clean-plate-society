//
//  AwardManagerTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 28.04.2026.
//

import Foundation
import SwiftData
import SwiftUI
import Testing

@testable import CleanPlateSociety

func awardManagerPrepareArgumentsInputAdd() async
  -> [AwardManagerTest.InputAdd]
{
  return [
    await AwardManagerTest.InputAdd(
      awardFrom: 0,
      awardTo: 8,
      count: AwardEnum.level10.requirement,
      entryFrom: 0,
      entryTo: AwardEnum.level10.requirement - 2,
      expected: AwardEnum.level10,
      profileModelDTO: Profile.sampleFormalLow.profileModelDTO!,
      sticker: StickerEnum.standard
    ),
    await AwardManagerTest.InputAdd(
      awardFrom: 0,
      awardTo: AwardEnum.allCases.count - 1,
      count: AwardEnum.allCases.count,
      entryFrom: 0,
      entryTo: AwardEnum.level10.requirement - 2,
      expected: nil,
      profileModelDTO: Profile.sampleFormalLow.profileModelDTO!,
      sticker: StickerEnum.standard
    ),
  ]
}
func awardManagerPrepareArgumentsInputIsNeededToUnlock() async
  -> [AwardManagerTest.InputIsNeededToUnlock]
{
  return [
    await AwardManagerTest.InputIsNeededToUnlock(
      awardFrom: 0,
      awardTo: 8,
      count: AwardEnum.level10.requirement,
      entryFrom: 0,
      entryTo: AwardEnum.level10.requirement - 2,
      expected: AwardEnum.level10,
      profileModelDTO: Profile.sampleFormalLow.profileModelDTO!,
    ),
    await AwardManagerTest.InputIsNeededToUnlock(
      awardFrom: 0,
      awardTo: AwardEnum.allCases.count - 1,
      count: AwardEnum.allCases.count,
      entryFrom: 0,
      entryTo: AwardEnum.level10.requirement - 2,
      expected: nil,
      profileModelDTO: Profile.sampleFormalLow.profileModelDTO!,
    ),
  ]
}

@Suite(.tags(.misc))
@MainActor
struct AwardManagerTest {
  let dataContainer: DataContainer

  init() throws {
    switch DataContainer.shared {
    case .success(let dataContainer):
      self.dataContainer = dataContainer
    case .failure(let error):
      throw error
    }
  }

  struct InputAdd: Sendable {
    let awardFrom: Int
    let awardTo: Int
    let count: Int
    let entryFrom: Int
    let entryTo: Int
    let expected: AwardEnum?
    let profileModelDTO: ProfileModelDTO
    let sticker: StickerEnum
  }

  @Test(
    "testAdd",
    arguments: await awardManagerPrepareArgumentsInputAdd()
  ) func testAddUnlocked(input: InputAdd) async throws {
    PreviewContainerView<EmptyView>.parseSamples(
      dataContainer,
      PreviewContainerView.Samples(
        award: PreviewContainerView.Sample(
          from: input.awardFrom,
          to: input.awardTo,
        ),
        entry: PreviewContainerView.Sample(
          from: input.entryFrom,
          to: input.entryTo,
        ),
      )
    )

    #expect(throws: Never.self) {
      let awardModel = dataContainer.awardManager.add(
        count: input.count,
        profileUUID: input.profileModelDTO.uuid,
        sticker: input.sticker
      )

      #expect(input.expected == awardModel?.value)
    }
  }

  struct InputIsNeededToUnlock: Sendable {
    let awardFrom: Int
    let awardTo: Int
    let count: Int
    let entryFrom: Int
    let entryTo: Int
    let expected: AwardEnum?
    let profileModelDTO: ProfileModelDTO
  }

  @Test(
    "testIsNeededToUnlock",
    arguments: await awardManagerPrepareArgumentsInputIsNeededToUnlock()
  ) func testIsNeededToUnlock(input: InputIsNeededToUnlock) async throws {
    PreviewContainerView<EmptyView>.parseSamples(
      dataContainer,
      PreviewContainerView.Samples(
        award: PreviewContainerView.Sample(
          from: input.awardFrom,
          to: input.awardTo,
        ),
        entry: PreviewContainerView.Sample(
          from: input.entryFrom,
          to: input.entryTo,
        ),
      )
    )

    #expect(
      input.expected
        == dataContainer.awardManager.isNeededToUnlock(
          count: input.count,
          profileUUID: input.profileModelDTO.uuid,
        )
    )
  }
}
