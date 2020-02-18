//
//  SearchRepositoryDataBase.swift
//  music
//
//  Created by Ulises Harris on 17-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
import RealmSwift

class SearchRepositoryDataBase: SearchDatabase {
  
  var dao: SearchDao!
  
  init(dao: SearchDao) {
    self.dao = dao
  }
  
  func saveSearch(term: String, searches: [Search]) {
    let searchRealm = SearchRealm()
    searchRealm.term = term
    searchRealm.searches = searches[0].fromSearchesToListSearch(searches: searches)
    dao.saveSearch(search: searchRealm)
  }
  
  func fetchSearches() -> [SearchRealm] {
    return dao.fetchSearches() ?? [SearchRealm]()
  }
  
  func fetchItems(term: String) -> [Search]? {
    if let searchRealm = dao.fetchItems(term: term)?.first {
      return searchRealm.searches[0].fromListItemRealmToSearches(itemsRealm: searchRealm.searches)
    }
    return nil
  }
}
