//
//  NetworkErrorEnum.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 20.03.2026.
//

import Foundation

enum NetworkingErrorEnum: Error, Equatable {
  case encodingFailed(EncodingError)
  case decodingFailed(DecodingError)
  case invalidStatusCode(Int)
  case requestFailed(URLError)
  case otherError(Error)
  case undefinedError

  static func == (lhs: NetworkingErrorEnum, rhs: NetworkingErrorEnum) -> Bool {
    switch (lhs, rhs) {
    case (.encodingFailed(let lContext), .encodingFailed(let rContext)):
      return lContext.contextDescription == rContext.contextDescription
    case (.decodingFailed(let lContext), .decodingFailed(let rContext)):
      return lContext.contextDescription == rContext.contextDescription
        && lContext.fullPath == rContext.fullPath
    case (
      .invalidStatusCode(let lContext), .invalidStatusCode(let rContext)
    ):
      return lContext == rContext
    case (.requestFailed(let lContext), .requestFailed(let rContext)):
      return lContext == rContext
    case (.otherError(let lContext), .otherError(let rContext)):
      return lContext.localizedDescription
        == rContext.localizedDescription
    case (.undefinedError, .undefinedError):
      return true
    default:
      return false
    }
  }
}

enum AppErrorEnum: Error, Equatable {
  case core(Error?)
  case filesystem(Error?)
  case sticker(Error?)
  case subscription(Error?)
  case undefined

  static func == (lhs: AppErrorEnum, rhs: AppErrorEnum) -> Bool {
    switch (lhs, rhs) {
    case (.core(let lContext), .core(let rContext)):
      return lContext?.localizedDescription == rContext?.localizedDescription
    case (.subscription(let lContext), .subscription(let rContext)):
      return lContext?.localizedDescription == rContext?.localizedDescription
    case (.undefined, .undefined):
      return true
    default:
      return false
    }
  }
}

enum FileErrorEnum: Error, Equatable {
  case core(Error?)
  case undefined

  static func == (lhs: FileErrorEnum, rhs: FileErrorEnum) -> Bool {
    switch (lhs, rhs) {
    case (.core(let lContext), .core(let rContext)):
      return lContext?.localizedDescription == rContext?.localizedDescription
    case (.undefined, .undefined):
      return true
    default:
      return false
    }
  }
}

extension EncodingError {
  var contextDescription: String {
    switch self {
    case .invalidValue(_, let context): return context.debugDescription
    @unknown default: return "Unknown Encoding Error"
    }
  }
}

extension DecodingError {
  var contextDescription: String {
    switch self {
    case .typeMismatch(_, let context): return context.debugDescription
    case .valueNotFound(_, let context): return context.debugDescription
    case .keyNotFound(_, let context): return context.debugDescription
    case .dataCorrupted(let context): return context.debugDescription
    @unknown default:
      return "An unknown disruption occurred in the Archive."
    }
  }

  var fullPath: String {
    let context: Context
    switch self {
    case .typeMismatch(_, let ctx),
      .valueNotFound(_, let ctx),
      .keyNotFound(_, let ctx),
      .dataCorrupted(let ctx):
      context = ctx
    @unknown default: return "root"
    }
    return context.codingPath.map { key in
      key.stringValue
    }
    .joined(separator: ".")
  }
}
