//
//  DataBaseManager.swift
//  music
//
//  Created by Ulises Harris on 17-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
import RealmSwift

class SearchDao {
  
  static let schemeVersion: UInt64 = 2

  let config = Realm.Configuration(
    schemaVersion: schemeVersion,
    migrationBlock: { migration, oldSchemaVersion in
      if (oldSchemaVersion < 1) {
      }
  })

  var realm: Realm {
    get {
      do {
        let realm = try Realm()
        return realm
      } catch {
        print("Could not access database: ", error)
      }
      return self.realm
    }
  }

  func migration() {
    Realm.Configuration.defaultConfiguration = config
  }
  
  func saveSearch(search: SearchRealm) {
    try? realm.write {
      realm.add(search, update: .modified)
    }
  }
  
  func fetchSearches() -> [SearchRealm]? {
    return realm.objects(SearchRealm.self).toArray(ofType: SearchRealm.self)
  }
  
  func fetchItems(term: String) -> [SearchRealm]? {
    let predicate = NSPredicate(format: "term = %@", term)
    return realm.objects(SearchRealm.self).filter(predicate).toArray(ofType: SearchRealm.self)
  }
  
  func deleteSearch(search: SearchRealm) {
    try? realm.write {
      realm.delete(search)
    }
  }
  
  func deleteAllSearch() {
    try? realm.write {
      realm.deleteAll()
    }
  }
}
