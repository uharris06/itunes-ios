//
//  SearchView.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation

class SearchPresenter: BasePresenter, SearchActionListener{
  
  private var view: SearchView? {
    return baseView as? SearchView
  }
  
  var searchRepositoryNetwork: SearchRepositoryNetwork!
  var searchRepositoryDatabase: SearchRepositoryDataBase!
  var networkManager: NetworkManager!
  
  init(searchRepositoryNetwork: SearchRepositoryNetwork, searchRepositoryDatabase: SearchRepositoryDataBase, networkManager: NetworkManager) {
    self.searchRepositoryNetwork = searchRepositoryNetwork
    self.searchRepositoryDatabase = searchRepositoryDatabase
    self.networkManager = networkManager
  }
  
  func fetchSearch(term: String, offset: Int = 0) {
    if networkManager.isConnectedToInternet() {
      searchRepositoryNetwork.fetchSearch(term: term, offset: offset) { (response, error) in
        if let searches = response {
          self.searchRepositoryDatabase.saveSearch(term: term, searches: searches)
          self.view?.searchesSuccessfully(searches)
        } else {
          self.view?.showSimpleAlert(message: error ?? "")
        }
      }
    } else {
      view?.showNoConnectionMessage()
    }
  }
  
  func fetchLocalSearch(term: String) {
    if let searches = searchRepositoryDatabase.fetchItems(term: term) {
      view?.searchesSuccessfully(searches)
    }
  }
  
  func onTermsConfirmed() {
    self.view?.gotToTermsVC()
  }
  
  func onItemClicked(search: Search) {
    self.view?.goToCollectionVC(search: search)
  }
}
