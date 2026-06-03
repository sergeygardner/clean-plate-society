//
//  SocietyRepository.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 29.03.2026.
//

import Foundation

struct SocietyRepository: Sendable {
  private let table: TranslationTableEnum
  private let translationRepository: TranslationRepositoryProtocol

  init(
    table: TranslationTableEnum = TranslationTableEnum.society,
    translationRepository: TranslationRepositoryProtocol = TranslationRepository()
  ) {
    self.table = table
    self.translationRepository = translationRepository
  }

  func name() -> String? {
    return find(id: "society.name")
  }

  func slogan() -> String? {
    return find(id: "society.slogan")
  }

  func sloganLating() -> String? {
    return find(id: "society.slogan.latin")
  }

  func chancellorSignedAndSealed() -> String? {
    return find(id: "society.chancellor.signed.and.sealed")
  }

  func chancellorName() -> String? {
    return find(id: "society.chancellor.name")
  }

  func tutorialStage1Text() -> String? {
    return find(id: "society.tutorial.stage1.text")
  }

  func tutorialStage1Button() -> String? {
    return find(id: "society.tutorial.stage1.button.text")
  }

  func tutorialStage2Title() -> String? {
    return find(id: "society.tutorial.stage2.title")
  }

  func tutorialStage2Description() -> String? {
    return find(id: "society.tutorial.stage2.description")
  }

  func tutorialStage2Note() -> String? {
    return find(id: "society.tutorial.stage2.note")
  }

  func tutorialStage2Button() -> String? {
    return find(id: "society.tutorial.stage2.button.text")
  }

  func tutorialStage3Title() -> String? {
    return find(id: "society.tutorial.stage3.title")
  }

  func tutorialStage3Description1() -> String? {
    return find(id: "society.tutorial.stage3.description1")
  }

  func tutorialStage3Description2() -> String? {
    return find(
      id: "society.tutorial.stage3.description2", placeholder: StickerEnum.allValuesExceptStandard)
  }

  func tutorialStage3Button() -> String? {
    return find(id: "society.tutorial.stage3.button.text")
  }

  func tutorialStage4Title() -> String? {
    return find(id: "society.tutorial.stage4.title")
  }

  func tutorialStage4Description() -> String? {
    return find(id: "society.tutorial.stage4.description")
  }

  func tutorialStage4Note() -> String? {
    return find(id: "society.tutorial.stage4.note")
  }

  func tutorialStage4Button() -> String? {
    return find(id: "society.tutorial.stage4.button.text")
  }

  func difficultyLevelTitle(difficultyLevel: DifficultyLevelEnum) -> String? {
    return find(id: "society.difficulty.level.\(difficultyLevel.name).title")
  }

  func difficultyLevelLabel(difficultyLevel: DifficultyLevelEnum) -> String? {
    return find(id: "society.difficulty.level.\(difficultyLevel.name).label")
  }

  func difficultyLevelNote(difficultyLevel: DifficultyLevelEnum) -> String? {
    return find(id: "society.difficulty.level.\(difficultyLevel.name).note")
  }

  func difficultyLevelDescription(difficultyLevel: DifficultyLevelEnum) -> String? {
    return find(id: "society.difficulty.level.\(difficultyLevel.name).description")
  }

  func themeTitle(theme: Theme) -> String? {
    return find(id: "society.theme.\(theme.name).title")
  }

  func themeDescription(theme: Theme) -> String? {
    return find(id: "society.theme.\(theme.name).description")
  }

  func buttonError() -> String? {
    return find(id: "society.button.error")
  }

  func buttonClear() -> String? {
    return find(id: "society.button.clear")
  }

  func buttonAgree() -> String? {
    return find(id: "society.button.agree")
  }

  func stickersOutOfDataTitle1() -> String? {
    return find(id: "society.stickers.out.of.data.title1")
  }

  func stickersOutOfDataTitle2() -> String? {
    return find(id: "society.stickers.out.of.data.title2")
  }

  func stickersOutOfDataNote() -> String? {
    return find(id: "society.stickers.out.of.data.note")
  }

  func stickersOutOfDataDescription1(name: String) -> AttributedString? {
    return findMarkDowned(id: "society.stickers.out.of.data.description1", placeholder: name)
  }

  func stickersOutOfDataDescription2() -> String? {
    return find(id: "society.stickers.out.of.data.description2")
  }

  func stickersOutOfDataFootnote() -> String? {
    return find(id: "society.stickers.out.of.data.footnote")
  }

  func stickersOutOfDataEngagement() -> String? {
    return find(id: "society.stickers.out.of.data.engagement")
  }

  func stickerOath() -> String? {
    return find(id: "society.sticker.oath")
  }

  func stickerDownloadOath() -> String? {
    return find(id: "society.sticker.download.oath")
  }

  func stickerUploadOath() -> String? {
    return find(id: "society.sticker.upload.oath")
  }

