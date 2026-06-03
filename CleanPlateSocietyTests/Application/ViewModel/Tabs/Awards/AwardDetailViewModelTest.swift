//
//  AwardDetailViewModelTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 20.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

@MainActor
func awardDetailViewModelPrepareArgumentsInput() async -> [AwardDetailViewModelTest
  .Input]
{
  return [
    AwardDetailViewModelTest.Input(
      id: .level1,
      description: "description",
      expectedDescription: "description",
      section: "section",
      expectedSection: "section",
      tags: AwardEnum.level1.tags,
      expectedTags: AwardEnum.level1.tags,
      title: "title",
      expectedTitle: "title",
    ),
    AwardDetailViewModelTest.Input(
      id: .level1,
      description: "",
      expectedDescription: nil,
      section: "",
      expectedSection: nil,
      tags: [],
      expectedTags: nil,
      title: "",
      expectedTitle: nil,
    ),
  ]
}

@Suite(.tags(.viewModel))
@MainActor
struct AwardDetailViewModelTest {
  struct Input {
    let id: AwardEnum
    let description: String
    let expectedDescription: String?
    let section: String
    let expectedSection: String?
    let tags: [String]
    let expectedTags: [String]?
    let title: String
    let expectedTitle: String?
  }

  @Test(
    "find",
    arguments: await awardDetailViewModelPrepareArgumentsInput()
  )
  func find(input: Input) async throws {
    let sut = AwardDetailView.ViewModel(
      awardDescriptionRepository: AwardDescriptionRepository(
        table: .awardDescription,
        translationRepository: MockTranslationRepository(
          value: input.description
        )
      ),
      awardSectionRepository: AwardSectionRepository(
        table: .awardSection,
        translationRepository: MockTranslationRepository(
          value: input.section
        )
      ),
      awardTagRepository: AwardTagRepository(
        table: .awardTag,
        translationRepository: MockTranslationRepository(
          value: input.tags
        )
      ),
      awardTitleRepository: AwardTitleRepository(
        table: .awardTitle,
        translationRepository: MockTranslationRepository(
          value: input.title
        )
      ),
    )

    #expect(input.expectedDescription == sut.getDescription(id: input.id))
    #expect(input.expectedSection == sut.getSection(id: input.id))
    #expect(input.expectedTags == sut.getTags(id: input.id))
    #expect(input.expectedTitle == sut.getTitle(id: input.id))
  }
}
