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
      var stubSearchDao: StubSearchDao!
      var stubNetworkManager: StubNetworkManager!
      var stubSearchRepositoryNetwork: StubSearchRepositoryNetwork!
      var stubSearchRepositoryDatabase: StubSearchRepositoryDatabase!
      var presenter: SearchPresenter!
      
      beforeEach {
        stubView = StubSearchView()
        stubNetworkManager = StubNetworkManager()
        stubSearchDao = StubSearchDao()
        stubSearchRepositoryNetwork = StubSearchRepositoryNetwork()
        stubSearchRepositoryDatabase = StubSearchRepositoryDatabase(dao: stubSearchDao)
        presenter = SearchPresenter(
          searchRepositoryNetwork: stubSearchRepositoryNetwork,
          searchRepositoryDatabase: stubSearchRepositoryDatabase,
          networkManager: stubNetworkManager)
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
        expect(stubView.goToCollectionVCCalled).to(beTrue())
      }
      
      it("It should call showNoConnectionMessageCalled when there is no internet") {
        stubNetworkManager.isConnected = false
        presenter.fetchSearch(term: "")
        expect(stubView.searchSuccesfullyCalled).to(beFalse())
        expect(stubView.showNoConnectionMessageCalled).to(beTrue())
      }
      
      it("It should call goToTermsVCCalled when the alert button ok is pressed") {
        stubNetworkManager.isConnected = false
        presenter.onTermsConfirmed()
        expect(stubView.goToTermsVCCalled).to(beTrue())
      }
      
      it("It should call searchesSuccessfully when searches are retrieved from local database") {
        stubNetworkManager.isConnected = false
        presenter.fetchLocalSearch(term: "")
        expect(stubView.searchSuccesfullyCalled).to(beTrue())
      }
    }
  }
}
