//
//  AudienceListView.swift
//  CleanPlateSociety
//
//  Created by Sergey Gardner on 11.03.2026.
//

import SwiftData
import SwiftUI

struct AudienceListView<Content: View>: View {
  @EnvironmentObject var profile: Profile
  @Query var stickerModels: [StickerModel]

  var viewModel: AudienceView.ViewModel
  var sticker: StickerEnum
  var profileModelDTO: ProfileModelDTO
  let useScrollTransition: Bool
  let asyncScrolling: Bool
  let testing: Bool
  var overlayView: (_ index: Int, _ width: CGFloat, _ height: CGFloat) -> Content

  init(
    viewModel: AudienceView.ViewModel,
    sticker: StickerEnum,
    profileModelDTO: ProfileModelDTO,
    useScrollTransition: Bool = true,
    asyncScrolling: Bool = true,
    testing: Bool = false,
    @ViewBuilder overlayView:
      @escaping (_ index: Int, _ width: CGFloat, _ height: CGFloat) ->
      Content
  ) {
    self.viewModel = viewModel
    self.sticker = sticker
    self.profileModelDTO = profileModelDTO
    self.useScrollTransition = useScrollTransition
    self.asyncScrolling = asyncScrolling
    self.testing = testing

    let unwrappedStickerRawValue: String = sticker.rawValue
    var descriptor: FetchDescriptor<StickerModel> = FetchDescriptor<StickerModel>()

    descriptor.predicate = #Predicate<StickerModel> { sticker in
      sticker.stickerRawValue == unwrappedStickerRawValue
    }
    descriptor.sortBy = [
      SortDescriptor(\.index, order: .forward)
    ]

    _stickerModels = Query(descriptor)

    self.overlayView = overlayView
  }

  var body: some View {
    if viewModel.canUseStickers(stickerModels.count, sticker) {
      ScrollViewReader { proxy in
        GeometryReader { geo in
          ScrollView {
            if testing {
              VStack(spacing: 10) {
                contentView(geo: geo)
              }
              .padding(.horizontal)
            } else {
              LazyVStack(spacing: 10) {
                contentView(geo: geo)
              }
              .padding(.horizontal)
            }
          }
          .onAppear {
            onModify(proxy: proxy)
          }
        }
      }
    } else {
      VStack(spacing: 10) {
        StickerView(
          sticker: sticker
        ) {
          let bindingSticker: Binding<StickerEnum> = Binding(
            get: { sticker },
            set: { profile.setSticker($0) }
          )

          StickerChooserView(
            sticker: bindingSticker,
            withSpacer: false
          )
        }
      }
    }
  }

  private func onModify(proxy: ScrollViewProxy) {
    let callback: () -> Void = {
      if useScrollTransition {
        var transaction: Transaction = Transaction()
        transaction.disablesAnimations = true

        withTransaction(transaction) {
          proxy.scrollTo(viewModel.currentIndex, anchor: .top)
        }
      } else {
        proxy.scrollTo(viewModel.currentIndex, anchor: .top)
      }
    }

    if asyncScrolling {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
        let _ = callback()
      }
    } else {
      let _ = callback()
    }
  }

  @ViewBuilder private func contentView(
    geo: GeometryProxy
  ) -> some View {
    ForEach(
      Array(stickerModels.enumerated()),
      id: \.offset
    ) {
      index,
      stickerModel in

      ZStack {
        if viewModel.showOverlay(index) {
          overlayView(index, geo.size.width, geo.size.height)
            .frame(width: geo.size.width, height: geo.size.height)
            .id(index)
            .transition(
              .blurReplace
            )
        } else {
          StickerContentView(
            filename: stickerModel.filename,
            sticker: sticker,
          )
          .frame(width: geo.size.width, height: geo.size.height)
          .blur(
            radius: viewModel.applyBlur(index)
          )
          .opacity(
            viewModel.applyOpacity(index)
          )
          .animation(.default, value: viewModel.canApplyAnimation(index))
          .transition(.blurReplace)
          .id(index)
          .padding(.horizontal)
        }
      }
      .frame(height: geo.size.height)
    }

    let index: Int = stickerModels.count

    overlayView(index, geo.size.width, geo.size.height)
      .frame(width: geo.size.width, height: geo.size.height)
      .id(index)
  }
}

