//
//  Search.swift
//  music
//
//  Created by Ulises Harris on 14-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
import Moya
import RealmSwift

struct Search: Decodable {
  let trackId: Int
  let artistName: String
  let collectionName: String
  let trackName: String
  let imageUrl: String
  let url: String
  let previewUrl: String
  
  private enum CodingKeys: String, CodingKey {
    case trackId
    case artistName
    case collectionName
    case trackName
    case imageUrl = "artworkUrl100"
    case url = "collectionViewUrl"
    case previewUrl
  }
}

extension Search {
  func fromSearchToItemReal() -> ItemRealm {
    let itemRealm = ItemRealm()
    itemRealm.trackId = self.trackId
    itemRealm.artistName = self.artistName
    itemRealm.collectionName = self.collectionName
    itemRealm.trackName = self.trackName
    itemRealm.imageUrl = self.imageUrl
    itemRealm.url = self.url
    itemRealm.previewUrl = self.previewUrl
    return itemRealm
  }
  
  func fromSearchesToListSearch(searches: [Search]) -> List<ItemRealm> {
    let searchRealmList = List<ItemRealm>()
    for search in searches {
      searchRealmList.append(search.fromSearchToItemReal())
    }
    return searchRealmList
  }
}
