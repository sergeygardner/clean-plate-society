//
//  SubscriptionView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 05.05.2026.
//

import RevenueCat
import SwiftUI

struct SubscriptionsView: View {
  @EnvironmentObject var profile: Profile
  @State var viewModel: ViewModel = ViewModel()

  var body: some View {
    ScrollView {
      switch viewModel.statusFetchingOfferings {
      case .error(let error):
        let _ = viewModel.notificationRepository.send(
          errorDTO: ErrorDTO(error: .subscription(error)))
      case .idle, .loading:
        ProgressView()
      case .loaded:
        if let offerings = viewModel.offerings {

          ForEach(Array(offerings.values), id: \.self) { offering in
            Section(
              header: Text(offering.serverDescription)
                .fontTheme(.title)
                .foregroundStyleTheme(.text)
            ) {
              ForEach(offering.availablePackages) { package in
                detail(package)
              }
            }
          }
        }
      }

      if let text = viewModel.societyRepository.restorePurchase() {
        ButtonView(
          type: .subscription,
          text: text,
        ) {
          Task {
            await viewModel.subscriptionRepository?.restorePurchase()
          }
        }
        .padding()
      }

      if let text = viewModel.societyRepository.legalPurchase() {
        VStack {
          Text(text)
            .fontTheme(.caption)
            .foregroundStyleTheme(.text)
        }
        .padding([.top, .horizontal])
      }

      PrivacyPolicyView(
        fontTheme: .caption,
        paddingEdges: .horizontal,
        useSpacer: false,
      )
      .padding()
      .padding(.bottom, AppConfigDTO.viewScrollBottomPadding)
    }
    .task {
      await viewModel.fetchOfferings()
    }
    .navigationTitle(viewModel.societyRepository.subscriptionIntroductionTitle() ?? "")
  }

  @ViewBuilder func detail(_ package: Package) -> some View {
    if let subscription = viewModel.findSubscriptionEnum(package.storeProduct.productIdentifier) {
      VStack(spacing: 10) {
        Image(systemName: "crown.fill")
          .resizable()
          .scaledToFit()
          .foregroundStyleTheme(.icon)
          .frame(width: 200, height: 200)

        if let text = viewModel.societyRepository.subscriptionTitle(subscription) {
          Text(text)
            .fontTheme(.title)
            .foregroundStyleTheme(.text)
            .padding(.horizontal)
        }

        if let text = viewModel.societyRepository.subscriptionDescription(subscription) {
          VStack(alignment: .leading) {
            Text(text)
              .fontTheme(.subheadline)
              .foregroundStyleTheme(.text)
          }
          .frame(maxWidth: .infinity, alignment: .leading)
          .padding(.horizontal)
        }

        VStack(alignment: .leading) {
          ForEach(subscription.tier.perks, id: \.self) { perk in
            if let text = viewModel.societyRepository.perkTitle(perk) {
              HStack {
                Image(systemName: "dot.viewfinder")
                  .fontTheme(.subheadline)
                  .foregroundStyleTheme(.icon)
                Text(text)
                  .fontTheme(.subheadline)
                  .foregroundStyleTheme(.text)
              }
              .frame(maxWidth: .infinity, alignment: .leading)
            }
          }
        }
        .padding(.horizontal)

        if profile.hasSubscription(subscription) {
          ButtonView(
            type: .subscription,
            text: "active",
          ) {

          }
          .padding()
        } else {
          ButtonView(
            type: .subscription,
            text: package.localizedPriceString,
          ) {
            Task {
              await viewModel.subscriptionRepository?.purchase(
                package: package,
              )
            }
          }
          .padding()
        }
      }
      .borderTheme(.border)
      .backgroundTheme(.plain)
      .frame(minHeight: 500)
      .frame(maxWidth: .infinity)
      .padding()
    }
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    SubscriptionsView()
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLight") {
  PreviewContainerView {
    SubscriptionsView()
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLight") {
  PreviewContainerView {
    SubscriptionsView()
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLight") {
  PreviewContainerView {
    SubscriptionsView()
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLight") {
  PreviewContainerView {
    SubscriptionsView()
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.light)

  }
}

#Preview("EnglishFormalDark") {
  PreviewContainerView {
    SubscriptionsView()
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.dark)

  }
}

#Preview("EnglishRoyalDark") {
  PreviewContainerView {
    SubscriptionsView()
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.dark)
  }

}

#Preview("EnglishForestDark") {
  PreviewContainerView {
    SubscriptionsView()
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.dark)
  }

}

#Preview("EnglishHarvestDark") {
  PreviewContainerView {
    SubscriptionsView()
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.dark)
  }
}

#Preview("EnglishMidnightDark") {
  PreviewContainerView {
    SubscriptionsView()
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.dark)
  }
}
