//
//  AudienceViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 25.03.2026.
//

import Foundation
import SwiftData
import UIKit

extension AudienceView {
  func add() {
    do {
      let entry: EntryModel = EntryModel(
        profileUUID: profileModelDTO.uuid,
        sticker: profileModelDTO.settings.sticker,
        timestamp: Date.timeZonedNow,
      )
      let entryModelsCount: Int = entryModels.count

      dataContainer.context.insert(entry)

      let awardModel: AwardModel? = dataContainer.awardManager.add(
        count: entryModelsCount + 1,
        profileUUID: profileModelDTO.uuid,
        sticker: profileModelDTO.settings.sticker
      )

      try dataContainer.context.save()

      if let awardModel = awardModel {
        viewModel.notificationRepository.send(
          awardModelDTO: viewModel.awardModelDTOFactory
            .fromModel(awardModel),
        )
      } else {
        viewModel.notificationRepository.send(
          entryModelDTO: viewModel.entryModelDTOFactory.fromModel(
            entry
          )
        )
      }

      if viewModel.canShowNextChallenge(
        count: entryModels.count,
        progress: profileModelDTO.settings.difficultyLevel.progress,
      ) {
        viewModel.notificationRepository.send(nextChallenge: true)
      }
    } catch {
      viewModel.notificationRepository.send(errorDTO: ErrorDTO(error: .core(error)))
    }
  }

  @Observable
  class ViewModel {
    enum StatusEnum {
      case addButtonView
      case chooseStickerView
    }

    var currentIndex: Int = 0
    var remaining: TimeInterval = 0
    var delay: Date = Date.timeZonedNow
    var disabled: Bool = false
    var status: StatusEnum = .addButtonView

    let awardModelDTOFactory: AwardModelDTOFactory
    let entryModelDTOFactory: EntryModelDTOFactory
    let notificationRepository: NotificationRepository
    let societyRepository: SocietyRepository

    init(
      awardModelDTOFactory: AwardModelDTOFactory =
        AwardModelDTOFactory(),
      entryModelDTOFactory: EntryModelDTOFactory = EntryModelDTOFactory(),
      notificationRepository: NotificationRepository =
        NotificationRepository(),
      societyRepository: SocietyRepository = SocietyRepository()
    ) {
      self.awardModelDTOFactory = awardModelDTOFactory
      self.entryModelDTOFactory = entryModelDTOFactory
      self.notificationRepository = notificationRepository
      self.societyRepository = societyRepository
    }

    func canDo(
      entryModelsCount: Int,
      stickerAmount: Int
    ) {
      if stickerAmount
        > entryModelsCount
      {
        status = .addButtonView
      } else {
        status = .chooseStickerView
      }
    }

    func showChooseStickerView(index: Int, stickerAmount: Int) -> Bool {
      return stickerAmount == index && status == .chooseStickerView
    }

    func showAddButtonView(index: Int) -> Bool {
      return currentIndex == index && status == .addButtonView
    }

    func setDelay(
      difficultyLevel: DifficultyLevelEnum,
      lastModelDate: Date?
    ) {
      if let date = lastModelDate {
        delay = date.getBreakpoint(
          difficultyLevel
        )
      } else {
        delay = Date.timeZonedNow.startOfDay.advanced(by: -1)
      }
    }

    func setDisabled() {
      disabled = delay > Date.timeZonedNow
    }

    func setRemaining() {
      remaining = disabled ? delay.timeIntervalSinceNow : remaining
    }

    func setCurrentIndex(
      entryModelsCount: Int,
      stickerAmount: Int,
    ) {
      currentIndex = entryModelsCount >= stickerAmount ? stickerAmount : entryModelsCount
    }

    func canShowNextChallenge(count: Int, progress: Int) -> Bool {
      return count > 0 && count % progress == 0
    }

    func applyOpacity(_ index: Int) -> Double {
      return currentIndex >= index ? 1 : 0.4
    }

    func canApplyAnimation(_ index: Int) -> Bool {
      return currentIndex > index
    }

    func applyBlur(_ index: Int) -> CGFloat {
      return currentIndex >= index ? 0 : 20
    }

    func canUseStickers(_ stickerModelsCount: Int, _ sticker: StickerEnum) -> Bool {
      return (sticker.isManual() && stickerModelsCount > 0)
        || (!sticker.isManual() && stickerModelsCount == sticker.amount)
    }

    func showOverlay(_ index: Int) -> Bool {
      return currentIndex == index
    }

    func getChancellorAppointmentId(
      day: Int, difficultyLevel: DifficultyLevelEnum, entriesPerDay: Int
    ) -> Int {
      return day + difficultyLevel.getChancellorAppointmentShift(entriesPerDay)
    }
  }
}
