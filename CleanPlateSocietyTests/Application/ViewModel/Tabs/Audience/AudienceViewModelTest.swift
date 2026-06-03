//
//  AudienceViewModelTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 23.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

@MainActor
func newViewModelPrepareInputCanDo() async -> [AudienceViewModelTest.InputCanDo] {
  var arguments: [AudienceViewModelTest.InputCanDo] = []
  let d1 = StickerEnum.standard.amount
  let d2 = Int(d1 / 2)

  for dl in DifficultyLevelEnum.allCases {
    arguments.append(input(dl, 0, 0))
    arguments.append(input(dl, 1, 0))
    arguments.append(input(dl, d2, 0))
    arguments.append(input(dl, d1, -1))
    arguments.append(input(dl, d1, 0, .chooseStickerView))
  }

  func input(
    _ difficultyLevel: DifficultyLevelEnum,
    _ count: Int,
    _ advanced: Int,
    _ expected: AudienceView.ViewModel.StatusEnum = .addButtonView
  ) -> AudienceViewModelTest.InputCanDo {
    return AudienceViewModelTest.InputCanDo(
      difficultyLevel: difficultyLevel,
      entryModelsCount: count + advanced,
      expected: expected,
      stickerAmount: StickerEnum.standard.amount
    )
  }

  return arguments
}

@MainActor
func newViewModelPrepareInputShowChooseStickerView()
  async -> [AudienceViewModelTest.InputShowChooseStickerView]
{
  var arguments: [AudienceViewModelTest.InputShowChooseStickerView] = []
  let d1 = StickerEnum.standard.amount
  let d2 = Int(d1 / 2)

  for dl in DifficultyLevelEnum.allCases {
    arguments.append(input(dl, 0, 0, 0))
    arguments.append(input(dl, 1, 0, 0))
    arguments.append(input(dl, 1, 1, 0, ))
    arguments.append(input(dl, 1, 2, 0))
    arguments.append(input(dl, Int(d2 / dl.progress), 0, 0))
    arguments.append(input(dl, Int(d2 / dl.progress), 1, 0))
    arguments.append(input(dl, Int(d2 / dl.progress), d2 - 1, 0))
    arguments.append(input(dl, Int(d2 / dl.progress), d2, 0))
    arguments.append(input(dl, Int(d1 / dl.progress), 0, -1))
    arguments.append(input(dl, Int(d1 / dl.progress), 1, -1))
    arguments.append(input(dl, Int(d1 / dl.progress), d1 - 1, -1))
    arguments.append(input(dl, Int(d1 / dl.progress), d1, -1))
    arguments.append(input(dl, Int(d1 / dl.progress), 0, 0))
    arguments.append(input(dl, Int(d1 / dl.progress), 1, 0))
    arguments.append(input(dl, Int(d1 / dl.progress), d2, 0))
    arguments.append(input(dl, Int(d1 / dl.progress), d1 - 1, 0))
    arguments.append(input(dl, Int(d1 / dl.progress), d1, 0, true))
  }

  func input(
    _ difficultyLevel: DifficultyLevelEnum,
    _ count: Int,
    _ index: Int,
    _ advanced: Int,
    _ expected: Bool = false
  ) -> AudienceViewModelTest.InputShowChooseStickerView {
    return AudienceViewModelTest.InputShowChooseStickerView(
      difficultyLevel: difficultyLevel,
      entryModelsCount: (count * difficultyLevel.progress) + advanced,
      expected: expected,
      index: index,
      stickerAmount: StickerEnum.standard.amount
    )
  }

  return arguments
}

