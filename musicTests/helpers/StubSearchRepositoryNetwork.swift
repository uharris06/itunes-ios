//
//  StubSearchRepositoryNetwork.swift
//  musicTests
//
//  Created by Ulises Harris on 16-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
@testable import music

class StubSearchRepositoryNetwork: SearchRepositoryNetwork {
  var statusCode = 200
  
  init() {
    super.init(api: StubRestApi<ItunesMusicApi>())
  }
  
  override func fetchSearch(term: String, offset: Int = 0, completion: @escaping ([Search]?, String?) -> Void) {
    if statusCode < 299 {
      completion(Factory.makeSearchList(count: 4), nil)
    } else {
      completion(nil, "")
    }
  }
}
