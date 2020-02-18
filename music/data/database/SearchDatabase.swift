//
//  SearchDatabase.swift
//  music
//
//  Created by Ulises Harris on 17-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
import RealmSwift

protocol SearchDatabase {
  func saveSearch(term: String, searches: [Search])
  
  func fetchSearches() -> [SearchRealm]
  
  func fetchItems(term: String) -> [Search]?
}
