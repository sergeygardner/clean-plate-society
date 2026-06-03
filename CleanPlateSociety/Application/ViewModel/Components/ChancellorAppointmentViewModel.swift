//
//  ChancellorAppointmentViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 17.04.2026.
//

import Foundation

extension ChancellorAppointmentView {
  @Observable
  class ViewModel {
    let appointmentSection1Repository: AppointmentSection1Repository
    let appointmentSection2Repository: AppointmentSection2Repository
    let appointmentSection3Repository: AppointmentSection3Repository
    let societyRepository: SocietyRepository
    var command: () -> Void

    init(
      appointmentSection1Repository: AppointmentSection1Repository =
        AppointmentSection1Repository(),
      appointmentSection2Repository: AppointmentSection2Repository =
        AppointmentSection2Repository(),
      appointmentSection3Repository: AppointmentSection3Repository =
        AppointmentSection3Repository(),
      societyRepository: SocietyRepository = SocietyRepository(),
      command: @escaping () -> Void,
    ) {
      self.appointmentSection1Repository = appointmentSection1Repository
      self.appointmentSection2Repository = appointmentSection2Repository
      self.appointmentSection3Repository = appointmentSection3Repository
      self.societyRepository = societyRepository
      self.command = command
    }
  }
}
