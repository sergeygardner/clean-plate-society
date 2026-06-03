//
//  DaysOfWeek.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 03.03.2026.
//

import SwiftUI

struct DaysOfWeekView: View {
  var daysOfWeek: [String]

  var body: some View {
    HStack {
      ForEach(daysOfWeek.indices, id: \.self) { index in
        Text(daysOfWeek[index])
          .fontTheme(.footnote)
          .foregroundStyleTheme(.text)
          .frame(maxWidth: .infinity)

      }
    }
  }
}

#Preview("EnglishFormalLight") {
  DaysOfWeekView(daysOfWeek: Date.weekDays(locale: Locale(identifier: "en")))
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
}

#Preview("EnglishFormalDark") {
  DaysOfWeekView(daysOfWeek: Date.weekDays(locale: Locale(identifier: "en")))
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(ColorScheme(.dark))
}
