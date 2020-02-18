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
  var goToCollectionVCCalled = false
  var goToTermsVCCalled = false
  var showNoConnectionMessageCalled = false
  
  func searchesSuccessfully(_ searches: [Search]) {
    searchSuccesfullyCalled = true
  }
  
  func goToCollectionVC(search: Search) {
    goToCollectionVCCalled = true
  }
  
  func gotToTermsVC() {
    goToTermsVCCalled = true
  }
  
  func showNoConnectionMessage() {
    showNoConnectionMessageCalled = true
  }
}
