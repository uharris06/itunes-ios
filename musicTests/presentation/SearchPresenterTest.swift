//
//  SearchPresenterTest.swift
//  musicTests
//
//  Created by Ulises Harris on 16-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Quick
import Nimble
@testable import music

class SearchPresenterTest: QuickSpec {
  override func spec() {
    describe("Search Presenter Test") {
      var stubView: StubSearchView!
      var stubSearchRepositoryNetwork: StubSearchRepositoryNetwork!
      var presenter: SearchPresenter!
      
      beforeEach {
        stubView = StubSearchView()
        stubSearchRepositoryNetwork = StubSearchRepositoryNetwork()
        presenter = SearchPresenter(searchRepositoryNetwork: stubSearchRepositoryNetwork)
        presenter.attachView(view: stubView)
      }
      
      it("It should call searchesSuccessfully when searches are retrieved") {
        presenter.fetchSearch(term: "")
        expect(stubView.searchSuccesfullyCalled).to(beTrue())
      }
      
      it("It should call showAlert when searches is retrieved empty or with error") {
        stubSearchRepositoryNetwork.statusCode = 500
        presenter.fetchSearch(term: "")
        expect(stubView.searchSuccesfullyCalled).to(beFalse())
        expect(stubView.showAlertCalled).to(beTrue())
      }
      
      it("It should call goToCollectionVC when a search is clicked") {
        presenter.onItemClicked(search: Factory.makeSearch(count: 1))
        expect(stubView.goToCollectionVCSuccesfullyCalled).to(beTrue())
      }
    }
  }
}
