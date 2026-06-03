//
//  ContentViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 14.04.2026.
//

import Foundation
import SwiftUI

extension ContentView {
  @Observable
  class ViewModel {
    var sticker: StickerEnum?
    var profileModelDTO: ProfileModelDTO?
    var stage: StageEnum

    let notificationRepository: NotificationRepository

    init(
      notificationRepository: NotificationRepository =
        NotificationRepository(),
      sticker: StickerEnum? = nil,
      profileModelDTO: ProfileModelDTO? = nil,
      stage: StageEnum = .stage1
    ) {
      self.notificationRepository = notificationRepository
      self.sticker = sticker
      self.profileModelDTO = profileModelDTO
      self.stage = stage
    }

    func canShowTabs() -> Bool {
      return profileModelDTO != nil && sticker != nil
    }
  }

  //    @MainActor
  //    func exportLaunchImage(from view: some View) {
  //        for theme in Theme.allCases {
  //            let viewToRender = view.background(theme.gradient)
  //            let renderer = ImageRenderer(content: viewToRender)
  //
  //            renderer.scale = 1.0
  //
  //            if let uiImage = renderer.uiImage,
  //               let data = uiImage.pngData() {
  //                let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
  //                    .appendingPathComponent("icon_\(theme.name).png")
  //
  //                try? data.write(to: url)
  //
  //                print("Success! Saved to: \(url)")
  //            }
  //        }
  //    }
}
