//
//  StageDifficultyLevelViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 14.04.2026.
//

import Foundation

extension StageDifficultyLevelView {
  @Observable
  class ViewModel: SocietyRepositoryModel {
    var difficultyLevel: DifficultyLevelEnum = .low
  }
}