@MainActor
func newViewModelPrepareInputShowAddButtonView()
  async -> [AudienceViewModelTest.InputShowAddButtonView]
{
  var arguments: [AudienceViewModelTest.InputShowAddButtonView] = []
  let d1 = StickerEnum.standard.amount
  let d2 = Int(d1 / 2)

  for dl in DifficultyLevelEnum.allCases {
    arguments.append(input(dl, 0, 0, 0, true))
    arguments.append(input(dl, 1, 0, 0))
    arguments.append(input(dl, 1, 1, 0, true))
    arguments.append(input(dl, 1, 2, 0))
    arguments.append(input(dl, Int(d2 / dl.progress), 0, 0))
    arguments.append(input(dl, Int(d2 / dl.progress), 1, 0))
    arguments.append(input(dl, Int(d2 / dl.progress), d2 - 1, 0))
    arguments.append(input(dl, Int(d2 / dl.progress), d2, 0, true))
    arguments.append(input(dl, Int(d1 / dl.progress), 0, -1))
    arguments.append(input(dl, Int(d1 / dl.progress), 1, -1))
    arguments.append(input(dl, Int(d1 / dl.progress), d1 - 1, -1, true))
    arguments.append(input(dl, Int(d1 / dl.progress), d1, -1))
    arguments.append(input(dl, Int(d1 / dl.progress), 0, 0))
    arguments.append(input(dl, Int(d1 / dl.progress), 1, 0))
    arguments.append(input(dl, Int(d1 / dl.progress), d2, 0))
    arguments.append(input(dl, Int(d1 / dl.progress), d1 - 1, 0))
    arguments.append(input(dl, Int(d1 / dl.progress), d1, 0))
  }

  func input(
    _ difficultyLevel: DifficultyLevelEnum,
    _ count: Int,
    _ index: Int,
    _ advanced: Int,
    _ expected: Bool = false
  ) -> AudienceViewModelTest.InputShowAddButtonView {
    return AudienceViewModelTest.InputShowAddButtonView(
      difficultyLevel: difficultyLevel,
      entryModelsCount: (count * difficultyLevel.progress) + advanced,
      expected: expected,
      index: index,
      stickerAmount: StickerEnum.standard.amount
    )
  }

  return arguments
}

@MainActor
func newViewModelPrepareInputSetDelay() async -> [AudienceViewModelTest.InputSetDelay] {
  return [
    AudienceViewModelTest.InputSetDelay(
      expected: Date.timeZonedNow.startOfDay.advanced(by: -1),
      difficultyLevel: .low,
      lastModelDate: nil
    ),
    AudienceViewModelTest.InputSetDelay(
      expected: Date.timeZonedNow.startOfDay.getBreakpoint(.low),
      difficultyLevel: .low,
      lastModelDate: Date.timeZonedNow.startOfDay
    ),
    AudienceViewModelTest.InputSetDelay(
      expected: Date.timeZonedNow.startOfDay.getBreakpoint(.medium),
      difficultyLevel: .medium,
      lastModelDate: Date.timeZonedNow.startOfDay
    ),
    AudienceViewModelTest.InputSetDelay(
      expected: Date.timeZonedNow.startOfDay.getBreakpoint(.high),
      difficultyLevel: .high,
      lastModelDate: Date.timeZonedNow.startOfDay
    ),
  ]
}

@MainActor
func newViewModelPrepareInputSetDisabled() async -> [AudienceViewModelTest.InputSetDisabled] {
  return [
    AudienceViewModelTest.InputSetDisabled(
      expected: false,
      difficultyLevel: .low,
      lastModelDate: nil
    ),
    AudienceViewModelTest.InputSetDisabled(
      expected: false,
      difficultyLevel: .low,
      lastModelDate: Date.timeZonedNow.hoursShift(
        -Int(24 / DifficultyLevelEnum.low.progress)
      )
    ),
    AudienceViewModelTest.InputSetDisabled(
      expected: false,
      difficultyLevel: .medium,
      lastModelDate: Date.timeZonedNow.hoursShift(
        -Int(24 / DifficultyLevelEnum.medium.progress)
      )
    ),
    AudienceViewModelTest.InputSetDisabled(
      expected: false,
      difficultyLevel: .high,
      lastModelDate: Date.timeZonedNow.hoursShift(
        -Int(24 / DifficultyLevelEnum.high.progress)
      )
    ),
    AudienceViewModelTest.InputSetDisabled(
      expected: true,
      difficultyLevel: .low,
      lastModelDate: Date.timeZonedNow.startOfHour.advanced(by: -10)
    ),
    AudienceViewModelTest.InputSetDisabled(
      expected: true,
      difficultyLevel: .medium,
      lastModelDate: Date.timeZonedNow.startOfHour.advanced(by: -10)
    ),
    AudienceViewModelTest.InputSetDisabled(
      expected: true,
      difficultyLevel: .high,
      lastModelDate: Date.timeZonedNow.startOfHour.advanced(by: -10)
    ),
  ]
}

