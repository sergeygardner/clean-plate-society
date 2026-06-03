//
//  DayViewModel.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 29.03.2026.
//

import Foundation

extension EntryView {
  @Observable
  class ViewModel {
    private var greetingRepository: GreetingRepository
    private var helloRepository: HelloRepository
    private var mottoRepository: MottoRepository
    private var signatureRepository: SignatureRepository
    private(set) var societyRepository: SocietyRepository

    init(
      greetingRepository: GreetingRepository = GreetingRepository(),
      helloRepository: HelloRepository = HelloRepository(),
      mottoRepository: MottoRepository = MottoRepository(),
      signatureRepository: SignatureRepository = SignatureRepository(),
      societyRepository: SocietyRepository = SocietyRepository(),
    ) {
      self.mottoRepository = mottoRepository
      self.greetingRepository = greetingRepository
      self.helloRepository = helloRepository
      self.signatureRepository = signatureRepository
      self.societyRepository = societyRepository
    }

    func findGreeting(id: Int) -> String? {
      return greetingRepository.find(id: id)
    }

    func findHello(id: Int, placeholder: String) -> AttributedString? {
      return helloRepository.findMarkDowned(id: id, placeholder: placeholder)
    }

    func findMotto(id: Int) -> String? {
      return mottoRepository.find(id: id)
    }

    func findSignature(id: Int) -> String? {
      return signatureRepository.find(id: id)
    }
  }
}
