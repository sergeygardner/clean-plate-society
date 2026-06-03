//
//  IconManager.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 15.04.2026.
//

import Combine
import SwiftUI

class IconManager: ObservableObject {
  func upgradeTo(theme: Theme) {
    guard UIApplication.shared.supportsAlternateIcons else { return }

    UIApplication.shared.setAlternateIconName(theme.icon) { error in
      if let error = error {
        print("The icon's transition failed: \(error.localizedDescription)")
      } else {
        print("The Home Screen has been Polished.")
      }
    }
  }
}
