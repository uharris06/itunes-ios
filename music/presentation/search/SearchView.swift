//
//  SearchView.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation

protocol SearchView: BaseView {
  func searchesSuccessfully(_ searches: [Search])
  func goToCollectionVC(search: Search)
}

protocol SearchActionListener {
  func fetchSearch(term: String, offset: Int)
  func onItemClicked(search: Search)
}
