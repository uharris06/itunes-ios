//
//  TermsView.swift
//  music
//
//  Created by Ulises Harris on 18-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation

protocol TermsView: BaseView {
  func fetchedTermsSuccesfully(terms: [String])
}

protocol TermsActionListener {
  func fetchTerms()
}
