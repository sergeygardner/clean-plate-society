//
//  CustomTabView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 14.05.2026.
//

import SwiftUI

struct CustomTabView: View {
  @EnvironmentObject var profile: Profile
  @State var viewModel: ViewModel = ViewModel()

  var body: some View {
    ZStack(alignment: .bottom) {
      Group {
        switch viewModel.selected {
        case .audience:
          tabAudience
        case .ledger:
          tabLedger
        case .stickers:
          tabStickers
        case .awards:
          tabAwards
        case .wisdom:
          tabWisdom
        }
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    .ignoresSafeArea(.container, edges: .bottom)
    .overlay(alignment: .bottom) {
      HStack(spacing: 0) {
        Spacer()
        buttonTabAudience
        buttonTabLedger
        buttonTabStickers
        buttonTabAwards
        buttonTabWisdom
        Spacer()
      }
      .padding(.vertical, 10)
      .background(.ultraThinMaterial)
      .clipShape(Capsule())
      .overlay(
        Capsule()
          .stroke(
            LinearGradient(
              colors: [.white.opacity(0.08), .white.opacity(0.01), .clear],
              startPoint: .topLeading,
              endPoint: .bottomTrailing
            ),
            lineWidth: 0.1
          )
      )
      .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0, y: 8)
      .padding(.horizontal, 24)
      .padding(.bottom, 12)
    }
  }

  @ViewBuilder private var tabAudience: some View {
    if let profileModelDTO = profile.profileModelDTO,
      let sticker = profile.profileModelDTO?.settings.sticker
    {
      NavigationStack {
        AudienceView(
          profileModelDTO: profileModelDTO,
          sticker: sticker
        )
        .sharedToolbar()
        .sharedNavigation()
      }
    }
  }

  @ViewBuilder private var buttonTabAudience: some View {
    CustomTabButtonView(
      systemImage: "plus.circle",
      title: "tabs.audience",
      isSelected: viewModel.selected == .audience,
    ) {
      viewModel.selected = .audience
    }
  }

  @ViewBuilder private var tabLedger: some View {
    NavigationStack {
      LedgerView()
        .sharedToolbar()
        .sharedNavigation()
        .navigationDestination(for: DayViewDTO.self) {
          dayViewDTO in

          if let profileUUID = profile.profileModelDTO?.uuid {
            DayView(
              currentDate: dayViewDTO.currentDay,
              profileUUID: profileUUID
            )
          }
        }
    }
  }

  @ViewBuilder private var buttonTabLedger: some View {
    CustomTabButtonView(
      systemImage: "list.bullet.clipboard",
      title: "tabs.ledger",
      isSelected: viewModel.selected == .ledger,
    ) {
      viewModel.selected = .ledger
    }
  }

  @ViewBuilder private var tabAwards: some View {
    if let profileUUID = profile.profileModelDTO?.uuid {
      NavigationStack {
        AwardsView(
          profileUUID: profileUUID
        )
        .sharedToolbar()
        .sharedNavigation()
      }
    }
  }

  @ViewBuilder private var buttonTabAwards: some View {
    CustomTabButtonView(
      systemImage: "medal",
      title: "tabs.awards",
      isSelected: viewModel.selected == .awards,
    ) {
      viewModel.selected = .awards
    }
  }

  @ViewBuilder private var tabStickers: some View {
    NavigationStack {
      StickersView()
        .sharedToolbar()
        .sharedNavigation()
    }
  }

  @ViewBuilder private var buttonTabStickers: some View {
    CustomTabButtonView(
      systemImage: "photo.stack",
      title: "tabs.stickers",
      isSelected: viewModel.selected == .stickers,
    ) {
      viewModel.selected = .stickers
    }
  }

  @ViewBuilder private var tabWisdom: some View {
    NavigationStack {
      WisdomView()
        .sharedToolbar()
        .sharedNavigation()
        .navigationDestination(for: SubscriptionViewDTO.self) {
          subscriptionViewDTO in

          SubscriptionsView()
        }
        .navigationDestination(for: RulesViewDTO.self) {
          rulesViewDTO in

          RulesView()
        }
        .navigationDestination(for: PrivacyPolicyViewDTO.self) {
          privacyPolicyViewDTO in

          PrivacyPolicyView()
            .navigationTitle(viewModel.societyRepository.ourPolicyIntroductionTitle() ?? "")
        }
    }
  }

  @ViewBuilder private var buttonTabWisdom: some View {
    CustomTabButtonView(
      systemImage: "text.book.closed",
      title: "tabs.wisdom",
      isSelected: viewModel.selected == .wisdom,
    ) {
      viewModel.selected = .wisdom
    }
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    CustomTabView()
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
  }
}