#Preview("EnglishFormalLightWithData") {
  @Previewable @State var sticker: StickerEnum = StickerEnum.standard
  @Previewable @State var viewModel: AudienceView.ViewModel = AudienceView.ViewModel()

  PreviewContainerView {
    NavigationStack {
      AudienceListView(
        viewModel: viewModel,
        sticker: sticker,
        profileModelDTO: Profile.sampleFormalLow.profileModelDTO!
      ) { index, width, height in
        let _ = print("\(index)")
      }
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightWithAlmostData") {
  @Previewable @State var sticker: StickerEnum = StickerEnum.standard
  @Previewable @State var viewModel: AudienceView.ViewModel = AudienceView.ViewModel()

  PreviewContainerView(
    PreviewContainerView.Samples(
      entry: PreviewContainerView.sampleEntryAlmost
    )
  ) {
    NavigationStack {
      AudienceListView(
        viewModel: viewModel,
        sticker: sticker,
        profileModelDTO: Profile.sampleFormalLow.profileModelDTO!
      ) { index, width, height in
        let _ = print("\(index)")
      }
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightWithHalfData") {
  @Previewable @State var sticker: StickerEnum = StickerEnum.standard
  @Previewable @State var viewModel: AudienceView.ViewModel = AudienceView.ViewModel()

  PreviewContainerView(PreviewContainerView.Samples.entryHalf) {
    NavigationStack {
      AudienceListView(
        viewModel: viewModel,
        sticker: sticker,
        profileModelDTO: Profile.sampleFormalLow.profileModelDTO!
      ) { index, width, height in
        let _ = print("\(index)")
      }
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightWithAlmdostDataUnlockedAward") {
  @Previewable @State var sticker: StickerEnum = StickerEnum.standard
  @Previewable @State var viewModel: AudienceView.ViewModel = AudienceView.ViewModel()

  PreviewContainerView(
    PreviewContainerView.Samples(
      award: PreviewContainerView.Sample(
        from: 0,
        to: 8,
      ),
      entry: PreviewContainerView.Sample(
        from: EntryModel.sampleData.count
          - AwardEnum.level10.requirement,
        to: EntryModel.sampleData.count - 2,
      ),
    )
  ) {
    NavigationStack {
      AudienceListView(
        viewModel: viewModel,
        sticker: sticker,
        profileModelDTO: Profile.sampleFormalLow.profileModelDTO!
      ) { index, width, height in
        let _ = print("\(index)")
      }
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalLightWithoutData") {
  @Previewable @State var sticker: StickerEnum = StickerEnum.standard
  @Previewable @State var viewModel: AudienceView.ViewModel = AudienceView.ViewModel()

  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      AudienceListView(
        viewModel: viewModel,
        sticker: sticker,
        profileModelDTO: Profile.sampleFormalLow.profileModelDTO!
      ) { index, width, height in
        let _ = print("\(index)")
      }
    }

    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.light)
  }
}

#Preview("EnglishFormalDarkWithData") {
  @Previewable @State var sticker: StickerEnum = StickerEnum.standard
  @Previewable @State var viewModel: AudienceView.ViewModel = AudienceView.ViewModel()

  PreviewContainerView {
    NavigationStack {
      AudienceListView(
        viewModel: viewModel,
        sticker: sticker,
        profileModelDTO: Profile.sampleFormalLow.profileModelDTO!
      ) { index, width, height in
        let _ = print("\(index)")
      }
    }
    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.dark)
  }
}

#Preview("EnglishFormalDarkWithoutData") {
  @Previewable @State var sticker: StickerEnum = StickerEnum.standard
  @Previewable @State var viewModel: AudienceView.ViewModel = AudienceView.ViewModel()

  PreviewContainerView(PreviewContainerView.Samples.empty) {
    NavigationStack {
      AudienceListView(
        viewModel: viewModel,
        sticker: sticker,
        profileModelDTO: Profile.sampleFormalLow.profileModelDTO!
      ) { index, width, height in
        let _ = print("\(index)")
      }
    }

    .environmentObject(Profile.sampleFormalLow)
    .preferredColorScheme(.dark)
  }
}
