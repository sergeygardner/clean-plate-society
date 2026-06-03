//
//  UUID.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 23.03.2026.
//

import Foundation

struct PersistableUUID: RawRepresentable {
  var uuid: UUID

  typealias RawValue = String

  var rawValue: String {
    uuid.uuidString
  }

  init?(rawValue: String) {
    guard let uuid: UUID = UUID(uuidString: rawValue) else { return nil }
    self.uuid = uuid
  }

  init(uuid: UUID) {
    self.uuid = uuid
  }
}

extension UUID {
  static let sampleProfileUUID: UUID = UUID(
    uuidString: "13009927-2396-4a66-a343-25583e0bfb63"
  )!
  static let sampleEntryUUID: UUID = UUID(
    uuidString: "13009927-2396-4a66-a343-25583e0bfb64"
  )!
}

extension PersistableUUID {
  static let sampleProfileUUID: PersistableUUID = PersistableUUID(uuid: UUID.sampleProfileUUID)
}
