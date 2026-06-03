//
//  ModifyProfileViewModelTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 23.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

func modifyProfileViewModelPrepareArgumentsInputOnAppear() async -> [ModifyProfileViewModelTest
  .InputOnAppear]
{
  return [
    await ModifyProfileViewModelTest.InputOnAppear(
      disabled: true,
      expectedDifficultyLevel: Profile.sampleFormalLow.profileModelDTO!.settings.difficultyLevel,
      expectedHaptic: Profile.sampleFormalLow.profileModelDTO!.settings.haptic,
      expectedName: Profile.sampleFormalLow.profileModelDTO!.name,
      expectedSticker: Profile.sampleFormalLow.profileModelDTO!.settings.sticker,
      expectedTheme: Profile.sampleFormalLow.profileModelDTO!.settings.theme,
      profileModelDTO: Profile.sampleFormalLow.profileModelDTO!,
    ),
    await ModifyProfileViewModelTest.InputOnAppear(
      disabled: true,
      expectedDifficultyLevel: Profile.sampleForestMedium.profileModelDTO!.settings.difficultyLevel,
      expectedHaptic: Profile.sampleForestMedium.profileModelDTO!.settings.haptic,
      expectedName: Profile.sampleForestMedium.profileModelDTO!.name,
      expectedSticker: Profile.sampleForestMedium.profileModelDTO!.settings.sticker,
      expectedTheme: Profile.sampleForestMedium.profileModelDTO!.settings.theme,
      profileModelDTO: Profile.sampleForestMedium.profileModelDTO!,
    ),
    await ModifyProfileViewModelTest.InputOnAppear(
      disabled: false,
      expectedDifficultyLevel: .low,
      expectedHaptic: true,
      expectedName: "",
      expectedSticker: .standard,
      expectedTheme: .formal,
      profileModelDTO: Profile.sampleFormalLow.profileModelDTO!,
    ),
    await ModifyProfileViewModelTest.InputOnAppear(
      disabled: false,
      expectedDifficultyLevel: .low,
      expectedHaptic: true,
      expectedName: "",
      expectedSticker: .standard,
      expectedTheme: .formal,
      profileModelDTO: Profile.sampleForestMedium.profileModelDTO!,
    ),
  ]
}

@Suite(.tags(.viewModel))
@MainActor
struct ModifyProfileViewModelTest {
  struct InputOnAppear {
    let disabled: Bool
    let expectedDifficultyLevel: DifficultyLevelEnum
    let expectedHaptic: Bool
    let expectedName: String
    let expectedSticker: StickerEnum
    let expectedTheme: Theme
    let profileModelDTO: ProfileModelDTO
  }

  @Test(
    "reset",
    arguments: await modifyProfileViewModelPrepareArgumentsInputOnAppear()
  ) func testOnAppear(input: InputOnAppear) async throws {
    let sut = ModifyProfileView.ViewModel(disabled: input.disabled)

    sut.reset(profileModelDTO: input.profileModelDTO)

    #expect(input.expectedDifficultyLevel == sut.difficultyLevel)
    #expect(input.expectedHaptic == sut.haptic)
    #expect(input.expectedName == sut.name)
    #expect(input.expectedSticker == sut.sticker)
    #expect(input.expectedTheme == sut.theme)
  }
}
