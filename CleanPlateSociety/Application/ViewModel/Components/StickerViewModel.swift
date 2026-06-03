//
//  StickersViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 24.03.2026.
//

import Foundation
import SwiftData
import UIKit

extension StickerView {
  @Observable
  class ViewModel {
    var image: UIImage? = nil
    var imageURLs: [String] = []

    let imageRepository: ImageRepository
    let notificationRepository: NotificationRepository
    let societyRepository: SocietyRepository
    let stickerManager: StickerManager

    init(
      imageRepository: ImageRepository = ImageRepository(),
      notificationRepository: NotificationRepository = NotificationRepository(),
      societyRepository: SocietyRepository = SocietyRepository(),
      stickerManager: StickerManager = StickerManager.shared
    ) {
      self.imageRepository = imageRepository
      self.notificationRepository = notificationRepository
      self.societyRepository = societyRepository
      self.stickerManager = stickerManager
    }
  }
}
