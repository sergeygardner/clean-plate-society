//
//  NotificationRepositoryTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 22.04.2026.
//

import Foundation
import Testing

@testable import CleanPlateSociety

enum NotificationRepositoryTypeEnum {
  case normal
  case empty
}

@MainActor
func notificationRepositoryPrepareArgumentsInputAwardModel() async
  -> [NotificationRepositoryTest.InputAwardModel]
{
  return [
    NotificationRepositoryTest.InputAwardModel(
      expected: true,
      name: .awardUnlocked,
      object: AwardModelDTOFactory().fromModel(AwardModel.sampleData.first!)
    )
  ]
}

@MainActor
func notificationRepositoryPrepareArgumentsInputEntryModel() async -> [NotificationRepositoryTest
  .InputEntryModel]
{
  return [
    NotificationRepositoryTest.InputEntryModel(
      expected: true,
      name: .entryReceived,
      object: EntryModelDTOFactory().fromModel(EntryModel.sampleData.first!)
    )
  ]
}

@MainActor
func notificationRepositoryPrepareArgumentsInputNextChallenge() async -> [NotificationRepositoryTest
  .InputNextChallenge]
{
  return [
    NotificationRepositoryTest.InputNextChallenge(
      expected: true,
      name: .nextChallengeUnlocked,
      object: true
    )
  ]
}

@MainActor
func notificationRepositoryPrepareArgumentsInputSendProfile() async -> [NotificationRepositoryTest
  .InputSendProfile]
{
  return [
    NotificationRepositoryTest.InputSendProfile(
      expected: true,
      name: .settingsUpdated,
      object: Profile.sampleFormalLow.profileModelDTO!
    )
  ]
}

@Suite(.tags(.repository))
@MainActor
struct NotificationRepositoryTest {
  let mockNotificationCenter = MockNotificationCenter()

  struct InputAwardModel {
    let expected: Bool
    let name: Notification.Name
    let object: AwardModelDTO
  }

  @Test(
    "sendAwardModel",
    arguments: await notificationRepositoryPrepareArgumentsInputAwardModel()
  ) func testSendAwardModel(input: InputAwardModel)
    async throws
  {
    Task {
      mockNotificationCenter.reset()

      prepareSut().send(awardModelDTO: input.object)

      #expect(
        input.expected == mockNotificationCenter.hasSent(input.name, input.object)
      )
    }
  }

  struct InputEntryModel {
    let expected: Bool
    let name: Notification.Name
    let object: EntryModelDTO
  }

  @Test(
    "sendEntryModel",
    arguments: await notificationRepositoryPrepareArgumentsInputEntryModel()
  ) func testSendEntryModel(input: InputEntryModel) async throws {
    mockNotificationCenter.reset()

    Task {
      prepareSut().send(entryModelDTO: input.object)

      #expect(
        input.expected == mockNotificationCenter.hasSent(input.name, input.object)
      )
    }
  }

  struct InputNextChallenge {
    let expected: Bool
    let name: Notification.Name
    let object: Bool
  }

  @Test(
    "sendNextChallenge",
    arguments: await notificationRepositoryPrepareArgumentsInputNextChallenge()
  ) func testSendNextChallenge(input: InputNextChallenge)
    async throws
  {
    mockNotificationCenter.reset()

    Task {
      prepareSut().send(nextChallenge: input.object)

      #expect(
        input.expected == mockNotificationCenter.hasSent(input.name, input.object)
      )
    }
  }

  struct InputSendProfile {
    let expected: Bool
    let name: Notification.Name
    let object: ProfileModelDTO
  }

  @Test(
    "sendProfile",
    arguments: await notificationRepositoryPrepareArgumentsInputSendProfile()
  ) func testSendProfile(input: InputSendProfile) async throws {
    mockNotificationCenter.reset()

    Task {
      prepareSut().send(profileModelDTO: input.object)

      #expect(
        input.expected == mockNotificationCenter.hasSent(input.name, input.object)
      )
    }
  }

  struct InputAwardUnlocked {
    let expected: Bool
    let name: Notification.Name
  }

  @Test(
    "onReceiveAwardUnlocked",
    arguments: [
      InputAwardUnlocked(
        expected: true,
        name: .awardUnlocked,
      )
    ]
  ) func testOnReceiveAwardUnlocked(input: InputAwardUnlocked)
    async throws
  {
    mockNotificationCenter.reset()

    let _ = prepareSut().onReceive(.awardUnlocked)

    #expect(
      input.expected == mockNotificationCenter.hasPublished(input.name)
    )
  }

  struct InputEntryReceived {
    let expected: Bool
    let name: Notification.Name
  }

  @Test(
    "onReceiveEntryReceived",
    arguments: [
      InputEntryReceived(
        expected: true,
        name: .entryReceived,
      )
    ]
  ) func testOnReceiveEntryReceived(input: InputEntryReceived) async throws {
    mockNotificationCenter.reset()

    let _ = prepareSut().onReceive(.entryReceived)

    #expect(
      input.expected == mockNotificationCenter.hasPublished(input.name)
    )
  }

  struct InputNextChallengeUnlocked {
    let expected: Bool
    let name: Notification.Name
  }

  @Test(
    "onReceiveNextChallengeUnlocked",
    arguments: [
      InputNextChallengeUnlocked(
        expected: true,
        name: .nextChallengeUnlocked,
      )
    ]
  ) func testOnReceiveNextChallengeUnlocked(input: InputNextChallengeUnlocked)
    async throws
  {
    mockNotificationCenter.reset()

    let _ = prepareSut().onReceive(.nextChallengeUnlocked)

    #expect(
      input.expected == mockNotificationCenter.hasPublished(input.name)
    )
  }

  struct InputSettingsUpdated {
    let expected: Bool
    let name: Notification.Name
  }

  @Test(
    "onReceiveSettingsUpdated",
    arguments: [
      InputSettingsUpdated(
        expected: true,
        name: .settingsUpdated,
      )
    ]
  ) func testOnReceiveSettingsUpdated(input: InputSettingsUpdated)
    async throws
  {
    mockNotificationCenter.reset()

    let _ = prepareSut().onReceive(.settingsUpdated)

    #expect(
      input.expected == mockNotificationCenter.hasPublished(input.name)
    )
  }

  func prepareSut() -> NotificationRepository {
    return NotificationRepository(
      notificationCenter: mockNotificationCenter
    )
  }
}
