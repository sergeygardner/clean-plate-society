//
//  Date.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 03.03.2026.
//

import Foundation

extension Date {
  static var timeZonedNow: Date =
    Date.normalisedCalendar.date(
      from: Date.normalisedCalendar.dateComponents(
        [.year, .month, .day, .hour, .minute, .second], from: Date.now)) ?? .now

  static var firstWeekday = Date.normalisedCalendar.firstWeekday

  static func weekDays(locale: Locale) -> [String] {
    var calendar: Calendar = Date.normalisedCalendar

    calendar.locale = locale

    var weekdays: [String] = calendar.shortWeekdaySymbols

    if firstWeekday > 1 {
      for _ in 1..<firstWeekday {
        if let first: String = weekdays.first {
          weekdays.append(first)
          weekdays.removeFirst()
        }
      }
    }
    return weekdays.map { weekday in
      weekday.capitalized
    }
  }

  static var snapshotReferenceDate: Date? {
    let components: DateComponents = DateComponents(
      calendar: Date.normalisedCalendar,
      year: 2026,
      month: 4,
      day: 27,
      hour: 12,
      minute: 0,
      second: 0
    )

    return components.date
  }

  var startOfMonth: Date {
    Date.normalisedCalendar.dateInterval(of: .month, for: self)?.start ?? Date.timeZonedNow
  }

  var endOfMonth: Date {
    return Date.normalisedCalendar.dateInterval(of: .month, for: self)?.end.advanced(by: -10)
      ?? Date.timeZonedNow
  }

  var numberOfDays: Int {
    Date.normalisedCalendar.component(.day, from: endOfMonth)
  }

  var firstWeekdayBeforeStart: Date {
    let startOfMonthWeekday: Int = Date.normalisedCalendar.component(
      .weekday,
      from: startOfMonth
    )
    var daysFromPreviousMonth: Int = startOfMonthWeekday - Self.firstWeekday

    if daysFromPreviousMonth < 0 {
      daysFromPreviousMonth += 7
    }

    return Date.normalisedCalendar.date(
      byAdding: .day,
      value: -daysFromPreviousMonth,
      to: startOfMonth
    ) ?? Date.timeZonedNow
  }

  var lastWeekdayAfterEnd: Date {
    let endOfMonthWeekday: Int = Date.normalisedCalendar.component(
      .weekday,
      from: endOfMonth
    )
    let daysFromNextMonth: Int = 7 - (endOfMonthWeekday - 1)

    if daysFromNextMonth == 7 {
      return endOfMonth
    }

    return Date.normalisedCalendar.date(
      byAdding: .day,
      value: daysFromNextMonth,
      to: endOfMonth
    ) ?? Date.timeZonedNow
  }

  var allDays: [Date] {
    let lastWeekdayAfterEndDate: Date = lastWeekdayAfterEnd
    var days: [Date] = []
    var day: Date = firstWeekdayBeforeStart

    while day <= lastWeekdayAfterEndDate {
      days.append(day)
      day =
        Date.normalisedCalendar.date(
          byAdding: .day,
          value: 1,
          to: day
        ) ?? Date.timeZonedNow
    }

    return days
  }

  var currentMonth: Int {
    Date.normalisedCalendar.component(.month, from: self)
  }

  var startOfDay: Date {
    Date.normalisedCalendar.startOfDay(for: self)
  }

  var startOfHour: Date {
    let currentHour: Int = Date.normalisedCalendar.component(.hour, from: self)

    return Date.normalisedCalendar.date(bySettingHour: currentHour, minute: 0, second: 0, of: self)
      ?? Date.timeZonedNow
  }

  var endOfDay: Date {
    Date.normalisedCalendar.startOfDay(
      for: Date.normalisedCalendar.date(
        byAdding: .day,
        value: 1,
        to: self
      ) ?? Date.timeZonedNow
    )
  }

  var dayOfYear: Int {
    Date.normalisedCalendar.ordinality(of: .day, in: .year, for: self) ?? 1
  }

  var dayOfMonth: Int {
    Date.normalisedCalendar.ordinality(of: .day, in: .month, for: self) ?? 1
  }

  static var normalisedCalendar: Calendar = {
    let calendar: Calendar = Calendar.current

    return calendar
  }()

  func getBreakpoint(_ difficultyLevel: DifficultyLevelEnum) -> Date {
    let progress: Int = difficultyLevel.progress
    let breakpoints: Int = 24 / progress

    return Date.normalisedCalendar.date(
      byAdding: .hour,
      value: breakpoints,
      to: self
    ) ?? Date.timeZonedNow
  }

  func hoursShift(_ shift: Int) -> Date {
    return Date.normalisedCalendar.date(byAdding: .hour, value: shift, to: self)
      ?? Date.timeZonedNow
  }
}
