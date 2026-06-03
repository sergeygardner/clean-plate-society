//
//  StageStickerViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 14.04.2026.
//

import Foundation

extension StageStickerView {
  @Observable
  class ViewModel {
    var sticker: StickerEnum = .standard

    let imageRepository: ImageRepository
    let societyRepository: SocietyRepository

    init(
      imageRepository: ImageRepository = ImageRepository(),
      societyRepository: SocietyRepository = SocietyRepository()
    ) {
      self.imageRepository = imageRepository
      self.societyRepository = societyRepository
    }
  }
}
