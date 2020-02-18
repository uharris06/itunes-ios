//
//  SearchRealm.swift
//  music
//
//  Created by Ulises Harris on 17-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
import RealmSwift

class SearchRealm: Object {
  @objc dynamic var term: String = ""
  var searches = List<ItemRealm>()
  
  override class func primaryKey() -> String? {
    return "term"
  }
}
