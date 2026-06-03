//
//  CustomSnapshotHelper.swift
//  CleanPlateSocietyTests
//
//  Created by Sergey Gardner on 26.04.2026.
//

import Foundation
import SnapshotTesting
import SwiftUI
import Testing

@MainActor
public func assertCustomSnapshot<V: View>(
  _ suite: Any,
  of view: V,
  named: String = "",
  colorScheme: UIUserInterfaceStyle = .light,
  deviceConfig: ViewImageConfig = .iPhone13Pro,
  waitFor seconds: TimeInterval = 1,
  fileID: StaticString = #fileID,
  filePath: StaticString = #filePath,
  testName: String = #function,
  line: UInt = #line,
  column: UInt = #column,
) async {
  let structName = String(describing: type(of: suite))
  let finalSnapshotName = "\(structName).\(named)"
  let hostingController = UIHostingController(rootView: view)

  hostingController.overrideUserInterfaceStyle = colorScheme
  hostingController.view.backgroundColor = .systemBackground

  guard
    let activeScene =
      UIApplication.shared.connectedScenes
      .first(where: { $0.activationState == .foregroundActive })
      as? UIWindowScene
      ?? UIApplication.shared.connectedScenes.first as? UIWindowScene
  else {
    return
  }

  let window = UIWindow(windowScene: activeScene)

  window.frame = CGRect(origin: .zero, size: deviceConfig.size ?? .zero)
  window.overrideUserInterfaceStyle = colorScheme
  window.rootViewController = hostingController
  window.makeKeyAndVisible()
  window.layoutIfNeeded()
  hostingController.view.layoutIfNeeded()

  await Task.yield()
  try? await Task.sleep(for: .milliseconds(200))

  defer {
    window.isHidden = true
    window.rootViewController = nil
  }

  let snapshotStrategy: Snapshotting<UIViewController, UIImage> = .image(
    on: deviceConfig,
    drawHierarchyInKeyWindow: true,
    precision: 0.98,
    perceptualPrecision: 0.98
  )

  assertSnapshot(
    of: hostingController,
    as: .wait(for: seconds, on: snapshotStrategy),
    named: finalSnapshotName,
    record: .missing,
    fileID: fileID,
    file: filePath,
    testName: testName,
    line: line,
    column: column,
  )
}
