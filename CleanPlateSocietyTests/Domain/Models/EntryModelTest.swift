//
//  EntryModelTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 24.04.2026.
//

import Foundation
import SwiftData
import Testing

@testable import CleanPlateSociety

@Suite(.tags(.model))
@MainActor
struct EntryModelTest {
  let context: ModelContext

  init() throws {
    switch DataContainer.shared {
    case .success(let dataContainer):
      context = dataContainer.context
    case .failure(let error):
      throw error
    }
  }

  @Test func testInit() async throws {
    let model = EntryModel.sampleData.first!
    let expectedProfileUUID = UUID()
    let expectedSticker = StickerEnum.badgers

    context.insert(model)

    #expect(model.profileUUID != expectedProfileUUID)
    #expect(model.profileUUIDRawValue != expectedProfileUUID.uuidString)
    #expect(model.sticker != expectedSticker)
    #expect(model.stickerRawValue != expectedSticker.rawValue)

    model.profileUUID = expectedProfileUUID
    model.sticker = expectedSticker

    #expect(model.profileUUID == expectedProfileUUID)
    #expect(model.profileUUIDRawValue == expectedProfileUUID.uuidString)
    #expect(model.sticker == expectedSticker)
    #expect(model.stickerRawValue == expectedSticker.rawValue)
  }
}

//@Suite @MainActor // Models must be tested on MainActor
//struct ModelTests {
//    let context: ModelContext
//
//    init() throws {
//        let config = ModelConfiguration(isStoredInMemoryOnly: true)
//        let container = try ModelContainer(for: MyModel.self, configurations: config)
//        self.context = ModelContext(container)
//    }
//
//    @Test func testEnumAndUUIDConversion() throws {
//        // 1. Create the model
//        let id = UUID()
//        let model = MyModel(id: id, status: .active)
//        context.insert(model)
//
//        // 2. Test the 'get' logic (restoring from String)
//        #expect(model.status == .active)
//        #expect(model.id == id)
//
//        // 3. Test the 'set' logic (storing as String)
//        model.status = .archived
//
//        // Verify the underlying storage (if you use a private shadow property)
//        // #expect(model.statusString == "archived")
//    }
//}
