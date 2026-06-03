//
//  ButtonViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 16.04.2026.
//

import Foundation

extension ButtonView {
  @Observable
  class ViewModel {
    enum TypeEnum {
      case agree
      case clear
      case dismiss
      case error
      case profile
      case save
      case subscription
      case tutorialStage1
      case tutorialStage2
      case tutorialStage3
      case tutorialStage4
    }

    let societyRepository: SocietyRepository
    var type: TypeEnum

    init(
      type: TypeEnum,
      societyRepository: SocietyRepository = SocietyRepository()
    ) {
      self.type = type
      self.societyRepository = societyRepository
    }

    func getText() -> String? {
      switch type {
      case .agree:
        return societyRepository.buttonAgree()
      case .clear:
        return societyRepository.buttonClear()
      case .error:
        return societyRepository.buttonError()
      case .tutorialStage1:
        return societyRepository.tutorialStage1Button()
      case .tutorialStage2:
        return societyRepository.tutorialStage2Button()
      case .tutorialStage3:
        return societyRepository.tutorialStage3Button()
      case .tutorialStage4:
        return societyRepository.tutorialStage4Button()
      case .dismiss, .profile, .save, .subscription:
        fallthrough
      @unknown default:
        return nil
      }
    }

    func getTheme() -> BackgroundAdaptiveModifier.BackgroundThemeEnum {
      switch type {
      case .profile:
        return .buttonProfile
      case .dismiss, .save:
        return .none
      case .agree, .clear, .error, .subscription, .tutorialStage1, .tutorialStage2,
        .tutorialStage3, .tutorialStage4:
        fallthrough
      @unknown default:
        return .button
      }
    }
  }
}
