//
//  FileRepository.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 12.05.2026.
//

import Foundation

protocol FileManagerProtocol {

}

class FileRepository {
  enum FileTypeEnum: String {
    case png = "png"
    case webp = "webp"
  }

  private let mainFolder: String
  private let fileManager: FileManager

  init(
    mainFolder: String = "Files",
    fileManager: FileManager = FileManager.default,
  ) {
    self.mainFolder = mainFolder
    self.fileManager = fileManager
  }

  func makeFolder(_ targetName: String) -> (URL?, FileErrorEnum?) {
    if let folderURL = prepareUrls(targetName) {
      if !fileManager.fileExists(atPath: folderURL.path) {
        do {
          try fileManager.createDirectory(at: folderURL, withIntermediateDirectories: true)

          return (folderURL, nil)
        } catch {
          return (nil, .core(error))
        }
      } else {
        return (folderURL, nil)
      }
    } else {
      return (nil, .core(nil))
    }
  }

  func save(_ dirname: String, _ data: Data, _ type: FileTypeEnum) -> (String?, FileErrorEnum?) {
    let (folderURL, error) = makeFolder(dirname)

    if error == nil, let folderURL = folderURL {
      let filename: String = "\(UUID().uuidString).\(type.rawValue)"

      do {
        try data.write(to: prpeareFilenameUrl(folderURL, filename))

        return (filename, nil)
      } catch {
        return (nil, .core(error))
      }
    } else {
      return (nil, error)
    }
  }

  func getFullPath(dirname: String, filename: String) -> (URL?, FileErrorEnum?) {
    let (folderURL, error) = makeFolder(dirname)

    if error == nil, let folderURL = folderURL {
      return (prpeareFilenameUrl(folderURL, filename), nil)
    } else {
      return (nil, error)
    }
  }

  private func prepareUrls(_ targetName: String) -> URL? {
    guard
      let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        .first
    else { return nil }

    return documentsURL.appendingPathComponent(targetName)
  }

  private func prpeareFilenameUrl(_ folderURL: URL, _ filename: String) -> URL {
    return folderURL.appendingPathComponent(filename)
  }
}

extension FileManager: FileManagerProtocol {

}
