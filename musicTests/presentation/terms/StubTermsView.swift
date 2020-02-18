
//
//  StubTermsView.swift
//  musicTests
//
//  Created by Ulises Harris on 18-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
@testable import music

class StubTermsView: StubBaseView, TermsView {
  
  var fetchedTermsSuccesfullyCalled = false
  
  func fetchedTermsSuccesfully(terms: [String]) {
    fetchedTermsSuccesfullyCalled = true
  }
}
