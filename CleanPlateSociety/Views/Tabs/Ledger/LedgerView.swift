//
//  LedgerView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 03.03.2026.
//

import SwiftData
import SwiftUI

struct LedgerView: View {
  @Environment(DataContainer.self) private var dataContainer
  @Environment(\.locale) private var locale
  @EnvironmentObject var profile: Profile
  @State var currentDate: Date
  @State var currentMonth: Date
  @State private var days: [Date] = []

  init(
    currentDate: Date = Date.timeZonedNow,
    currentMonth: Date = Date.timeZonedNow,
  ) {
    _currentDate = State(wrappedValue: currentDate)
    _currentMonth = State(wrappedValue: currentMonth)
  }

  private var columns: [GridItem] = Array(
    repeating: GridItem(.flexible()),
    count: 7
  )

  var body: some View {
    if let profileUUID = profile.profileModelDTO?.uuid {
      ScrollView {
        VStack(alignment: .leading) {
          HStack {
            Text(
              currentMonth.formatted(
                .dateTime.locale(locale).year().month()
              )
            )
            .fontTheme(.footnote)
            .foregroundStyleTheme(.text)
            .padding()

            Spacer()

            Button {
              if let date = Date.normalisedCalendar.date(
                byAdding: .month,
                value: -1,
                to: currentMonth
              ) {
                currentMonth = date
              }

              if Date.timeZonedNow >= currentMonth.startOfMonth
                && Date.timeZonedNow <= currentMonth.endOfMonth
              {
                currentDate = Date.timeZonedNow
              } else {
                currentDate = currentMonth.endOfMonth
              }

              initDays()
            } label: {
              Image(systemName: "chevron.left")
                .foregroundStyleTheme(.icon)
                .padding(.top, 3)
            }

            Button {
              if let date = Date.normalisedCalendar.date(
                byAdding: .month,
                value: 1,
                to: currentMonth
              ) {
                currentMonth = date
              }

              if Date.timeZonedNow >= currentMonth.startOfMonth
                && Date.timeZonedNow <= currentMonth.endOfMonth
              {
                currentDate = Date.timeZonedNow
              } else {
                currentDate = currentMonth.startOfMonth
              }

              initDays()
            } label: {
              Image(systemName: "chevron.right")
                .foregroundStyleTheme(.icon)
                .padding(.top, 3)
            }
          }

          DaysOfWeekView(daysOfWeek: Date.weekDays(locale: locale))
          DaysView(
            columns: columns,
            days: days,
            currentDate: currentDate,
            profileUUID: profileUUID,
          )
          .onAppear {
            initDays()
          }
        }
        .padding()
      }
      .dynamicTypeSize(...DynamicTypeSize.xxxLarge)

    }
  }

  private func initDays() {
    days = currentMonth.allDays
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    NavigationStack {
      LedgerView()
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishFormalDark") {
  PreviewContainerView {
    NavigationStack {
      LedgerView()
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.dark)
    }
  }
}
