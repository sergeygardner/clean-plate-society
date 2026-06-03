//
//  SocietyRepositoryTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 22.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

enum SocietyRepositoryTypeEnum {
  case normal
  case empty
}

func societyRepositoryPrepareExpectedString(_ id: String) async -> String {
  return String(
    localized: LocalizedStringResource(
      String.LocalizationValue(id),
      table: TranslationTableEnum.society.rawValue
    )
  )
}

@MainActor
func societyRepositoryPrepareArgumentsInputTutorialStage3Description2() async
  -> [SocietyRepositoryTest.InputTutorialStage3Description2]
{
  return [
    SocietyRepositoryTest.InputTutorialStage3Description2(
      type: .normal,
      expected: String(
        format: await societyRepositoryPrepareExpectedString(
          "society.tutorial.stage3.description2"
        ),
        StickerEnum.allValuesExceptStandard
      ),
      placeholder: StickerEnum.allValuesExceptStandard
    ),
    SocietyRepositoryTest.InputTutorialStage3Description2(
      type: .empty,
      expected: nil,
      placeholder: StickerEnum.allValuesExceptStandard
    ),
  ]
}

@Suite(.tags(.repository))
@MainActor
struct SocietyRepositoryTest {
  struct InputName {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "name",
    arguments: [
      InputName(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString("society.name")
      ),
      InputName(type: .empty, expected: nil),
    ]
  ) func testName(input: InputName) async throws {
    #expect(input.expected == prepareSut(input.type).name())
  }

  struct InputSlogan {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "slogan",
    arguments: [
      InputSlogan(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString("society.slogan")
      ),
      InputSlogan(type: .empty, expected: nil),
    ]
  ) func testSlogan(input: InputSlogan) async throws {
    #expect(input.expected == prepareSut(input.type).slogan())
  }

  struct InputSloganLating {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "sloganLating",
    arguments: [
      InputSloganLating(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString("society.slogan.latin")
      ),
      InputSloganLating(type: .empty, expected: nil),
    ]
  ) func testSloganLating(input: InputSloganLating) async throws {
    #expect(input.expected == prepareSut(input.type).sloganLating())
  }

