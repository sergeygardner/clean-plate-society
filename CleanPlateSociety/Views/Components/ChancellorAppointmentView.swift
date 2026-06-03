//
//  ChancellorAppointmentView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 17.04.2026.
//

import SwiftUI

struct ChancellorAppointmentView: View {
  @EnvironmentObject var profile: Profile
  @State var viewModel: ViewModel

  let id: Int

  init(
    id: Int,
    command: @escaping () -> Void,
  ) {
    self.id = id

    _viewModel = State(wrappedValue: ViewModel(command: command))
  }

  var body: some View {
    VStack {
      VStack(spacing: 15) {
        if let title = viewModel.societyRepository
          .appointementTitle()
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

          if let section1 = viewModel.appointmentSection1Repository
            .find(id: id)
          {
            Text(section1)
              .fixedSize(horizontal: false, vertical: true)
              .fontTheme(.subheadline)
              .foregroundStyleTheme(.text)
          }

          if let section2 = viewModel.appointmentSection2Repository
            .find(id: id)
          {
            Text(section2)
              .fixedSize(horizontal: false, vertical: true)
              .fontTheme(.subheadline)
              .foregroundStyleTheme(.text)
          }

          if let section3 = viewModel.appointmentSection3Repository
            .find(id: id)
          {
            Text(section3)
              .fixedSize(horizontal: false, vertical: true)
              .fontTheme(.subheadline)
              .foregroundStyleTheme(.text)
          }
        }

        ChancellorSignatureView()
          .overlay(alignment: .leading) {
            ChancellorSealView()
              .padding()
          }

        if let engagement = viewModel.societyRepository
          .appointementEngagement()
        {
          Text(engagement)
            .fontTheme(.title3)
            .foregroundStyleTheme(.text)
        }

        Button {
          viewModel.command()
        } label: {
          Image(
            systemName:
              "plus.circle"
          )
          .resizable()
          .scaledToFit()
          .aspectRatio(
            contentMode: .fit
          )
          .frame(width: 150)
          .foregroundStyleTheme(.icon)
        }
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
    ChancellorAppointmentView(
      id: 1,
    ) {

    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLight") {
  PreviewContainerView {
    ChancellorAppointmentView(
      id: 1,
    ) {

    }
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLight") {
  PreviewContainerView {
    ChancellorAppointmentView(
      id: 1,
    ) {

    }
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLight") {
  PreviewContainerView {
    ChancellorAppointmentView(
      id: 1,
    ) {

    }
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLight") {
  PreviewContainerView {
    ChancellorAppointmentView(
      id: 1,
    ) {

    }
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.light)
  }
}
