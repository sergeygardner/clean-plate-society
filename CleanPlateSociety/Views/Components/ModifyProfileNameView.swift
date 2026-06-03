//
//  ModifyProfileNameView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 10.04.2026.
//

import SwiftUI

struct ModifyProfileNameView: View {
  @Binding var name: String

  var body: some View {
    HStack(alignment: .top) {
      Image(systemName: "person.fill")
        .foregroundStyleTheme(.icon)
        .padding(.top, 3)

      TextField(text: $name) {
        Text("profile.create.form.name.text")
          .foregroundStyleTheme(.text)
      }
      .onChange(of: name) { oldValue, newValue in
        if newValue.count > AppConfigDTO.maxCharacterLimit {
          name = String(newValue.prefix(AppConfigDTO.maxCharacterLimit))
        }
      }
    }
    .alignmentGuide(.listRowSeparatorLeading) { d in d[.leading] }
  }
}

#Preview("EnglishFormalLight") {
  @Previewable @State var name: String = ""

  PreviewContainerView {
    Form {
      ModifyProfileNameView(name: $name)
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishRoyalLight") {
  @Previewable @State var name: String = ""

  PreviewContainerView {
    Form {
      ModifyProfileNameView(name: $name)
        .environmentObject(Profile.sampleRoyalLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishForestLight") {
  @Previewable @State var name: String = ""

  PreviewContainerView {
    Form {
      ModifyProfileNameView(name: $name)
        .environmentObject(Profile.sampleForestLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishHarvestLight") {
  @Previewable @State var name: String = ""

  PreviewContainerView {
    Form {
      ModifyProfileNameView(name: $name)
        .environmentObject(Profile.sampleHarvestLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishMidnightLight") {
  @Previewable @State var name: String = ""

  PreviewContainerView {
    Form {
      ModifyProfileNameView(name: $name)
        .environmentObject(Profile.sampleMidnightLow)
        .preferredColorScheme(.light)
    }
  }
}
