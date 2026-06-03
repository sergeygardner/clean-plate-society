//
//  NotificationListenerView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 08.04.2026.
//

import SwiftUI

struct NotificationListenerView: View {
  @EnvironmentObject var profile: Profile
  @State var viewModel: ViewModel

  init(state: ViewModel.StateEnum) {
    _viewModel = State(wrappedValue: ViewModel(state: state))
  }

  var body: some View {
    switch viewModel.state {
    case .top:
      ZStack {
        if let awardModel = viewModel.awardUnlocked {
          MessageBadgeView(type: .award) {
            if let title = viewModel.getTitle(
              id: awardModel.value
            ) {
              Text(title)
                .fontTheme(.subheadline)
                .foregroundStyleTheme(.text)
            }
          }
          .transition(.move(edge: .top).combined(with: .opacity))
          .padding(.top, 65)
          .onAppear {
            Task {
              try? await Task.sleep(for: .seconds(3))

              withAnimation(.spring) {
                viewModel.awardUnlocked = nil
              }
            }
          }
          .sensoryFeedback(
            .success,
            trigger: (profile.profileModelDTO?.settings.haptic
              ?? true)
              && viewModel.awardUnlocked != nil
          )
        }

        if let entryModel = viewModel.entryReceived {
          MessageBadgeView(type: .entry) {
            if let title = viewModel.mainRepository.getEntryTitleAt(
              date: entryModel.timestamp
            ) {
              Text(title)
                .fontTheme(.body)
                .foregroundStyleTheme(.text)
            }
          }
          .transition(.move(edge: .top).combined(with: .opacity))
          .padding(.top, 65)
          .onAppear {
            Task {
              try? await Task.sleep(for: .seconds(3))

              withAnimation(.spring) {
                viewModel.entryReceived = nil
              }
            }
          }
        }

        if let errorDTO = viewModel.errorAppeared {
          MessageBadgeView(type: .error) {
            Text(errorDTO.error.localizedDescription)
              .fontTheme(.body)
              .foregroundStyleTheme(.text)
          }
          .transition(.move(edge: .top).combined(with: .opacity))
          .padding(.top, 65)
          .onAppear {
            Task {
              try? await Task.sleep(for: .seconds(4))

              withAnimation(.spring) {
                viewModel.errorAppeared = nil
              }
            }
          }
        }

        if let serviceMessageDTO = viewModel.serviceMessage {
          MessageBadgeView(type: .serviceMessage) {
            Text(serviceMessageDTO.message)
              .fontTheme(.body)
              .foregroundStyleTheme(.text)
          }
          .transition(.move(edge: .top).combined(with: .opacity))
          .padding(.top, 65)
          .onAppear {
            Task {
              try? await Task.sleep(for: .seconds(4))

              withAnimation(.spring) {
                viewModel.serviceMessage = nil
              }
            }
          }
        }
      }
      .onReceive(
        viewModel.notificationRepository.onReceive(.awardUnlocked)
      ) { note in
        if let awardModelDTO = note.object as? AwardModelDTO {
          withAnimation(.spring()) {
            viewModel.awardUnlocked = awardModelDTO
          }
        }
      }
      .onReceive(
        viewModel.notificationRepository.onReceive(.entryReceived)
      ) { note in
        if let entryModelDTO = note.object as? EntryModelDTO {
          withAnimation(.spring()) {
            viewModel.entryReceived = entryModelDTO
          }
        }
      }
      .onReceive(
        viewModel.notificationRepository.onReceive(.errorAppeared)
      ) { note in
        if let errorDTO = note.object as? ErrorDTO {
          withAnimation(.spring()) {
            viewModel.errorAppeared = errorDTO
          }
        }
      }
      .onReceive(
        viewModel.notificationRepository.onReceive(.serviceMessage)
      ) { note in
        if let serviceMessageDTO = note.object as? ServiceMessageDTO {
          withAnimation(.spring()) {
            viewModel.serviceMessage = serviceMessageDTO
          }
        }
      }
    case .bottom:
      ZStack {
        if let nextChallenge = viewModel.nextChallengeUnlocked {
          MessageBadgeView(type: .nextChallenge) {
            Text(nextChallenge)
              .fontTheme(.body)
              .foregroundStyleTheme(.text)
          }
          .transition(
            .move(edge: .bottom).combined(with: .opacity)
          )
          .padding(.bottom, 65)
          .onAppear {
            Task {
              try? await Task.sleep(for: .seconds(4))

              withAnimation(.spring) {
                viewModel.nextChallengeUnlocked = nil
              }
            }
          }
          .phaseAnimator([0, 8]) { content, offset in
            content.offset(y: offset)
          } animation: { _ in
            .easeInOut(duration: 1.0)
          }
        }
      }
      .onReceive(
        viewModel.notificationRepository
          .onReceive(.nextChallengeUnlocked)
      ) { note in
        if note.object as? Bool != nil,
          let nextChallenge = viewModel.getNextChallenge()
        {
          DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
            withAnimation(.spring()) {
              viewModel.nextChallengeUnlocked = nextChallenge
            }
          }
        }
      }
    case .hidden:
      ZStack {

      }
      .onReceive(
        viewModel.notificationRepository
          .onReceive(.settingsUpdated)
      ) { note in
        if let profileModelDTO = note.object as? ProfileModelDTO {
          profile.updateProfileModel(profileModelDTO)
        }
      }
      .onReceive(
        viewModel.notificationRepository
          .onReceive(.subscriptionUpdated)
      ) { note in
        if let subscriptionUpdatedDTO = note.object as? SubscriptionUpdatedDTO {
          Task {
            await viewModel.subscriptionRepository?.updateStatusFor(subscriptionUpdatedDTO, profile)
          }
        }
      }
    }
  }
}