@MainActor
func newViewModelPrepareInputSetRemaining() async -> [AudienceViewModelTest.InputSetRemaining] {
  return [
    AudienceViewModelTest.InputSetRemaining(
      expected: 0,
      difficultyLevel: .low,
      lastModelDate: nil
    ),
    AudienceViewModelTest.InputSetRemaining(
      expected: 0,
      difficultyLevel: .low,
      lastModelDate: Date.timeZonedNow.hoursShift(
        -Int(24 / DifficultyLevelEnum.low.progress)
      )
    ),
    AudienceViewModelTest.InputSetRemaining(
      expected: 0,
      difficultyLevel: .medium,
      lastModelDate: Date.timeZonedNow.hoursShift(
        -Int(24 / DifficultyLevelEnum.medium.progress)
      )
    ),
    AudienceViewModelTest.InputSetRemaining(
      expected: 0,
      difficultyLevel: .high,
      lastModelDate: Date.timeZonedNow.hoursShift(
        -Int(24 / DifficultyLevelEnum.high.progress)
      )
    ),
    AudienceViewModelTest.InputSetRemaining(
      expected: Date.timeZonedNow.startOfHour.advanced(by: -10)
        .getBreakpoint(.low).timeIntervalSinceNow,
      difficultyLevel: .low,
      lastModelDate: Date.timeZonedNow.startOfHour.advanced(by: -100)
    ),
    AudienceViewModelTest.InputSetRemaining(
      expected: Date.timeZonedNow.startOfHour.advanced(by: -10)
        .getBreakpoint(.medium).timeIntervalSinceNow,
      difficultyLevel: .medium,
      lastModelDate: Date.timeZonedNow.startOfHour.advanced(by: -10)
    ),
    AudienceViewModelTest.InputSetRemaining(
      expected: Date.timeZonedNow.startOfHour.advanced(by: -10)
        .getBreakpoint(.high).timeIntervalSinceNow,
      difficultyLevel: .high,
      lastModelDate: Date.timeZonedNow.startOfHour.advanced(by: -10)
    ),
  ]
}

@MainActor
func newViewModelPrepareInputSetCurrentIndex()
  async -> [AudienceViewModelTest.InputSetCurrentIndex]
{
  var arguments: [AudienceViewModelTest.InputSetCurrentIndex] = []
  let d1 = StickerEnum.standard.amount
  let d2 = Int(d1 / 2)

  for dl in DifficultyLevelEnum.allCases {
    arguments.append(input(dl, 0, 0, 0))
    arguments.append(input(dl, 1, 0, 1))
    arguments.append(input(dl, 2, 0, 2))
    arguments.append(input(dl, Int(d2 / dl.progress), 0, Int(d2 / dl.progress)))
    arguments.append(input(dl, Int(d2 / dl.progress), -1, d2 - 1))
    arguments.append(input(dl, Int(d1 / dl.progress), -1, d1 - 1))
    arguments.append(input(dl, Int(d1 / dl.progress), 0, d1))
  }

  func input(
    _ difficultyLevel: DifficultyLevelEnum,
    _ count: Int,
    _ advanced: Int,
    _ expected: Int
  ) -> AudienceViewModelTest.InputSetCurrentIndex {
    return AudienceViewModelTest.InputSetCurrentIndex(
      difficultyLevel: difficultyLevel,
      entryModelsCount: (count * difficultyLevel.progress) + advanced,
      expected: expected,
      stickerAmount: StickerEnum.standard.amount
    )
  }

  return arguments
}

