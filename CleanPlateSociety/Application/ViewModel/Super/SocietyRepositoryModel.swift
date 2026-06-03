//
//  SocietyRepositoryViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 14.04.2026.
//

import Foundation

class SocietyRepositoryModel {
  let societyRepository: SocietyRepository

  init(
    societyRepository: SocietyRepository = SocietyRepository()
  ) {
    self.societyRepository = societyRepository
  }
}
