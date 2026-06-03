//
//  StageThemeViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 14.04.2026.
//

import Foundation

extension StageThemeView {
  @Observable
  class ViewModel: SocietyRepositoryModel {
    var theme: Theme = .formal
  }
}
