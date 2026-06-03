//
//  Days.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 04.03.2026.
//

import SwiftData
import SwiftUI

struct DaysView: View {
  //  @State private var viewModel: ViewModel = ViewModel
  @Query private var activeDays: [EntryModel]

  let columns: [GridItem]
  let days: [Date]
  let currentDate: Date
  let profileUUID: UUID

  init(
    columns: [GridItem],
    days: [Date],
    currentDate: Date,
    profileUUID: UUID
  ) {
    self.columns = columns
    self.days = days
    self.currentDate = currentDate
    self.profileUUID = profileUUID

    let unwrappedProfileUUID: String = profileUUID.uuidString
    let startOfDay: Date = currentDate.startOfMonth.startOfDay
    let endOfDay: Date = currentDate.endOfMonth.endOfDay
    let predicate: Predicate<EntryModel> = #Predicate<EntryModel> { entry in
      entry.profileUUIDRawValue == unwrappedProfileUUID
        && entry.timestamp >= startOfDay
        && entry.timestamp < endOfDay
    }

    _activeDays = Query(filter: predicate, sort: \EntryModel.timestamp)
  }

  var body: some View {
    LazyVGrid(columns: columns, spacing: 10) {
      ForEach(days, id: \.self) { day in
        let theme: BackgroundAdaptiveModifier.BackgroundThemeEnum = ledgerGridDateLabelBackground(
          day: day)
        NavigationLink(
          day.formatted(.dateTime.day()),
          value: DayViewDTO(currentDay: day)
        )
        .frame(maxWidth: .infinity, minHeight: 40)
        .backgroundTheme(theme)
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
        .disabled(
          disabled(day: day, theme: theme)
        )
      }
    }
    .padding()
  }

  private func disabled(day: Date, theme: BackgroundAdaptiveModifier.BackgroundThemeEnum) -> Bool {
    theme != .circle || day >= currentDate.endOfDay
      || day.currentMonth != currentDate.currentMonth
  }

  private func ledgerGridDateLabelBackground(day: Date)
    -> BackgroundAdaptiveModifier.BackgroundThemeEnum
  {
    let startOfDay: Date = day.startOfDay
    let endOfDay: Date = day.endOfDay
    let filteredActiveDays: [EntryModel] = activeDays.filter { entry in
      entry.timestamp >= startOfDay && entry.timestamp < endOfDay
    }

    switch true {
    case filteredActiveDays.isEmpty
      && day.currentMonth == currentDate.currentMonth:
      return .circleEmpty
    case day.currentMonth != currentDate.currentMonth:
      return .circleOff
    default:
      return .circle
    }
  }
}

#Preview("EnglishFormalLight") {
  @Previewable @State var profileUUID: UUID = UUID.sampleProfileUUID

  PreviewContainerView {
    NavigationStack {
      DaysView(
        columns: Array(repeating: GridItem(.flexible()), count: 7),
        days: Date.timeZonedNow.allDays,
        currentDate: Date.timeZonedNow,
        profileUUID: profileUUID
      )
      .navigationDestination(for: DayViewDTO.self) {
        dayViewDTO in

        DayView(
          currentDate: dayViewDTO.currentDay,
          profileUUID: profileUUID
        )

      }
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalDark") {
  @Previewable @State var profileUUID: UUID = UUID.sampleProfileUUID

  PreviewContainerView {
    NavigationStack {
      DaysView(
        columns: Array(repeating: GridItem(.flexible()), count: 7),
        days: Date.timeZonedNow.allDays,
        currentDate: Date.timeZonedNow,
        profileUUID: profileUUID
      )
      .navigationDestination(for: DayViewDTO.self) {
        dayViewDTO in

        DayView(
          currentDate: dayViewDTO.currentDay,
          profileUUID: profileUUID
        )

      }
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.dark)
  }
}
