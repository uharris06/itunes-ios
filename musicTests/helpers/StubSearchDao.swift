//
//  StubSearchDao.swift
//  musicTests
//
//  Created by Ulises Harris on 18-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
@testable import music

class StubSearchDao: SearchDao {
  
  override func fetchSearches() -> [SearchRealm]? {
    return nil
  }
  
  override func fetchItems(term: String) -> [SearchRealm]? {
    return nil
  }
  
  override func saveSearch(search: SearchRealm) {}
  
  override func deleteAllSearch() {}
  
  override func deleteSearch(search: SearchRealm) {}
}
