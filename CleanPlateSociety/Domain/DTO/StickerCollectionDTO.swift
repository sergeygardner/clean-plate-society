//
//  StickerCollectionDTO.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 19.05.2026.
//

import Foundation

struct StickerCollectionDTO: Decodable, Equatable {
  let index: String
  let stickers: [String]

  func withBaseUrl(_ baseUrl: String) -> StickerCollectionDTO {
    return StickerCollectionDTO(
      index: "\(baseUrl)\(self.index)",
      stickers: self.stickers.map { url in
        baseUrl + url
      },
    )
  }
}
