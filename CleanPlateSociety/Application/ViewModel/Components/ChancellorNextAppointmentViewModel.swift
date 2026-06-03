//
//  ChancellorNextAppointmentViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 17.04.2026.
//

import Foundation

extension ChancellorNextAppointmentView {
  @Observable
  class ViewModel {
    let nextAppointmentSection1Repository: NextAppointmentSection1Repository
    let nextAppointmentSection2Repository: NextAppointmentSection2Repository
    let nextAppointmentSection3Repository: NextAppointmentSection3Repository
    let societyRepository: SocietyRepository

    init(
      nextAppointmentSection1Repository: NextAppointmentSection1Repository =
        NextAppointmentSection1Repository(),
      nextAppointmentSection2Repository: NextAppointmentSection2Repository =
        NextAppointmentSection2Repository(),
      nextAppointmentSection3Repository: NextAppointmentSection3Repository =
        NextAppointmentSection3Repository(),
      societyRepository: SocietyRepository = SocietyRepository(),
    ) {
      self.nextAppointmentSection1Repository = nextAppointmentSection1Repository
      self.nextAppointmentSection2Repository = nextAppointmentSection2Repository
      self.nextAppointmentSection3Repository = nextAppointmentSection3Repository
      self.societyRepository = societyRepository
    }
  }
}
