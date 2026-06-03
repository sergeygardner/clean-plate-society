//
//  ProfileModelDTO.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 23.04.2026.
//

import Foundation

struct ProfileModelDTO: Equatable {
  let uuid: UUID
  let name: String
  let settings: SettingsModelDTO
  let createdAt: Date
  let updatedAt: Date

  init(
    uuid: UUID = UUID(),
    name: String,
    settings: SettingsModelDTO,
    createdAt: Date = Date.timeZonedNow,
    updatedAt: Date = Date.timeZonedNow,
  ) {
    self.uuid = uuid
    self.name = name
    self.settings = settings
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }

  static func == (lhs: ProfileModelDTO, rhs: ProfileModelDTO) -> Bool {
    return lhs.uuid == rhs.uuid
      && lhs.name == rhs.name
      && lhs.settings == rhs.settings
      && lhs.createdAt == rhs.createdAt
      && lhs.updatedAt == rhs.updatedAt
  }
}
