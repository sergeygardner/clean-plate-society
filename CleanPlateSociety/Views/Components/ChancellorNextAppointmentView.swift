//
//  ChancellorNextAppointmentView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 17.04.2026.
//

import SwiftUI

struct ChancellorNextAppointmentView<Content: View>: View {
  @EnvironmentObject var profile: Profile
  @State var viewModel: ViewModel = ViewModel()
  @ViewBuilder let content: () -> Content

  let id: Int

  init(
    id: Int,
    @ViewBuilder content: @escaping () -> Content,
  ) {
    self.id = id
    self.content = content
  }

  var body: some View {
    VStack {
      VStack(spacing: 15) {
        if let title = viewModel.societyRepository
          .nextAppointementTitle()
        {
          Text(title)
            .fontTheme(.headline)
            .foregroundStyleTheme(.text)
        }

        VStack(alignment: .leading, spacing: 15) {
          if let name = profile.profileModelDTO?.name,
            let greetings = viewModel.societyRepository
              .greetings(name)
          {
            Text(greetings)
              .fontTheme(.subheadline)
              .foregroundStyleTheme(.text)
          }

          if let section1 = viewModel.nextAppointmentSection1Repository
            .find(id: id)
          {
            Text(section1)
              .fontTheme(.subheadline)
              .foregroundStyleTheme(.text)
          }

          if let section2 = viewModel.nextAppointmentSection2Repository
            .find(id: id)
          {
            Text(section2)
              .fontTheme(.subheadline)
              .foregroundStyleTheme(.text)
          }

          if let section3 = viewModel.nextAppointmentSection3Repository
            .find(id: id)
          {
            Text(section3)
              .fontTheme(.subheadline)
              .foregroundStyleTheme(.text)
          }
        }

        ChancellorSignatureView()
          .overlay(alignment: .leading) {
            ChancellorSealView()
              .padding()
          }

        if let status = viewModel.societyRepository
          .nextAppointementStatus()
        {
          Text(status)
            .fontTheme(.title3)
            .foregroundStyleTheme(.text)
        }

        content()
      }
      .padding()
    }
    .borderTheme(.border)
    .backgroundTheme(.plain)
    .frame(minHeight: 200)
    .frame(maxWidth: .infinity)
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    ChancellorNextAppointmentView(
      id: 1,
    ) {
      CountdownTimerView(
        remaining: TimeInterval(8600)
      )
      .fontTheme(.body)
      .foregroundStyleTheme(.text)
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLight") {
  PreviewContainerView {
    ChancellorNextAppointmentView(
      id: 1,
    ) {
      CountdownTimerView(
        remaining: TimeInterval(8600)
      )
      .fontTheme(.body)
      .foregroundStyleTheme(.text)
    }
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLight") {
  PreviewContainerView {
    ChancellorNextAppointmentView(
      id: 1,
    ) {
      CountdownTimerView(
        remaining: TimeInterval(8600)
      )
      .fontTheme(.body)
      .foregroundStyleTheme(.text)
    }
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLight") {
  PreviewContainerView {
    ChancellorNextAppointmentView(
      id: 1,
    ) {
      CountdownTimerView(
        remaining: TimeInterval(8600)
      )
      .fontTheme(.body)
      .foregroundStyleTheme(.text)
    }
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLight") {
  PreviewContainerView {
    ChancellorNextAppointmentView(
      id: 1,
    ) {
      CountdownTimerView(
        remaining: TimeInterval(8600)
      )
      .fontTheme(.body)
      .foregroundStyleTheme(.text)
    }
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.light)
  }
}
