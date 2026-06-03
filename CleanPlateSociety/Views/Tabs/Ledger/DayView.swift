//
//  DayView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 11.03.2026.
//

import SwiftData
import SwiftUI

struct DayView: View {
  @EnvironmentObject var profile: Profile
  @Query private var entries: [EntryModel]
  @State var viewModel: ViewModel = ViewModel()

  let currentDate: Date
  let profileUUID: UUID

  init(
    currentDate: Date,
    profileUUID: UUID
  ) {
    self.currentDate = currentDate
    self.profileUUID = profileUUID

    let profileUUIDString: String = profileUUID.uuidString
    let startOfDay: Date = currentDate.startOfDay
    let endOfDay: Date = currentDate.endOfDay
    let predicate: Predicate<EntryModel> = #Predicate<EntryModel> { entry in
      entry.profileUUIDRawValue == profileUUIDString
        && entry.timestamp >= startOfDay
        && entry.timestamp < endOfDay
    }

    _entries = Query(filter: predicate, sort: \EntryModel.timestamp)
  }

  var body: some View {
    if let profileName = profile.profileModelDTO?.name,
      let date = entries.first?.timestamp
    {
      EntryView(
        date: date,
        profileName: profileName
      ) {
        LazyVStack {
          Section {
            ForEach(entries) {
              entry in
              if let title = viewModel.mainRepository.getEntryTitleAt(
                date: entry.timestamp
              ) {
                HStack {
                  Image(systemName: "envelope")
                    .foregroundStyleTheme(.icon)
                    .padding(.top, 3)
                  Text(title)
                    .fontTheme(.body)
                    .foregroundStyleTheme(.text)
                }
              }
            }
          }
          .listSectionSeparator(.hidden, edges: .bottom)
          .listRowBackground(Color.clear)
        }
        .listRowBackground(Color.clear)
        .listStyle(.plain)
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .frame(minHeight: 100)
      }
      .navigationTitle(currentDate.formatted(.dateTime.year().month().day()))
      .toolbarTheme(.navigationTitle)
    }
  }
}

#Preview("EnglishFormalLight") {
  @Previewable @State var profileUUID: UUID = UUID.sampleProfileUUID

  PreviewContainerView {
    NavigationStack {
      DayView(
        currentDate: Date.timeZonedNow,
        profileUUID: profileUUID
      )
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalDark") {
  @Previewable @State var profileUUID: UUID = UUID.sampleProfileUUID

  PreviewContainerView {
    NavigationStack {
      DayView(
        currentDate: Date.timeZonedNow,
        profileUUID: profileUUID
      )
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.dark)
  }
}
