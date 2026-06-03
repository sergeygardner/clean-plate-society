//
//  StickerContentViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 12.05.2026.
//

import Foundation
import UIKit

extension StickerContentView {
  @Observable
  class ViewModel {
    var image: UIImage? = nil

    let stickerManager: StickerManager

    init(
      stickerManager: StickerManager = StickerManager()
    ) {
      self.stickerManager = stickerManager
    }
  }
}
