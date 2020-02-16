//
//  StubSearchView.swift
//  musicTests
//
//  Created by Ulises Harris on 16-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
@testable import music

class StubSearchView: StubBaseView, SearchView {
  
  var searchSuccesfullyCalled = false
  var goToCollectionVCSuccesfullyCalled = false
  
  func searchesSuccessfully(_ searches: [Search]) {
    searchSuccesfullyCalled = true
  }
  
  func goToCollectionVC(search: Search) {
    goToCollectionVCSuccesfullyCalled = true
  }
}
