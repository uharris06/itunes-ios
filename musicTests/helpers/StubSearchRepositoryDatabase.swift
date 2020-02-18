//
//  StubSearchDao.swift
//  musicTests
//
//  Created by Ulises Harris on 18-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
@testable import music

class StubSearchRepositoryDatabase: SearchRepositoryDataBase {
  
  override func fetchSearches() -> [SearchRealm] {
    return [SearchRealm]()
  }
  
  override func fetchItems(term: String) -> [Search]? {
    return [Search]()
  }
  
  override func saveSearch(term: String, searches: [Search]) {}
}
