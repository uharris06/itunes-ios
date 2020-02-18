//
//  CollectionPresenterTest.swift
//  musicTests
//
//  Created by Ulises Harris on 18-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Quick
import Nimble
@testable import music

class CollectionPresenterTest: QuickSpec {
  override func spec() {
    describe("Collection Presenter Test") {
      var stubView: StubCollectionView!
      var stubPlayManager: StubPlayManager!
      var presenter: CollectionPresenter!
      
      beforeEach {
        stubView = StubCollectionView()
        stubPlayManager = StubPlayManager()
        presenter = CollectionPresenter(playerManager: stubPlayManager)
        presenter.attachView(view: stubView)
      }
      
      it("It should call playPreviewCalled when play button is clicked") {
        presenter.onPlay(url: "")
        expect(stubView.playPreviewCalled).to(beTrue())
        expect(stubPlayManager.setUrlCalled).to(beTrue())
        expect(stubPlayManager.playCalled).to(beTrue())
      }
      
      it("It should call pausePreviewCalled when play button is clicked") {
        presenter.onPause()
        expect(stubView.pausePreviewCalled).to(beTrue())
        expect(stubPlayManager.pauseCalled).to(beTrue())
      }
    }
  }
}
