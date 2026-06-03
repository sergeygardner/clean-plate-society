//
//  EntryViewModelTest.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 20.04.2026.
//

import Foundation
import SwiftUI
import Testing

@testable import CleanPlateSociety

@Suite(.tags(.viewModel))
@MainActor
struct EntryViewModelTest {
  struct Input {
    let id: Int
    let greeting: String
    let expectedGreeting: String?
    let hello: String
    let name: String
    let expectedHello: AttributedString?
    let motto: String
    let expectedMotto: String?
    let signature: String
    let expectedSignature: String?
  }

  @Test(
    "find",
    arguments: [
      Input(
        id: 1,
        greeting: "greeting",
        expectedGreeting: "greeting",
        hello: "hello, %@",
        name: "name",
        expectedHello: try? AttributedString(markdown: "hello, name"),
        motto: "motto",
        expectedMotto: "motto",
        signature: "signature",
        expectedSignature: "signature",
      ),
      Input(
        id: 1,
        greeting: "",
        expectedGreeting: nil,
        hello: "",
        name: "",
        expectedHello: nil,
        motto: "",
        expectedMotto: nil,
        signature: "",
        expectedSignature: nil,
      ),
    ]
  )
  func find(input: Input) async throws {
    let sut = EntryView<EmptyView>.ViewModel(
      greetingRepository: GreetingRepository(
        table: .greeting,
        translationRepository: MockTranslationRepository(
          value: input.greeting
        )
      ),
      helloRepository: HelloRepository(
        table: .hello,
        translationRepository: MockTranslationRepository(
          value: input.hello
        )
      ),
      mottoRepository: MottoRepository(
        table: .motto,
        translationRepository: MockTranslationRepository(
          value: input.motto
        )
      ),
      signatureRepository: SignatureRepository(
        table: .signature,
        translationRepository: MockTranslationRepository(
          value: input.signature
        )
      ),
    )

    #expect(input.expectedGreeting == sut.findGreeting(id: input.id))
    #expect(
      input.expectedHello
        == sut.findHello(id: input.id, placeholder: input.name)
    )
    #expect(input.expectedMotto == sut.findMotto(id: input.id))
    #expect(input.expectedSignature == sut.findSignature(id: input.id))
  }
}
