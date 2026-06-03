//
//  ProfileModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 05.03.2026.
//

import Foundation
import SwiftData

@Model
final class ProfileModel {
  var uuid: UUID
  var name: String
  var settings: SettingsModel
  var createdAt: Date
  var updatedAt: Date

  init(
    uuid: UUID = UUID(),
    name: String,
    settings: SettingsModel,
    createdAt: Date = Date.timeZonedNow,
    updatedAt: Date = Date.timeZonedNow,
  ) {
    self.uuid = uuid
    self.name = name
    self.settings = settings
    self.createdAt = createdAt
    self.updatedAt = updatedAt
  }
}

extension ProfileModel {
  static var sampleFormalLow: ProfileModel = ProfileModel(
    uuid: UUID.sampleProfileUUID,
    name: "sampleFormalLow",
    settings: .sampleFormalLow,
  )
  static var sampleFormalLowBadgers: ProfileModel = ProfileModel(
    uuid: UUID.sampleProfileUUID,
    name: "sampleFormalLow",
    settings: .sampleFormalLowBadgers,
  )
  static var sampleFormalMedium: ProfileModel = ProfileModel(
    uuid: UUID.sampleProfileUUID,
    name: "sampleFormalMedium",
    settings: .sampleFormalMedium
  )
  static var sampleFormalHigh: ProfileModel = ProfileModel(
    uuid: UUID.sampleProfileUUID,
    name: "sampleFormalHigh",
    settings: .sampleFormalHigh
  )
  static var sampleRoyalLow: ProfileModel = ProfileModel(
    uuid: UUID.sampleProfileUUID,
    name: "sampleRoyalLow",
    settings: .sampleRoyalLow
  )
  static var sampleRoyalMedium: ProfileModel = ProfileModel(
    uuid: UUID.sampleProfileUUID,
    name: "sampleRoyalMedium",
    settings: .sampleRoyalMedium
  )
  static var sampleRoyalHigh: ProfileModel = ProfileModel(
    uuid: UUID.sampleProfileUUID,
    name: "sampleRoyalHigh",
    settings: .sampleRoyalHigh
  )
  static var sampleForestLow: ProfileModel = ProfileModel(
    uuid: UUID.sampleProfileUUID,
    name: "sampleForestLow",
    settings: .sampleForestLow
  )
  static var sampleForestMedium: ProfileModel = ProfileModel(
    uuid: UUID.sampleProfileUUID,
    name: "sampleForestMedium",
    settings: .sampleForestMedium
  )
  static var sampleForestHigh: ProfileModel = ProfileModel(
    uuid: UUID.sampleProfileUUID,
    name: "sampleForestHigh",
    settings: .sampleForestHigh
  )
  static var sampleHarvestLow: ProfileModel = ProfileModel(
    uuid: UUID.sampleProfileUUID,
    name: "sampleHarvestLow",
    settings: .sampleHarvestLow
  )
  static var sampleHarvestMedium: ProfileModel = ProfileModel(
    uuid: UUID.sampleProfileUUID,
    name: "sampleHarvestMedium",
    settings: .sampleHarvestMedium
  )
  static var sampleHarvestHigh: ProfileModel = ProfileModel(
    uuid: UUID.sampleProfileUUID,
    name: "sampleHarvestHigh",
    settings: .sampleHarvestHigh
  )
  static var sampleMidnightLow: ProfileModel = ProfileModel(
    uuid: UUID.sampleProfileUUID,
    name: "sampleMidnightLow",
    settings: .sampleMidnightLow
  )
  static var sampleMidnightMedium: ProfileModel = ProfileModel(
    uuid: UUID.sampleProfileUUID,
    name: "sampleMidnightMedium",
    settings: .sampleMidnightMedium
  )
  static var sampleMidnightHigh: ProfileModel = ProfileModel(
    uuid: UUID.sampleProfileUUID,
    name: "sampleMidnightHigh",
    settings: .sampleMidnightHigh
  )
}
