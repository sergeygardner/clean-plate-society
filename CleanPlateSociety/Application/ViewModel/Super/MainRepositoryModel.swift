//
//  SocietyRepositoryViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 14.04.2026.
//

import Foundation

class MainRepositoryModel {
  let mainRepository: MainRepository

  init(
    mainRepository: MainRepository = MainRepository()
  ) {
    self.mainRepository = mainRepository
  }
}
