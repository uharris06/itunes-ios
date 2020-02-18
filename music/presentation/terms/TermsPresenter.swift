//
//  File.swift
//  music
//
//  Created by Ulises Harris on 18-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation

class TermsPresenter: BasePresenter, TermsActionListener {
  
  private var view: TermsView? {
    return baseView as? TermsView
  }
  
  var searchRepositoryDatabase: SearchRepositoryDataBase!
  
  init(searchRepositoryDatabase: SearchRepositoryDataBase) {
    self.searchRepositoryDatabase = searchRepositoryDatabase
  }
  
  func fetchTerms() {
    view?.fetchedTermsSuccesfully(terms: searchRepositoryDatabase.fetchSearches().map({ $0.term }))
  }
}
