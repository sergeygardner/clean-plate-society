//
//  CacheManager.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 12.05.2026.
//

import Foundation
import UIKit

protocol ImageCacheManagerProtocol {
  func get(forKey key: String) -> UIImage?
  func set(_ image: UIImage, forKey key: String)
}

class ImageCacheManager: ImageCacheManagerProtocol {
  static let shared = ImageCacheManager()
  private let cache = NSCache<NSString, UIImage>()

  private init(limit: Int = 100) {
    cache.countLimit = limit
  }

  func get(forKey key: String) -> UIImage? {
    return cache.object(forKey: key as NSString)
  }

  func set(_ image: UIImage, forKey key: String) {
    cache.setObject(image, forKey: key as NSString)
  }

  func clear() {
    cache.removeAllObjects()
  }
}
