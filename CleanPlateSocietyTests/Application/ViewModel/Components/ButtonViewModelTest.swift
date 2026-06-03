//
//  ButtonViewModelTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 21.04.2026.
//

import Testing

@testable import CleanPlateSociety

let societyRepository = SocietyRepository()

func buttonViewModelPrepareArgumentsInputGetText() async -> [ButtonViewModelTest.InputGetText] {
  return [
    await ButtonViewModelTest.InputGetText(type: .agree, expected: societyRepository.buttonAgree()),
    ButtonViewModelTest.InputGetText(type: .profile, expected: nil),
    await ButtonViewModelTest.InputGetText(
      type: .tutorialStage1, expected: societyRepository.tutorialStage1Button()),
    await ButtonViewModelTest.InputGetText(
      type: .tutorialStage2, expected: societyRepository.tutorialStage2Button()),
    await ButtonViewModelTest.InputGetText(
      type: .tutorialStage3, expected: societyRepository.tutorialStage3Button()),
    await ButtonViewModelTest.InputGetText(
      type: .tutorialStage4, expected: societyRepository.tutorialStage4Button()),
  ]
}

@Suite(.tags(.viewModel))
@MainActor
struct ButtonViewModelTest {
  struct InputGetText: Sendable {
    let type: ButtonView.ViewModel.TypeEnum
    let expected: String?
  }
  @Test(
    "getText",
    arguments: await buttonViewModelPrepareArgumentsInputGetText()
  ) func testGetText(input: InputGetText) async throws {
    let sut = ButtonView.ViewModel(type: input.type)

    #expect(input.expected == sut.getText())
  }

  struct InputGetTheme {
    let type: ButtonView.ViewModel.TypeEnum
    let expected: BackgroundAdaptiveModifier.BackgroundThemeEnum
  }

  @Test(
    "getTheme",
    arguments: [
      InputGetTheme(type: .agree, expected: .button),
      InputGetTheme(type: .profile, expected: .buttonProfile),
      InputGetTheme(type: .tutorialStage1, expected: .button),
      InputGetTheme(type: .tutorialStage2, expected: .button),
      InputGetTheme(type: .tutorialStage3, expected: .button),
      InputGetTheme(type: .tutorialStage4, expected: .button),
    ]
  ) func testGetTheme(input: InputGetTheme) async throws {
    let sut = ButtonView.ViewModel(type: input.type)

    #expect(input.expected == sut.getTheme())
  }

}
