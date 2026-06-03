//
//  SocietyHeaderViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 14.04.2026.
//

import Foundation

extension ChancellorSealView {
  @Observable
  class ViewModel: SocietyRepositoryModel {
    func getName() -> [EnumeratedSequence<String>.Element] {
      if let name = societyRepository.name() {
        return Array(name.enumerated())
      }

      return []
    }
  }
}
