//
//  OathView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 10.04.2026.
//

import SwiftUI

struct OathView: View {
  @State var viewModel: ViewModel = ViewModel()

  var name: String

  var body: some View {
    if !name.isEmpty,
      let oathText = viewModel.mainRepository.getOathText(
        name: name
      )
    {
      Section(
        header: Text("settings.oath")
          .fontTheme(.headline)
          .foregroundStyleTheme(.text)
      ) {
        VStack {
          Text(oathText)
            .fontTheme(.body)
            .foregroundStyleTheme(.text)
        }
      }
    }
  }
}

#Preview("EnglishLightNotEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "Text")
        .environmentObject(Profile.sampleEmpty)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishFormalLightNotEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "Text")
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishRoyalLightNotEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "Text")
        .environmentObject(Profile.sampleRoyalLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishForestLightNotEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "Text")
        .environmentObject(Profile.sampleForestLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishHarvestLightNotEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "Text")
        .environmentObject(Profile.sampleHarvestLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishMidnightLightNotEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "Text")
        .environmentObject(Profile.sampleMidnightLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishLightEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "")
        .environmentObject(Profile.sampleEmpty)
    }
  }
}

#Preview("EnglishFormalLightEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "")
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishRoyalLightEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "")
        .environmentObject(Profile.sampleRoyalLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishForestLightEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "")
        .environmentObject(Profile.sampleForestLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishHarvestLightEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "")
        .environmentObject(Profile.sampleHarvestLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishMidnightLightEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "")
        .environmentObject(Profile.sampleMidnightLow)
        .preferredColorScheme(.light)
    }
  }
}

#Preview("EnglishDarkNotEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "Text")
        .environmentObject(Profile.sampleEmpty)
        .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishFormalDarkNotEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "Text")
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishRoyalDarkNotEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "Text")
        .environmentObject(Profile.sampleRoyalLow)
        .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishForestDarkNotEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "Text")
        .environmentObject(Profile.sampleForestLow)
        .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishHarvestDarkNotEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "Text")
        .environmentObject(Profile.sampleHarvestLow)
        .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishMidnightDarkNotEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "Text")
        .environmentObject(Profile.sampleMidnightLow)
        .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishDarkEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "")
        .environmentObject(Profile.sampleEmpty)
        .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishFormalDarkEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "")
        .environmentObject(Profile.sampleFormalLow)
        .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishRoyalDarkEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "")
        .environmentObject(Profile.sampleRoyalLow)
        .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishForestDarkEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "")
        .environmentObject(Profile.sampleForestLow)
        .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishHarvestDarkEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "")
        .environmentObject(Profile.sampleHarvestLow)
        .preferredColorScheme(.dark)
    }
  }
}

#Preview("EnglishMidnightDarkEmpty") {
  PreviewContainerView {
    Form {
      OathView(name: "")
        .environmentObject(Profile.sampleMidnightLow)
        .preferredColorScheme(.dark)
    }
  }
}
