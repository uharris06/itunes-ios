//
//  SearchRealm.swift
//  music
//
//  Created by Ulises Harris on 17-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
import RealmSwift

class ItemRealm: Object {
  @objc dynamic var trackId: Int = 0
  @objc dynamic var artistName: String = ""
  @objc dynamic var collectionName: String = ""
  @objc dynamic var trackName: String = ""
  @objc dynamic var imageUrl: String = ""
  @objc dynamic var url: String = ""
  @objc dynamic var previewUrl: String = ""
  
  override class func primaryKey() -> String? {
    return "trackId"
  }
}

extension ItemRealm {
  func fromItemRealmToSearch() -> Search {
    return Search(trackId: self.trackId, artistName: self.artistName, collectionName: self.collectionName, trackName: self.trackName, imageUrl: self.imageUrl, url: self.url, previewUrl: self.previewUrl)
  }
  
  func fromListItemRealmToSearches(itemsRealm: List<ItemRealm>) -> [Search] {
    var searchList = [Search]()
    for itemRealm in itemsRealm {
      searchList.append(itemRealm.fromItemRealmToSearch())
    }
    return searchList
  }
}
