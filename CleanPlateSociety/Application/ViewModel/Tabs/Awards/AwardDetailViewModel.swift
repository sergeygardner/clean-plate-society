//
//  AwardDetailViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 03.04.2026.
//

import Foundation

extension AwardDetailView {
  @Observable
  class ViewModel {
    let awardDescriptionRepository: AwardDescriptionRepository
    let awardSectionRepository: AwardSectionRepository
    let awardTagRepository: AwardTagRepository
    let awardTitleRepository: AwardTitleRepository
    let societyRepository: SocietyRepository

    init(
      awardDescriptionRepository adr:
        AwardDescriptionRepository =
        AwardDescriptionRepository(),
      awardSectionRepository asr: AwardSectionRepository =
        AwardSectionRepository(),
      awardTagRepository atr: AwardTagRepository =
        AwardTagRepository(),
      awardTitleRepository atlr: AwardTitleRepository =
        AwardTitleRepository(),
      societyRepository sr: SocietyRepository = SocietyRepository(),
    ) {
      self.awardDescriptionRepository = adr
      self.awardSectionRepository = asr
      self.awardTagRepository = atr
      self.awardTitleRepository = atlr
      self.societyRepository = sr
    }

    func getDescription(id: AwardEnum) -> String? {
      return awardDescriptionRepository.find(id: id)
    }

    func getSection(id: AwardEnum) -> String? {
      return awardSectionRepository.find(id: id.section)
    }

    func getTags(id: AwardEnum) -> [String]? {
      var result: [String] = []

      for key in id.tags {
        if let value = awardTagRepository.find(id: key) {
          result.append(value)
        }
      }

      return result.isEmpty ? nil : result
    }

    func getTitle(id: AwardEnum) -> String? {
      return awardTitleRepository.find(id: id)
    }
  }
}