  func stickerHooked(sticker: StickerEnum) -> String? {
    return find(id: "society.sticker.\(sticker.name).hooked")
  }

  func stickerHook() -> AttributedString? {
    return findMarkDowned(id: "society.sticker.hook")
  }

  func stickerVibed(sticker: StickerEnum) -> String? {
    return find(id: "society.sticker.\(sticker.name).vibed")
  }

  func stickerVibe() -> AttributedString? {
    return findMarkDowned(id: "society.sticker.vibe")
  }

  func stickerNote(sticker: StickerEnum) -> String? {
    return find(id: "society.sticker.\(sticker.name).note")
  }

  func stickerTitle(sticker: StickerEnum) -> String? {
    return find(id: "society.sticker.\(sticker.name).title")
  }

  func stickerName(sticker: StickerEnum) -> String? {
    return find(id: "society.sticker.\(sticker.name).name")
  }

  func appointementTitle() -> String? {
    return find(id: "society.appointment.title")
  }

  func appointementEngagement() -> String? {
    return find(id: "society.appointment.engagement")
  }

  func greetings(_ name: String) -> AttributedString? {
    return findMarkDowned(id: "society.greetings", placeholder: name)
  }

  func nextAppointementTitle() -> String? {
    return find(id: "society.next.appointment.title")
  }

  func nextAppointementDescription1(name: String) -> AttributedString? {
    return findMarkDowned(id: "society.next.appointment.description1", placeholder: name)
  }

  func nextAppointementDescription2() -> AttributedString? {
    return findMarkDowned(id: "society.next.appointment.description2")
  }

  func nextAppointementDescription3() -> AttributedString? {
    return findMarkDowned(id: "society.next.appointment.description3")
  }

  func nextAppointementStatus() -> String? {
    return find(id: "society.next.appointment.status")
  }

  func errorTitle() -> String? {
    return find(id: "society.error.title")
  }

  func errorNote1() -> String? {
    return find(id: "society.error.note1")
  }

  func errorNote2() -> String? {
    return find(id: "society.error.note2")
  }

  func errorIntro() -> String? {
    return find(id: "society.error.intro")
  }

  func errorOutro() -> String? {
    return find(id: "society.error.outro")
  }

  func errorDescription() -> String? {
    return find(id: "society.error.description")
  }

  func errorHello() -> String? {
    return find(id: "society.error.hello")
  }

  func subscriptionIntroduction() -> AttributedString? {
    return findMarkDowned(id: "society.subscription.introduction")
  }

  func subscriptionIntroductionTitle() -> String? {
    return find(id: "society.subscription.introduction.title")
  }

  func subscriptionIntroductionNote() -> String? {
    return find(id: "society.subscription.introduction.note")
  }

  func rulesIntroduction() -> AttributedString? {
    return findMarkDowned(id: "society.rules.introduction")
  }

  func rulesIntroductionTitle() -> String? {
    return find(id: "society.rules.introduction.title")
  }

  func rulesIntroductionNote() -> String? {
    return find(id: "society.rules.introduction.note")
  }

  func ourPolicyIntroductionTitle() -> String? {
    return find(id: "society.our.introduction.title")
  }

  func supportIntroductionTitle() -> String? {
    return find(id: "society.support.introduction.title")
  }

  func termsOfUseIntroductionTitle() -> String? {
    return find(id: "society.terms.of.use.introduction.title")
  }

  func privacyPolicyIntroduction() -> AttributedString? {
    return findMarkDowned(id: "society.privacy.policy.introduction")
  }

  func privacyPolicyIntroductionTitle() -> String? {
    return find(id: "society.privacy.policy.introduction.title")
  }

  func privacyPolicyIntroductionNote() -> String? {
    return find(id: "society.privacy.policy.introduction.note")
  }

  func subscriptionTitle(_ subscription: SubscriptionEnum) -> String? {
    return find(id: "society.subscription.\(subscription.name).title")
  }

  func subscriptionDescription(_ subscription: SubscriptionEnum) -> String? {
    return find(id: "society.subscription.\(subscription.name).description")
  }

  func perkTitle(_ perk: PerkEnum) -> String? {
    return find(id: "society.perk.\(perk.rawValue).title")
  }

  func restorePurchase() -> String? {
    return find(id: "society.restore.purchase")
  }

  func legalPurchase() -> String? {
    return find(id: "society.legal.purchase")
  }

  private func find(id: String) -> String? {
    return translationRepository.findOrEmpty(id: id, table: table)
  }

  private func find(id: String, placeholder: String) -> String? {
    return translationRepository.findOrEmpty(id: id, table: table, arg1: placeholder)
  }

  private func findMarkDowned(id: String) -> AttributedString? {
    return translationRepository.findMarkDownedOrEmpty(id: id, table: table)
  }

  private func findMarkDowned(id: String, placeholder: String) -> AttributedString? {
    return translationRepository.findMarkDownedOrEmpty(id: id, table: table, arg1: placeholder)
  }
}