@Suite(.tags(.viewModel))
@MainActor
struct AudienceViewModelTest {
  struct InputCanDo {
    let difficultyLevel: DifficultyLevelEnum
    let entryModelsCount: Int
    let expected: AudienceView.ViewModel.StatusEnum
    let stickerAmount: Int
  }

  @Test(
    "canDo",
    arguments: await newViewModelPrepareInputCanDo()
  ) func testCanDo(input: InputCanDo) async throws {
    let sut = prepareSut()

    sut.canDo(
      entryModelsCount: input.entryModelsCount,
      stickerAmount: input.stickerAmount,
    )

    #expect(input.expected == sut.status)
  }

  struct InputShowChooseStickerView {
    let difficultyLevel: DifficultyLevelEnum
    let entryModelsCount: Int
    let expected: Bool
    let index: Int
    let stickerAmount: Int
  }

  @Test(
    "showChooseStickerView",
    arguments: await newViewModelPrepareInputShowChooseStickerView()
  ) func testShowChooseStickerView(input: InputShowChooseStickerView)
    async throws
  {
    let sut = prepareSut()

    sut.canDo(
      entryModelsCount: input.entryModelsCount,
      stickerAmount: input.stickerAmount,
    )

    #expect(
      input.expected
        == sut.showChooseStickerView(
          index: input.index,
          stickerAmount: input.stickerAmount
        )
    )
  }

  struct InputShowAddButtonView {
    let difficultyLevel: DifficultyLevelEnum
    let entryModelsCount: Int
    let expected: Bool
    let index: Int
    let stickerAmount: Int
  }

  @Test(
    "showAddButtonView",
    arguments: await newViewModelPrepareInputShowAddButtonView()
  ) func testShowAddButtonView(input: InputShowAddButtonView) async throws {
    let sut = prepareSut()

    sut.canDo(
      entryModelsCount: input.entryModelsCount,
      stickerAmount: input.stickerAmount,
    )

    sut.setCurrentIndex(
      entryModelsCount: input.entryModelsCount,
      stickerAmount: input.stickerAmount
    )

    #expect(
      input.expected == sut.showAddButtonView(index: input.index)
    )
  }

  struct InputSetDelay {
    let expected: Date
    let difficultyLevel: DifficultyLevelEnum
    let lastModelDate: Date?
  }

  @Test(
    "setDelay",
    arguments: await newViewModelPrepareInputSetDelay()
  ) func testSetDelay(input: InputSetDelay) async throws {
    let sut = prepareSut()

    sut.setDelay(
      difficultyLevel: input.difficultyLevel,
      lastModelDate: input.lastModelDate
    )

    #expect(input.expected == sut.delay)
  }

  struct InputSetDisabled {
    let expected: Bool
    let difficultyLevel: DifficultyLevelEnum
    let lastModelDate: Date?
  }

  @Test(
    "setDisabled",
    arguments: await newViewModelPrepareInputSetDisabled()
  ) func testSetDisabled(input: InputSetDisabled) async throws {
    let sut = prepareSut()

    sut.setDelay(
      difficultyLevel: input.difficultyLevel,
      lastModelDate: input.lastModelDate
    )
    sut.setDisabled()

    #expect(input.expected == sut.disabled)
  }

  struct InputSetRemaining {
    let expected: TimeInterval
    let difficultyLevel: DifficultyLevelEnum
    let lastModelDate: Date?
  }

  @Test(
    "setRemaining",
    arguments: await newViewModelPrepareInputSetRemaining()
  ) func testSetRemaining(input: InputSetRemaining) async throws {
    let sut = prepareSut()

    sut.setDelay(
      difficultyLevel: input.difficultyLevel,
      lastModelDate: input.lastModelDate
    )
    sut.setDisabled()
    sut.setRemaining()

    #expect(input.expected >= sut.remaining)
  }

  struct InputSetCurrentIndex {
    let difficultyLevel: DifficultyLevelEnum
    let entryModelsCount: Int
    let expected: Int
    let stickerAmount: Int
  }

  @Test(
    "setCurrentIndex",
    arguments: await newViewModelPrepareInputSetCurrentIndex()
  ) func testSetCurrentIndex(input: InputSetCurrentIndex) async throws {
    let sut = prepareSut()

    sut.setCurrentIndex(
      entryModelsCount: input.entryModelsCount,
      stickerAmount: input.stickerAmount,
    )

    #expect(input.expected == sut.currentIndex)
  }

  struct InputApplyOpacity {
    let currentIndex: Int
    let index: Int
    let expected: Double
  }

  @Test(
    "applyOpacity",
    arguments: [
      InputApplyOpacity(currentIndex: 0, index: 0, expected: 1),
      InputApplyOpacity(currentIndex: 0, index: 1, expected: 0.4),
      InputApplyOpacity(currentIndex: 1, index: 1, expected: 1),
      InputApplyOpacity(currentIndex: 1, index: 2, expected: 0.4),
      InputApplyOpacity(currentIndex: 2, index: 1, expected: 1),
    ]
  ) func testApplyOpacity(input: InputApplyOpacity) async throws {
    let sut = prepareSut()

    sut.currentIndex = input.currentIndex

    #expect(input.expected == sut.applyOpacity(input.index))
  }

  struct InputCanApplyAnimation {
    let currentIndex: Int
    let index: Int
    let expected: Bool
  }

  @Test(
    "canApplyAnimation",
    arguments: [
      InputCanApplyAnimation(currentIndex: 3, index: 1, expected: true),
      InputCanApplyAnimation(currentIndex: 2, index: 2, expected: false),
      InputCanApplyAnimation(currentIndex: 1, index: 2, expected: false),
    ]
  ) func testCanApplyAnimation(input: InputCanApplyAnimation) async throws {
    let sut = prepareSut()

    sut.currentIndex = input.currentIndex

    #expect(input.expected == sut.canApplyAnimation(input.index))
  }

  struct InputApplyBlur {
    let currentIndex: Int
    let index: Int
    let expected: CGFloat
  }

  @Test(
    "applyBlur",
    arguments: [
      InputApplyBlur(currentIndex: 1, index: 1, expected: 0),
      InputApplyBlur(currentIndex: 1, index: 2, expected: 20),
      InputApplyBlur(currentIndex: 2, index: 1, expected: 0),
      InputApplyBlur(currentIndex: 0, index: 0, expected: 0),
    ]
  ) func testApplyBlur(input: InputApplyBlur) async throws {
    let sut = prepareSut()

    sut.currentIndex = input.currentIndex

    #expect(input.expected == sut.applyBlur(input.index))
  }

  struct InputCanUseStickers {
    let stickerModelsCount: Int
    let sticker: StickerEnum
    let expected: Bool
  }

  @Test(
    "canUseStickers",
    arguments: [
      InputCanUseStickers(
        stickerModelsCount: StickerEnum.standard.amount,
        sticker: .standard,
        expected: true
      ),
      InputCanUseStickers(
        stickerModelsCount: StickerEnum.manual1.amount,
        sticker: .manual1,
        expected: true
      ),
      InputCanUseStickers(
        stickerModelsCount: StickerEnum.standard.amount - 1,
        sticker: .standard,
        expected: false
      ),
      InputCanUseStickers(
        stickerModelsCount: StickerEnum.standard.amount + 1,
        sticker: .standard,
        expected: false
      ),
    ]
  ) func testCanUseStickers(input: InputCanUseStickers) async throws {
    let result = prepareSut().canUseStickers(
      input.stickerModelsCount,
      input.sticker
    )

    #expect(input.expected == result)
  }

  func prepareSut() -> AudienceView.ViewModel {
    return AudienceView.ViewModel()
  }
}
