//
//  DataContainer.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 02.03.2026.
//

import SwiftData
import SwiftUI

@Observable
@MainActor
class DataContainer {
  public static let shared: Result<DataContainer, Error> = {
    Result {
      try DataContainer(
        isStoredInMemoryOnly: ProcessInfo
          .processInfo
          .environment["XCTestConfigurationFilePath"] != nil
      )
    }
  }()
  public static let previewShared: Result<DataContainer, Error> = {
    Result {
      try DataContainer(isStoredInMemoryOnly: true)
    }
  }()

  enum DataError: Error, Equatable {
    case saveFailed(reason: String, underlyingError: Error?)

    static func == (lhs: DataError, rhs: DataError) -> Bool {
      switch (lhs, rhs) {
      case (
        .saveFailed(reason: let lCode, underlyingError: _),
        .saveFailed(reason: let rCode, underlyingError: _)
      ):
        return lCode == rCode
      }
    }
  }

  let modelContainer: ModelContainer
  var awardManager: AwardManager

  var context: ModelContext {
    modelContainer.mainContext
  }

  private init(
    isStoredInMemoryOnly: Bool = false
  )
    throws(DataError)
  {
    let schema: Schema = Schema(
      [
        AwardModel.self,
        EntryModel.self,
        ProfileModel.self,
        StickerModel.self,
      ]
    )
    let modelConfiguartion: ModelConfiguration = ModelConfiguration(
      schema: schema,
      isStoredInMemoryOnly: isStoredInMemoryOnly,
    )

    do {
      modelContainer = try ModelContainer(
        for: schema,
        configurations: [modelConfiguartion],
      )

      awardManager = AwardManager(
        modelContainer: modelContainer
      )

      try context.save()
    } catch {
      throw DataError.saveFailed(
        reason: "Could not create ModelContainer",
        underlyingError: error
      )
    }
  }
}
