//
//  EnvironmentValues.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 03.03.2026.
//

import SwiftUI

extension EnvironmentValues {
  @Entry var profile: Profile = Profile.sampleEmpty
  @Entry var errorManager: ErrorManager = ErrorManager()
}
