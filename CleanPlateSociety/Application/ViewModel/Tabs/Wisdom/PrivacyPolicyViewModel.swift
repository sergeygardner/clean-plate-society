//
//  PrivacyPolicyViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 22.05.2026.
//

import Foundation

extension PrivacyPolicyView {
  @Observable
  class ViewModel {
    let linkRepository: LinkRepository
    let societyRepository: SocietyRepository

    init(
      linkRepository: LinkRepository = LinkRepository(),
      societyRepository: SocietyRepository = SocietyRepository(),
    ) {
      self.linkRepository = linkRepository
      self.societyRepository = societyRepository
    }
  }
}