  struct InputChancellorSignedAndSealed {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "chancellorSignedAndSealed",
    arguments: [
      InputChancellorSignedAndSealed(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.chancellor.signed.and.sealed"
        )
      ),
      InputChancellorSignedAndSealed(type: .empty, expected: nil),
    ]
  ) func testChancellorSignedAndSealed(input: InputChancellorSignedAndSealed)
    async throws
  {
    #expect(
      input.expected == prepareSut(input.type).chancellorSignedAndSealed()
    )
  }

  struct InputChancellorName {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "chancellorName",
    arguments: [
      InputChancellorName(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString("society.chancellor.name")
      ),
      InputChancellorName(type: .empty, expected: nil),
    ]
  ) func testChancellorName(input: InputChancellorName) async throws {
    #expect(input.expected == prepareSut(input.type).chancellorName())
  }

  struct InputTutorialStage1Text {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "tutorialStage1Text",
    arguments: [
      InputTutorialStage1Text(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.tutorial.stage1.text"
        )
      ),
      InputTutorialStage1Text(type: .empty, expected: nil),
    ]
  ) func testTutorialStage1Text(input: InputTutorialStage1Text) async throws {
    #expect(input.expected == prepareSut(input.type).tutorialStage1Text())
  }

  struct InputTutorialStage1Button {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "tutorialStage1Button",
    arguments: [
      InputTutorialStage1Button(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.tutorial.stage1.button.text"
        )
      ),
      InputTutorialStage1Button(type: .empty, expected: nil),
    ]
  ) func testTutorialStage1Button(input: InputTutorialStage1Button)
    async throws
  {
    #expect(input.expected == prepareSut(input.type).tutorialStage1Button())
  }

  struct InputTutorialStage2Title {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "tutorialStage2Title",
    arguments: [
      InputTutorialStage2Title(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.tutorial.stage2.title"
        )
      ),
      InputTutorialStage2Title(type: .empty, expected: nil),
    ]
  ) func testTutorialStage2Title(input: InputTutorialStage2Title) async throws {
    #expect(input.expected == prepareSut(input.type).tutorialStage2Title())
  }

  struct InputTutorialStage2Description {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "tutorialStage2Description",
    arguments: [
      InputTutorialStage2Description(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.tutorial.stage2.description"
        )
      ),
      InputTutorialStage2Description(type: .empty, expected: nil),
    ]
  ) func testTutorialStage2Description(input: InputTutorialStage2Description)
    async throws
  {
    #expect(
      input.expected == prepareSut(input.type).tutorialStage2Description()
    )
  }

  struct InputTutorialStage2Note {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "tutorialStage2Note",
    arguments: [
      InputTutorialStage2Note(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.tutorial.stage2.note"
        )
      ),
      InputTutorialStage2Note(type: .empty, expected: nil),
    ]
  ) func testTutorialStage2Note(input: InputTutorialStage2Note) async throws {
    #expect(input.expected == prepareSut(input.type).tutorialStage2Note())
  }

  struct InputTutorialStage2Button {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "tutorialStage2Button",
    arguments: [
      InputTutorialStage2Button(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.tutorial.stage2.button.text"
        )
      ),
      InputTutorialStage2Button(type: .empty, expected: nil),
    ]
  ) func testTutorialStage2Button(input: InputTutorialStage2Button)
    async throws
  {
    #expect(input.expected == prepareSut(input.type).tutorialStage2Button())
  }

  struct InputTutorialStage3Title {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "tutorialStage3Title",
    arguments: [
      InputTutorialStage3Title(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.tutorial.stage3.title"
        )
      ),
      InputTutorialStage3Title(type: .empty, expected: nil),
    ]
  ) func testTutorialStage3Title(input: InputTutorialStage3Title) async throws {
    #expect(input.expected == prepareSut(input.type).tutorialStage3Title())
  }

  struct InputTutorialStage3Description1 {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "tutorialStage3Description1",
    arguments: [
      InputTutorialStage3Description1(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.tutorial.stage3.description1"
        )
      ),
      InputTutorialStage3Description1(type: .empty, expected: nil),
    ]
  ) func testTutorialStage3Description1(
    input: InputTutorialStage3Description1
  ) async throws {
    #expect(
      input.expected == prepareSut(input.type).tutorialStage3Description1()

    )
  }

  struct InputTutorialStage3Description2 {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
    let placeholder: String
  }

  @Test(
    "tutorialStage3Description2",
    arguments: await societyRepositoryPrepareArgumentsInputTutorialStage3Description2()
  ) func testTutorialStage3Description2(
    input: InputTutorialStage3Description2
  ) async throws {
    #expect(
      input.expected == prepareSut(input.type).tutorialStage3Description2()

    )
  }

  struct InputTutorialStage3Button {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "tutorialStage3Button",
    arguments: [
      InputTutorialStage3Button(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.tutorial.stage3.button.text"
        )
      ),
      InputTutorialStage3Button(type: .empty, expected: nil),
    ]
  ) func testTutorialStage3Button(input: InputTutorialStage3Button)
    async throws
  {
    #expect(input.expected == prepareSut(input.type).tutorialStage3Button())
  }

  struct InputTutorialStage4Title {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "tutorialStage4Title",
    arguments: [
      InputTutorialStage4Title(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.tutorial.stage4.title"
        )
      ),
      InputTutorialStage4Title(type: .empty, expected: nil),
    ]
  ) func testTutorialStage4Title(input: InputTutorialStage4Title) async throws {
    #expect(input.expected == prepareSut(input.type).tutorialStage4Title())
  }

  struct InputTutorialStage4Description {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "tutorialStage4Description",
    arguments: [
      InputTutorialStage4Description(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.tutorial.stage4.description"
        )
      ),
      InputTutorialStage4Description(type: .empty, expected: nil),
    ]
  ) func testTutorialStage4Description(input: InputTutorialStage4Description)
    async throws
  {
    #expect(
      input.expected == prepareSut(input.type).tutorialStage4Description()
    )
  }

  struct InputTutorialStage4Note {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "tutorialStage4Note",
    arguments: [
      InputTutorialStage4Note(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.tutorial.stage4.note"
        )
      ),
      InputTutorialStage4Note(type: .empty, expected: nil),
    ]
  ) func testTutorialStage4Note(input: InputTutorialStage4Note) async throws {
    #expect(input.expected == prepareSut(input.type).tutorialStage4Note())
  }

  struct InputTutorialStage4Button {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "tutorialStage4Button",
    arguments: [
      InputTutorialStage4Button(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.tutorial.stage4.button.text"
        )
      ),
      InputTutorialStage4Button(type: .empty, expected: nil),
    ]
  ) func testTutorialStage4Button(input: InputTutorialStage4Button)
    async throws
  {
    #expect(input.expected == prepareSut(input.type).tutorialStage4Button())
  }

  struct InputDifficultyLevelTitle {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
    let difficultyLevel: DifficultyLevelEnum
  }

  @Test(
    "difficultyLevelTitle",
    arguments: [
      InputDifficultyLevelTitle(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.difficulty.level.\(DifficultyLevelEnum.low.name).title"
        ),
        difficultyLevel: DifficultyLevelEnum.low
      ),
      InputDifficultyLevelTitle(
        type: .empty,
        expected: nil,
        difficultyLevel: DifficultyLevelEnum.low
      ),
    ]
  ) func testDifficultyLevelTitle(input: InputDifficultyLevelTitle)
    async throws
  {
    #expect(
      input.expected
        == prepareSut(input.type).difficultyLevelTitle(
          difficultyLevel: input.difficultyLevel
        )

    )
  }

  struct InputDifficultyLevelLabel {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
    let difficultyLevel: DifficultyLevelEnum
  }

  @Test(
    "difficultyLevelLabel",
    arguments: [
      InputDifficultyLevelLabel(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.difficulty.level.\(DifficultyLevelEnum.low.name).label"
        ),
        difficultyLevel: .low
      ),
      InputDifficultyLevelLabel(
        type: .empty,
        expected: nil,
        difficultyLevel: .low
      ),
    ]
  ) func testDifficultyLevelLabel(input: InputDifficultyLevelLabel)
    async throws
  {
    #expect(
      input.expected
        == prepareSut(input.type).difficultyLevelLabel(
          difficultyLevel: input.difficultyLevel
        )

    )
  }

  struct InputDifficultyLevelNote {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
    let difficultyLevel: DifficultyLevelEnum
  }

  @Test(
    "difficultyLevelNote",
    arguments: [
      InputDifficultyLevelNote(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.difficulty.level.\(DifficultyLevelEnum.low.name).note"
        ),
        difficultyLevel: .low
      ),
      InputDifficultyLevelNote(
        type: .empty,
        expected: nil,
        difficultyLevel: .low
      ),
    ]
  ) func testDifficultyLevelNote(input: InputDifficultyLevelNote) async throws {
    #expect(
      input.expected
        == prepareSut(input.type).difficultyLevelNote(
          difficultyLevel: input.difficultyLevel
        )

    )
  }

  struct InputDifficultyLevelDescription {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
    let difficultyLevel: DifficultyLevelEnum
  }

  @Test(
    "difficultyLevelDescription",
    arguments: [
      InputDifficultyLevelDescription(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.difficulty.level.\(DifficultyLevelEnum.low.name).description"
        ),
        difficultyLevel: .low
      ),
      InputDifficultyLevelDescription(
        type: .empty,
        expected: nil,
        difficultyLevel: .low
      ),
    ]
  ) func testDifficultyLevelDescription(
    input: InputDifficultyLevelDescription
  ) async throws {
    #expect(
      input.expected
        == prepareSut(input.type).difficultyLevelDescription(
          difficultyLevel: input.difficultyLevel
        )
    )
  }

  struct InputThemeTitle {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
    let theme: Theme
  }

  @Test(
    "themeTitle",
    arguments: [
      InputThemeTitle(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.theme.\(Theme.formal.name).title"
        ),
        theme: .formal
      ),
      InputThemeTitle(
        type: .empty,
        expected: nil,
        theme: .formal
      ),
    ]
  ) func testThemeTitle(input: InputThemeTitle) async throws {
    #expect(
      input.expected == prepareSut(input.type).themeTitle(theme: input.theme)

    )
  }

  struct InputThemeDescription {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
    let theme: Theme
  }

  @Test(
    "themeDescription",
    arguments: [
      InputThemeDescription(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.theme.\(Theme.formal.name).description"
        ),
        theme: .formal
      ),
      InputThemeDescription(
        type: .empty,
        expected: nil,
        theme: .formal
      ),
    ]
  ) func testThemeDescription(input: InputThemeDescription) async throws {
    #expect(
      input.expected == prepareSut(input.type).themeDescription(theme: input.theme)

    )
  }

  struct InputButtonAgree {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "buttonAgree",
    arguments: [
      InputButtonAgree(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString("society.button.agree")
      ),
      InputButtonAgree(type: .empty, expected: nil),
    ]
  ) func testButtonAgree(input: InputButtonAgree) async throws {
    #expect(input.expected == prepareSut(input.type).buttonAgree())
  }

  struct InputStickersOutOfDataTitle1 {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "stickersOutOfDataTitle1",
    arguments: [
      InputStickersOutOfDataTitle1(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.stickers.out.of.data.title1"
        )
      ),
      InputStickersOutOfDataTitle1(type: .empty, expected: nil),
    ]
  ) func testStickersOutOfDataTitle1(input: InputStickersOutOfDataTitle1)
    async throws
  {
    #expect(
      input.expected == prepareSut(input.type).stickersOutOfDataTitle1()
    )
  }

  struct InputStickersOutOfDataTitle2 {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "stickersOutOfDataTitle2",
    arguments: [
      InputStickersOutOfDataTitle2(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.stickers.out.of.data.title2"
        )
      ),
      InputStickersOutOfDataTitle2(type: .empty, expected: nil),
    ]
  ) func testStickersOutOfDataTitle2(input: InputStickersOutOfDataTitle2)
    async throws
  {
    #expect(
      input.expected == prepareSut(input.type).stickersOutOfDataTitle2()
    )
  }

  struct InputStickersOutOfDataNote {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "stickersOutOfDataNote",
    arguments: [
      InputStickersOutOfDataNote(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.stickers.out.of.data.note"
        )
      ),
      InputStickersOutOfDataNote(type: .empty, expected: nil),
    ]
  ) func testStickersOutOfDataNote(input: InputStickersOutOfDataNote)
    async throws
  {
    #expect(
      input.expected == prepareSut(input.type).stickersOutOfDataNote()
    )
  }

  struct InputStickersOutOfDataDescription1 {
    let type: SocietyRepositoryTypeEnum
    let expected: AttributedString?
    let name: String
  }

  @Test(
    "stickersOutOfDataDescription1",
    arguments: [
      InputStickersOutOfDataDescription1(
        type: .normal,
        expected: try? AttributedString(
          markdown: String(
            format: await societyRepositoryPrepareExpectedString(
              "society.stickers.out.of.data.description1"
            ),
            "Test"
          )),
        name: "Test"
      ),
      InputStickersOutOfDataDescription1(
        type: .empty,
        expected: nil,
        name: "Test"
      ),
    ]
  ) func testStickersOutOfDataDescription1(
    input: InputStickersOutOfDataDescription1
  ) async throws {
    #expect(
      input.expected
        == prepareSut(input.type).stickersOutOfDataDescription1(
          name: input.name
        )

    )
  }

  struct InputStickersOutOfDataDescription2 {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "stickersOutOfDataDescription2",
    arguments: [
      InputStickersOutOfDataDescription2(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.stickers.out.of.data.description2"
        )
      ),
      InputStickersOutOfDataDescription2(type: .empty, expected: nil),
    ]
  ) func testStickersOutOfDataDescription2(
    input: InputStickersOutOfDataDescription2
  ) async throws {
    #expect(
      input.expected == prepareSut(input.type).stickersOutOfDataDescription2()

    )
  }

  struct InputStickersOutOfDataFootnote {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "stickersOutOfDataFootnote",
    arguments: [
      InputStickersOutOfDataFootnote(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.stickers.out.of.data.footnote"
        )
      ),
      InputStickersOutOfDataFootnote(type: .empty, expected: nil),
    ]
  ) func testStickersOutOfDataFootnote(input: InputStickersOutOfDataFootnote)
    async throws
  {
    #expect(
      input.expected == prepareSut(input.type).stickersOutOfDataFootnote()
    )
  }

  struct InputStickersOutOfDataEngagement {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "stickersOutOfDataEngagement",
    arguments: [
      InputStickersOutOfDataEngagement(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.stickers.out.of.data.engagement"
        )
      ),
      InputStickersOutOfDataEngagement(type: .empty, expected: nil),
    ]
  ) func testStickersOutOfDataEngagement(
    input: InputStickersOutOfDataEngagement
  ) async throws {
    #expect(
      input.expected == prepareSut(input.type).stickersOutOfDataEngagement()

    )
  }

  struct InputStickerOath {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "stickerOath",
    arguments: [
      InputStickerOath(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString("society.sticker.oath")
      ),
      InputStickerOath(type: .empty, expected: nil),
    ]
  ) func testStickerOath(input: InputStickerOath) async throws {
    #expect(input.expected == prepareSut(input.type).stickerOath())
  }

  struct InputStickerDownloadOath {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "stickerDownloadOath",
    arguments: [
      InputStickerDownloadOath(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.sticker.download.oath"
        )
      ),
      InputStickerDownloadOath(type: .empty, expected: nil),
    ]
  ) func testStickerDownloadOath(input: InputStickerDownloadOath) async throws {
    #expect(input.expected == prepareSut(input.type).stickerDownloadOath())
  }

  struct InputStickerHooked {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
    let sticker: StickerEnum
  }

  @Test(
    "stickerHooked",
    arguments: [
      InputStickerHooked(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.sticker.\(StickerEnum.standard.name).hooked"
        ),
        sticker: .standard
      ),
      InputStickerHooked(
        type: .empty,
        expected: nil,
        sticker: .standard
      ),
    ]
  ) func testStickerDownloadOath(input: InputStickerHooked) async throws {
    #expect(
      input.expected == prepareSut(input.type).stickerHooked(sticker: input.sticker)

    )
  }

  struct InputStickerHook {
    let type: SocietyRepositoryTypeEnum
    let expected: AttributedString?
  }

  @Test(
    "stickerHook",
    arguments: [
      InputStickerHook(
        type: .normal,
        expected: try? AttributedString(
          markdown: await societyRepositoryPrepareExpectedString("society.sticker.hook")
        )),
      InputStickerHook(type: .empty, expected: nil),
    ]
  ) func testStickerHook(input: InputStickerHook) async throws {
    #expect(input.expected == prepareSut(input.type).stickerHook())
  }

  struct InputStickerVibed {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
    let sticker: StickerEnum
  }

  @Test(
    "stickerVibed",
    arguments: [
      InputStickerVibed(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.sticker.\(StickerEnum.standard.name).vibed"
        ),
        sticker: .standard
      ),
      InputStickerVibed(
        type: .empty,
        expected: nil,
        sticker: .standard
      ),
    ]
  ) func testStickerVibed(input: InputStickerVibed) async throws {
    #expect(
      input.expected == prepareSut(input.type).stickerVibed(sticker: input.sticker)

    )
  }

  struct InputStickerVibe {
    let type: SocietyRepositoryTypeEnum
    let expected: AttributedString?
  }

  @Test(
    "stickerVibe",
    arguments: [
      InputStickerVibe(
        type: .normal,
        expected: try? AttributedString(
          markdown: await societyRepositoryPrepareExpectedString("society.sticker.vibe")
        )),
      InputStickerVibe(type: .empty, expected: nil),
    ]
  ) func testStickerVibe(input: InputStickerVibe) async throws {
    #expect(input.expected == prepareSut(input.type).stickerVibe())
  }

  struct InputStickerNote {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
    let sticker: StickerEnum
  }

  @Test(
    "stickerNote",
    arguments: [
      InputStickerNote(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.sticker.\(StickerEnum.standard.name).note"
        ),
        sticker: .standard
      ),
      InputStickerNote(
        type: .empty,
        expected: nil,
        sticker: .standard
      ),
    ]
  ) func testStickerNote(input: InputStickerNote) async throws {
    #expect(
      input.expected == prepareSut(input.type).stickerNote(sticker: input.sticker)

    )
  }

  struct InputStickerTitle {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
    let sticker: StickerEnum
  }

  @Test(
    "stickerTitle",
    arguments: [
      InputStickerTitle(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.sticker.\(StickerEnum.standard.name).title"
        ),
        sticker: .standard
      ),
      InputStickerTitle(
        type: .empty,
        expected: nil,
        sticker: .standard
      ),
    ]
  ) func testStickerTitle(input: InputStickerTitle) async throws {
    #expect(
      input.expected == prepareSut(input.type).stickerTitle(sticker: input.sticker)

    )
  }

  struct InputAppointementTitle {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "appointementTitle",
    arguments: [
      InputAppointementTitle(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString("society.appointment.title")
      ),
      InputAppointementTitle(type: .empty, expected: nil),
    ]
  ) func testAppointementTitle(input: InputAppointementTitle) async throws {
    #expect(input.expected == prepareSut(input.type).appointementTitle())
  }

  struct InputAppointementDescription1 {
    let type: SocietyRepositoryTypeEnum
    let expected: AttributedString?
    let name: String
  }

  struct InputAppointementEngagement {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "appointementEngagement",
    arguments: [
      InputAppointementEngagement(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.appointment.engagement"
        )
      ),
      InputAppointementEngagement(type: .empty, expected: nil),
    ]
  ) func testAppointementEngagement(input: InputAppointementEngagement)
    async throws
  {
    #expect(
      input.expected == prepareSut(input.type).appointementEngagement()
    )
  }

  struct InputNextAppointementTitle {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "nextAppointementTitle",
    arguments: [
      InputNextAppointementTitle(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.next.appointment.title"
        )
      ),
      InputNextAppointementTitle(type: .empty, expected: nil),
    ]
  ) func testNextAppointementTitle(input: InputNextAppointementTitle)
    async throws
  {
    #expect(
      input.expected == prepareSut(input.type).nextAppointementTitle()
    )
  }

  struct InputNextAppointementDescription1 {
    let type: SocietyRepositoryTypeEnum
    let expected: AttributedString?
    let name: String
  }

  @Test(
    "nextAppointementDescription1",
    arguments: [
      InputNextAppointementDescription1(
        type: .normal,
        expected: try? AttributedString(
          markdown: String(
            format: await societyRepositoryPrepareExpectedString(
              "society.next.appointment.description1"
            ),
            "Test",
          )),
        name: "Test"
      ),
      InputNextAppointementDescription1(
        type: .empty,
        expected: nil,
        name: "Test"
      ),
    ]
  ) func testNextAppointementDescription1(
    input: InputNextAppointementDescription1
  ) async throws {
    #expect(
      input.expected
        == prepareSut(input.type).nextAppointementDescription1(
          name: input.name
        )
    )
  }

  struct InputNextAppointementDescription2 {
    let type: SocietyRepositoryTypeEnum
    let expected: AttributedString?
  }

  @Test(
    "nextAppointementDescription2",
    arguments: [
      InputNextAppointementDescription2(
        type: .normal,
        expected: try? AttributedString(
          markdown: await societyRepositoryPrepareExpectedString(
            "society.next.appointment.description2"
          )
        )),
      InputNextAppointementDescription2(type: .empty, expected: nil),
    ]
  ) func testNextAppointementDescription2(
    input: InputNextAppointementDescription2
  ) async throws {
    #expect(
      input.expected == prepareSut(input.type).nextAppointementDescription2()

    )
  }

  struct InputNextAppointementDescription3 {
    let type: SocietyRepositoryTypeEnum
    let expected: AttributedString?
  }

  @Test(
    "nextAppointementDescription3",
    arguments: [
      InputNextAppointementDescription3(
        type: .normal,
        expected: try? AttributedString(
          markdown: await societyRepositoryPrepareExpectedString(
            "society.next.appointment.description3"
          )
        )),
      InputNextAppointementDescription3(type: .empty, expected: nil),
    ]
  ) func testNextAppointementDescription3(
    input: InputNextAppointementDescription3
  ) async throws {
    #expect(
      input.expected == prepareSut(input.type).nextAppointementDescription3()

    )
  }

  struct InputNextAppointementStatus {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "nextAppointementStatus",
    arguments: [
      InputNextAppointementStatus(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString(
          "society.next.appointment.status"
        )
      ),
      InputNextAppointementStatus(type: .empty, expected: nil),
    ]
  ) func testNextAppointementStatus(input: InputNextAppointementStatus)
    async throws
  {
    #expect(
      input.expected == prepareSut(input.type).nextAppointementStatus()
    )
  }

  struct InputErrorTitle {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "errorTitle",
    arguments: [
      InputErrorTitle(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString("society.error.title")
      ),
      InputErrorTitle(type: .empty, expected: nil),
    ]
  ) func testErrorTitle(input: InputErrorTitle) async throws {
    #expect(input.expected == prepareSut(input.type).errorTitle())
  }

  struct InputErrorNote1 {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "errorNote1",
    arguments: [
      InputErrorNote1(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString("society.error.note1")
      ),
      InputErrorNote1(type: .empty, expected: nil),
    ]
  ) func testErrorNote1(input: InputErrorNote1) async throws {
    #expect(input.expected == prepareSut(input.type).errorNote1())
  }

  struct InputErrorNote2 {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "errorNote2",
    arguments: [
      InputErrorNote2(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString("society.error.note2")
      ),
      InputErrorNote2(type: .empty, expected: nil),
    ]
  ) func testErrorNote2(input: InputErrorNote2) async throws {
    #expect(input.expected == prepareSut(input.type).errorNote2())
  }

  struct InputErrorIntro {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "errorIntro",
    arguments: [
      InputErrorIntro(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString("society.error.intro")
      ),
      InputErrorIntro(type: .empty, expected: nil),
    ]
  ) func testErrorIntro(input: InputErrorIntro) async throws {
    #expect(input.expected == prepareSut(input.type).errorIntro())
  }

  struct InputErrorOutro {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "errorOutro",
    arguments: [
      InputErrorOutro(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString("society.error.outro")
      ),
      InputErrorOutro(type: .empty, expected: nil),
    ]
  ) func testErrorOutro(input: InputErrorOutro) async throws {
    #expect(input.expected == prepareSut(input.type).errorOutro())
  }

  struct InputErrorDescription {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "errorDescription",
    arguments: [
      InputErrorDescription(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString("society.error.description")
      ),
      InputErrorDescription(type: .empty, expected: nil),
    ]
  ) func testErrorDescription(input: InputErrorDescription) async throws {
    #expect(input.expected == prepareSut(input.type).errorDescription())
  }

  struct InputErrorHello {
    let type: SocietyRepositoryTypeEnum
    let expected: String?
  }

  @Test(
    "errorHello",
    arguments: [
      InputErrorHello(
        type: .normal,
        expected: await societyRepositoryPrepareExpectedString("society.error.hello")
      ),
      InputErrorHello(type: .empty, expected: nil),
    ]
  ) func testErrorHello(input: InputErrorHello) async throws {
    #expect(input.expected == prepareSut(input.type).errorHello())
  }

  func prepareSut(_ type: SocietyRepositoryTypeEnum) -> SocietyRepository {
    if type == .normal {
      return SocietyRepository()
    } else {
      return SocietyRepository(
        translationRepository: MockTranslationRepository()
      )
    }
  }
}
