//
//  RulesViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 14.04.2026.
//

import Foundation

extension RulesView {
  @Observable
  class ViewModel {
    let awardTitleRepository: AwardTitleRepository
    let societyRepository: SocietyRepository

    init(
      awardTitleRepository: AwardTitleRepository =
        AwardTitleRepository(),
      societyRepository: SocietyRepository =
        SocietyRepository()
    ) {
      self.awardTitleRepository = awardTitleRepository
      self.societyRepository = societyRepository
    }
  }
}
