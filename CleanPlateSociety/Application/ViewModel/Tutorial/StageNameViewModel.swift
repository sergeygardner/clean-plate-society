//
//  StageNameViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 14.04.2026.
//

import Foundation

extension StageNameView {
  @Observable
  class ViewModel {
    var name: String = ""

    let notificationRepository: NotificationRepository
    let profileModelDTOFactory: ProfileModelDTOFactory
    let societyRepository: SocietyRepository

    init(
      notificationRepository: NotificationRepository =
        NotificationRepository(),
      profileModelDTOFactory: ProfileModelDTOFactory = ProfileModelDTOFactory(),
      societyRepository: SocietyRepository = SocietyRepository()
    ) {
      self.notificationRepository = notificationRepository
      self.profileModelDTOFactory = profileModelDTOFactory
      self.societyRepository = societyRepository
    }
  }
}
