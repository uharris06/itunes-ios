//
//  TermsPresenterTest.swift
//  musicTests
//
//  Created by Ulises Harris on 18-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Quick
import Nimble
@testable import music

class TermsPresenterTest: QuickSpec {
  override func spec() {
    describe("Terms Presenter Test") {
      var stubView: StubTermsView!
      var stubSearchRepositoryDatabase: StubSearchRepositoryDatabase!
      var stubSearchDao: StubSearchDao!
      var presenter: TermsPresenter!
        
      beforeEach {
        stubView = StubTermsView()
        stubSearchDao = StubSearchDao()
        stubSearchRepositoryDatabase = StubSearchRepositoryDatabase(dao: stubSearchDao)
        presenter = TermsPresenter(searchRepositoryDatabase: stubSearchRepositoryDatabase)
        presenter.attachView(view: stubView)
      }
        
      it("It should call fetchedTermsSuccesfully when terms are retrieved") {
        presenter.fetchTerms()
        expect(stubView.fetchedTermsSuccesfullyCalled).to(beTrue())
      }
    }
  }
}


