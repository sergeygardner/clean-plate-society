//
//  ModifyProfileViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 08.04.2026.
//

import SwiftData
import UIKit

extension ModifyProfileView {
  func save() {
    if viewModel.disabled {
      if let profileModel = profile.profileModel {
        profileModel.name = viewModel.name
        profileModel.settings.haptic = viewModel.haptic
        profileModel.settings.sticker = viewModel.sticker
        profileModel.settings.theme = viewModel.theme

        profile.setProfileModel(profileModel)
      }
    } else {
      let profileModel: ProfileModel = ProfileModel(
        name: viewModel.name,
        settings: SettingsModel(
          difficultyLevel: viewModel.difficultyLevel,
          haptic: viewModel.haptic,
          sticker: viewModel.sticker,
          theme: viewModel.theme,
        )
      )

      dataContainer.context.insert(profileModel)

      do {
        try dataContainer.context.save()

        profile.profileModel = profileModel

        profile.setProfileModel(profileModel)

        if let profileModelDTO = profile.profileModelDTO {
          viewModel.notificationRepository.send(
            profileModelDTO: profileModelDTO
          )
        }
      } catch {
        viewModel.notificationRepository.send(errorDTO: ErrorDTO(error: .core(error)))
      }
    }

    if viewModel.isThemeChanged {
      viewModel.iconManager.upgradeTo(theme: viewModel.theme)
    }
  }

  @Observable
  class ViewModel {
    var disabled: Bool
    var difficultyLevel: DifficultyLevelEnum
    var haptic: Bool
    var isThemeChanged: Bool = false
    var name: String
    var sticker: StickerEnum
    var theme: Theme

    let iconManager: IconManager
    let imageCacheManager: ImageCacheManager
    let mainRepository: MainRepository
    let notificationRepository: NotificationRepository
    let profileModelDTOFactory: ProfileModelDTOFactory

    init(
      disabled: Bool = true,
      difficultyLevel: DifficultyLevelEnum = .low,
      haptic: Bool = true,
      iconManager: IconManager = IconManager(),
      imageCacheManager: ImageCacheManager = ImageCacheManager.shared,
      mainRepository: MainRepository = MainRepository(),
      name: String = "",
      notificationRepository: NotificationRepository =
        NotificationRepository(),
      profileModelDTOFactory: ProfileModelDTOFactory =
        ProfileModelDTOFactory(),
      sticker: StickerEnum = .standard,
      theme: Theme = .formal,
    ) {
      self.disabled = disabled
      self.difficultyLevel = difficultyLevel
      self.haptic = haptic
      self.iconManager = iconManager
      self.imageCacheManager = imageCacheManager
      self.mainRepository = mainRepository
      self.name = name
      self.notificationRepository = notificationRepository
      self.profileModelDTOFactory = profileModelDTOFactory
      self.sticker = sticker
      self.theme = theme
    }

    func reset(profileModelDTO: ProfileModelDTO?) {
      if let profileModelDTO = profileModelDTO, disabled {
        difficultyLevel = profileModelDTO.settings.difficultyLevel
        haptic = profileModelDTO.settings.haptic
        name = profileModelDTO.name
        sticker = profileModelDTO.settings.sticker
        theme = profileModelDTO.settings.theme
      } else {
        difficultyLevel = .low
        haptic = true
        name = ""
        sticker = .standard
        theme = .formal
      }
    }

    func themeChanged() {
      isThemeChanged = true
    }
  }
}