#Preview("EnglishFormalLightBottomNextChallenge") {
  PreviewContainerView {
    NotificationListenerView(state: .bottom)
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
      .onAppear {
        NotificationRepository().send(
          nextChallenge: true
        )
      }
  }
}

#Preview("EnglishRoyalLightNextChallenge") {
  PreviewContainerView {
    NotificationListenerView(state: .bottom)
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.light)
      .onAppear {
        NotificationRepository().send(
          nextChallenge: true
        )
      }
  }
}

#Preview("EnglishForestLightNextChallenge") {
  PreviewContainerView {
    NotificationListenerView(state: .bottom)
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.light)
      .onAppear {
        NotificationRepository().send(
          nextChallenge: true
        )
      }
  }
}

#Preview("EnglishHarvestLightNextChallenge") {
  PreviewContainerView {
    NotificationListenerView(state: .bottom)
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.light)
      .onAppear {
        NotificationRepository().send(
          nextChallenge: true
        )
      }
  }
}

#Preview("EnglishMidnightLightNextChallenge") {
  PreviewContainerView {
    NotificationListenerView(state: .bottom)
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.light)
      .onAppear {
        NotificationRepository().send(
          nextChallenge: true
        )
      }
  }
}

#Preview("EnglishFormalLightTopAward") {
  PreviewContainerView {
    NotificationListenerView(state: .top)
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
      .onAppear {
        NotificationRepository().send(
          awardModelDTO: AwardModelDTOFactory().fromModel(
            AwardModel.sampleData.first!
          )
        )
      }
  }
}

#Preview("EnglishRoyalLightTopAward") {
  PreviewContainerView {
    NotificationListenerView(state: .top)
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.light)
      .onAppear {
        NotificationRepository().send(
          awardModelDTO: AwardModelDTOFactory().fromModel(
            AwardModel.sampleData.first!
          )
        )
      }
  }
}

#Preview("EnglishForestLightTopAward") {
  PreviewContainerView {
    NotificationListenerView(state: .top)
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.light)
      .onAppear {
        NotificationRepository().send(
          awardModelDTO: AwardModelDTOFactory().fromModel(
            AwardModel.sampleData.first!
          )
        )
      }
  }
}

#Preview("EnglishHarvestLightTopAward") {
  PreviewContainerView {
    NotificationListenerView(state: .top)
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.light)
      .onAppear {
        NotificationRepository().send(
          awardModelDTO: AwardModelDTOFactory().fromModel(
            AwardModel.sampleData.first!
          )
        )
      }
  }
}

#Preview("EnglishMidnightLightTopAward") {
  PreviewContainerView {
    NotificationListenerView(state: .top)
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.light)
      .onAppear {
        NotificationRepository().send(
          awardModelDTO: AwardModelDTOFactory().fromModel(
            AwardModel.sampleData.first!
          )
        )
      }
  }
}

#Preview("EnglishFormalLightTopEntry") {
  PreviewContainerView {
    NotificationListenerView(state: .top)
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
      .onAppear {
        NotificationRepository().send(
          entryModelDTO: EntryModelDTOFactory().fromModel(
            EntryModel.sampleData.first!
          )
        )
      }
  }
}

#Preview("EnglishRoyalLightTopEntry") {
  PreviewContainerView {
    NotificationListenerView(state: .top)
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.light)
      .onAppear {
        NotificationRepository().send(
          entryModelDTO: EntryModelDTOFactory().fromModel(
            EntryModel.sampleData.first!
          )
        )
      }
  }
}

#Preview("EnglishForestLightTopEntry") {
  PreviewContainerView {
    NotificationListenerView(state: .top)
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.light)
      .onAppear {
        NotificationRepository().send(
          entryModelDTO: EntryModelDTOFactory().fromModel(
            EntryModel.sampleData.first!
          )
        )
      }
  }
}

#Preview("EnglishHarvestLightTopEntry") {
  PreviewContainerView {
    NotificationListenerView(state: .top)
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.light)
      .onAppear {
        NotificationRepository().send(
          entryModelDTO: EntryModelDTOFactory().fromModel(
            EntryModel.sampleData.first!
          )
        )
      }
  }
}

#Preview("EnglishMidnightLightTopEntry") {
  PreviewContainerView {
    NotificationListenerView(state: .top)
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.light)
      .onAppear {
        NotificationRepository().send(
          entryModelDTO: EntryModelDTOFactory().fromModel(
            EntryModel.sampleData.first!
          )
        )
      }
  }
}
