//
//  ImageRepository.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 20.03.2026.
//

import Foundation

class ImageRepository {
  private var apiRepository: ApiRepositoryProtocol
  private var resource: String = "images"

  init(
    apiRepository: ApiRepositoryProtocol = ApiRepository(),
  ) {
    self.apiRepository = apiRepository
  }

  func find(sticker: StickerEnum) async throws -> StickerCollectionDTO {
    let apiBaseUrl: String = apiRepository.getApiBaseUrl()
    let data: Data = try await apiRepository.get(
      url: apiBaseUrl + prepareUrl(path: [sticker.name, "index.json"]))

    return try JSONDecoder().decode(StickerCollectionDTO.self, from: data)
      .withBaseUrl(apiBaseUrl + prepareUrl(path: [sticker.rawValue, ""]))
  }

  func findURLForSticker(sticker: StickerEnum) async throws -> String {
    return try await find(sticker: sticker).index
  }

  func fetchData(_ url: String) async throws -> Data {
    return try await apiRepository.get(url: url)
  }

  private func prepareUrl(path: [String]) -> String {
    return "/resources/stickers/" + path.joined(separator: "/")
  }
}
