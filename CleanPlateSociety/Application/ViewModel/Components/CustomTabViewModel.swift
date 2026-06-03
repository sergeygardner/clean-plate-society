//
//  CustomTabViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 14.05.2026.
//

import Foundation

extension CustomTabView {
  @Observable
  class ViewModel: SocietyRepositoryModel {
    var selected: TabEnum = .audience
  }
}
