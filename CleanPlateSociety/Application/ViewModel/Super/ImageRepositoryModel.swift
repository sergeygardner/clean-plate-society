//
//  ImageRepositoryViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 14.04.2026.
//

import Foundation

class ImageRepositoryModel {
  let imageRepository: ImageRepository

  init(
    imageRepository: ImageRepository = ImageRepository()
  ) {
    self.imageRepository = imageRepository
  }
}
