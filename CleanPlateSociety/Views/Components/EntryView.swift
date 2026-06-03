//
//  DayItemView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 11.03.2026.
//

import SwiftUI

struct EntryView<Content: View>: View {
  @Environment(\.locale) var locale: Locale
  @State var viewModel: ViewModel = ViewModel()
  let date: Date
  let profileName: String
  @ViewBuilder let content: () -> Content

  var body: some View {
    ScrollView {
      SocietyHeaderView()

      VStack(alignment: .center) {
        if let motto = viewModel.findMotto(
          id: date.dayOfYear
        ) {
          Text(motto)
            .fontTheme(.title3ItalicSerif)
            .foregroundStyleTheme(.text)
          Divider()
            .padding()
        }
      }
      .padding([.top, .leading, .trailing])
      .frame(maxWidth: .infinity, alignment: .center)

      VStack(alignment: .leading) {
        if let hello = viewModel.findHello(
          id: date.dayOfMonth,
          placeholder: profileName,
        ) {
          VStack(alignment: .leading) {
            Text(hello)
              .fontTheme(.body)
              .foregroundStyleTheme(.text)
              .padding([.bottom])
          }
          .padding(.horizontal)
        }

        if let greeting = viewModel.findGreeting(
          id: date.dayOfYear
        ) {
          VStack(alignment: .leading) {
            Text(greeting)
              .fontTheme(.body)
              .foregroundStyleTheme(.text)
            Spacer(minLength: 20)
          }
          .padding(.horizontal)
        }

        if let chancellorName = viewModel.societyRepository
          .chancellorName(),
          let signature = viewModel.findSignature(
            id: date.dayOfMonth
          )
        {
          VStack(alignment: .leading) {
            Text(signature)
              .fontTheme(.subheadlineLightSerif)
              .foregroundStyleTheme(.text)
            Text(chancellorName)
              .fontTheme(.subheadlineLightSerif)
              .foregroundStyleTheme(.text)
            Divider()
              .padding(.vertical)
          }
          .padding(.horizontal)
        }

        if let chancellorSignedAndSealed = viewModel.societyRepository
          .chancellorSignedAndSealed()
        {
          VStack(alignment: .leading) {
            Text(chancellorSignedAndSealed)
              .fontTheme(.caption2)
              .foregroundStyleTheme(.text)
            Text(
              date.formatted(
                .dateTime.locale(locale).year().month().day()
                  .hour()
                  .minute()
              )
            )
            .fontTheme(.caption2)
            .foregroundStyleTheme(.text)
          }
          .padding(.horizontal)
          .overlay(alignment: .center) {
            ChancellorSealView()
              .padding()
          }
        }

        content()
      }
      .padding()
      .frame(maxWidth: .infinity, alignment: .leading)
    }
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    EntryView(
      date: EntryModel.sampleData.first!.timestamp,
      profileName: Profile.sampleFormalLow.profileModel!.name
    ) {

    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLight") {
  PreviewContainerView {
    EntryView(
      date: EntryModel.sampleData.first!.timestamp,
      profileName: Profile.sampleFormalLow.profileModel!.name
    ) {

    }
    .environmentObject(Profile.sampleRoyalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLight") {
  PreviewContainerView {
    EntryView(
      date: EntryModel.sampleData.first!.timestamp,
      profileName: Profile.sampleFormalLow.profileModel!.name
    ) {

    }
    .environmentObject(Profile.sampleForestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLight") {
  PreviewContainerView {
    EntryView(
      date: EntryModel.sampleData.first!.timestamp,
      profileName: Profile.sampleFormalLow.profileModel!.name
    ) {

    }
    .environmentObject(Profile.sampleHarvestLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLight") {
  PreviewContainerView {
    EntryView(
      date: EntryModel.sampleData.first!.timestamp,
      profileName: Profile.sampleFormalLow.profileModel!.name
    ) {

    }
    .environmentObject(Profile.sampleMidnightLow)
    .preferredColorScheme(.light)
  }
}
