//
//  Factory.swift
//  musicTests
//
//  Created by Ulises Harris on 16-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
@testable import music

class Factory {
  
  class func makeSearch(count: Int) -> Search {
    return Search(trackId: count, artistName: "", collectionName: "", trackName: "", imageUrl: "", url: "")
  }
  
  class func makeSearchList(count: Int) -> [Search] {
    var searchList = [Search]()
    for index in 0..<count {
      searchList.append(makeSearch(count: index))
    }
    return searchList
  }
}
