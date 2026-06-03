//
//  RulesView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 09.04.2026.
//

import SwiftUI

struct RulesView: View {
  @State var viewModel: ViewModel = ViewModel()

  var body: some View {
    ScrollView {
      VStack {
        SocietyHeaderView()

        Text(
          "society.rules.name",
          tableName: TranslationTableEnum.society.rawValue
        )
        .padding(.horizontal)
        .fontTheme(.title2)
        .foregroundStyleTheme(.text)

        Text(
          "society.rules.description",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.caption)
        .foregroundStyleTheme(.text)
        .padding(.vertical, 5)
        .padding(.horizontal, 20)
      }

      HStack {
        Text("I.")
          .fontTheme(.body)
          .foregroundStyleTheme(.text)
        Text(
          "society.rules.section1.name",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 20)
      .padding(.top, 10)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.viewfinder")
          .foregroundStyleTheme(.icon).padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section1.rule1",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 30)
      .padding(.top, 1)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.viewfinder")
          .foregroundStyleTheme(.icon).padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section1.rule2",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 30)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.viewfinder")
          .foregroundStyleTheme(.icon).padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section1.rule3",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 30)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack {
        Text("II.")
          .fontTheme(.body)
          .foregroundStyleTheme(.text)
        Text(
          "society.rules.section2.name",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 20)
      .padding(.top, 10)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section2.rule1",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 30)
      .padding(.top, 1)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section2.rule2",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 30)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section2.rule3",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 30)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack {
        Text("III.")
          .fontTheme(.body)
          .foregroundStyleTheme(.text)
        Text(
          "society.rules.section3.name",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 20)
      .padding(.top, 10)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section3.rule1",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 30)
      .padding(.top, 1)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section3.rule2",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 30)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section3.rule3",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 30)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.circle.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section3.rule3.part1",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 60)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.circle.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section3.rule3.part2",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 60)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.circle.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section3.rule3.part3",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 60)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section3.rule4",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 30)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.circle.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section3.rule4.part1",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 60)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.circle.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section3.rule4.part2",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 60)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.circle.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section3.rule4.part3",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 60)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack {
        Text("IV.")
          .fontTheme(.body)
          .foregroundStyleTheme(.text)
        Text(
          "society.rules.section4.name",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 20)
      .padding(.top, 10)
      .frame(maxWidth: .infinity, alignment: .leading)

      ForEach(AwardEnum.allCases, id: \.self) { award in
        if let title = viewModel.awardTitleRepository.find(
          id: award
        ) {
          HStack(alignment: .top) {
            Image(systemName: "dot.viewfinder")
              .padding(.top, 3)
              .foregroundStyleTheme(.icon)

              .padding(.top, 3)
            Text(title)
              .fontTheme(.body)
              .foregroundStyleTheme(.text)
          }
          .padding(.horizontal, 30)
          .frame(maxWidth: .infinity, alignment: .leading)
        }
      }

      if let title = viewModel.societyRepository.chancellorName() {
        HStack(alignment: .top) {
          Image(systemName: "dot.viewfinder")
            .padding(.top, 3)
            .foregroundStyleTheme(.icon)

            .padding(.top, 3)
          Text(title)
            .fontTheme(.body)
            .foregroundStyleTheme(.text)
        }
        .padding(.horizontal, 30)
        .frame(maxWidth: .infinity, alignment: .leading)
      }

      HStack {
        Text("V.")
          .fontTheme(.body)
          .foregroundStyleTheme(.text)
        Text(
          "society.rules.section5.name",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 20)
      .padding(.top, 10)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section5.rule1",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 30)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack {
        Text("VI.")
          .fontTheme(.body)
          .foregroundStyleTheme(.text)
        Text(
          "society.rules.section6.name",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 20)
      .padding(.top, 10)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section6.rule1",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 30)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.circle.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section6.rule1.part1",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 60)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.circle.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section6.rule1.part2",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 60)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.circle.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section6.rule1.part3",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 60)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section6.rule2",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 30)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.circle.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section6.rule2.part1",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 60)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.circle.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section6.rule2.part2",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 60)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.circle.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section6.rule2.part3",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 60)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section6.rule3",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 30)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.circle.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section6.rule3.part1",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 60)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.circle.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section6.rule3.part2",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 60)
      .frame(maxWidth: .infinity, alignment: .leading)

      HStack(alignment: .top) {
        Image(systemName: "dot.circle.viewfinder")
          .foregroundStyleTheme(.icon)
          .padding(.top, 3)
          .padding(.top, 3)
        Text(
          "society.rules.section6.rule3.part3",
          tableName: TranslationTableEnum.society.rawValue
        )
        .fontTheme(.body)
        .foregroundStyleTheme(.text)
      }
      .padding(.horizontal, 60)
      .frame(maxWidth: .infinity, alignment: .leading)
    }
    .padding(.bottom, AppConfigDTO.viewScrollBottomPadding)
    .navigationTitle(viewModel.societyRepository.rulesIntroductionTitle() ?? "")
  }
}

#Preview("EnglishFormalLight") {
  PreviewContainerView {
    RulesView()
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishRoyalLight") {
  PreviewContainerView {
    RulesView()
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishForestLight") {
  PreviewContainerView {
    RulesView()
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishHarvestLight") {
  PreviewContainerView {
    RulesView()
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishMidnightLight") {
  PreviewContainerView {
    RulesView()
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalDark") {
  PreviewContainerView {
    RulesView()
      .environmentObject(Profile.sampleFormalLow)
      .preferredColorScheme(.dark)
  }
}

#Preview("EnglishRoyalDark") {
  PreviewContainerView {
    RulesView()
      .environmentObject(Profile.sampleRoyalLow)
      .preferredColorScheme(.dark)
  }
}

#Preview("EnglishForestDark") {
  PreviewContainerView {
    RulesView()
      .environmentObject(Profile.sampleForestLow)
      .preferredColorScheme(.dark)
  }
}

#Preview("EnglishHarvestDark") {
  PreviewContainerView {
    RulesView()
      .environmentObject(Profile.sampleHarvestLow)
      .preferredColorScheme(.dark)
  }
}

#Preview("EnglishMidnightDark") {
  PreviewContainerView {
    RulesView()
      .environmentObject(Profile.sampleMidnightLow)
      .preferredColorScheme(.dark)
  }
}
