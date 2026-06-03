//
//  ContentViewModelTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 23.04.2026.
//

import Testing

@testable import CleanPlateSociety

@MainActor
func contentViewModelPrepareArgumentsInput() async -> [ContentViewModelTest.Input] {
  return [
    ContentViewModelTest.Input(
      expected: true,
      profileModelDTO: Profile.sampleFormalLow.profileModelDTO,
      sticker: .standard
    ),
    ContentViewModelTest.Input(
      expected: false,
      profileModelDTO: nil,
      sticker: .standard
    ),
    ContentViewModelTest.Input(
      expected: false,
      profileModelDTO: Profile.sampleFormalLow.profileModelDTO,
      sticker: nil
    ),
    ContentViewModelTest.Input(
      expected: false,
      profileModelDTO: nil,
      sticker: nil
    ),
  ]
}

@Suite(.tags(.viewModel))
@MainActor
struct ContentViewModelTest {
  struct Input {
    let expected: Bool
    let profileModelDTO: ProfileModelDTO?
    let sticker: StickerEnum?
  }

  @Test(
    "canShowTabs",
    arguments: await contentViewModelPrepareArgumentsInput()
  ) func testCanShowTabs(input: Input) async throws {
    let sut = ContentView.ViewModel(
      sticker: input.sticker,
      profileModelDTO: input.profileModelDTO,
    )

    #expect(input.expected == sut.canShowTabs())
  }
}
