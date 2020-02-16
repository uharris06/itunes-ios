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
  
  init(searchRepositoryNetwork: SearchRepositoryNetwork) {
    self.searchRepositoryNetwork = searchRepositoryNetwork
  }
  
  func fetchSearch(term: String, offset: Int = 0) {
    searchRepositoryNetwork.fetchSearch(term: term, offset: offset) { (response, error) in
      if let searches = response {
        self.view?.searchesSuccessfully(searches)
      } else {
        self.view?.showSimpleAlert(message: error ?? "")
      }
    }
  }
  
  func onItemClicked(search: Search) {
    self.view?.goToCollectionVC(search: search)
  }
}
