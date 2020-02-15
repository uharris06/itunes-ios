//
//  SearchViewController.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController<SearchPresenter>, SearchView {
  
  @IBOutlet var searchTableView: UITableView!
  
  var term: String = ""
  var offset: Int = 0
  
  let searchController = UISearchController(searchResultsController: nil)
  var isSearchBarEmpty: Bool {
    return searchController.searchBar.text?.isEmpty ?? true
  }
  
  var dataSource: SearchTableViewDataSource?
  var delegate: SearchTableViewDelegate?

  override func viewDidLoad() {
    super.viewDidLoad()
    searchController.searchResultsUpdater = self
    searchController.searchBar.delegate = self
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Search"
    navigationItem.searchController = searchController
    definesPresentationContext = true
    
    dataSource = SearchTableViewDataSource()
    delegate = SearchTableViewDelegate(onSearchSelected: { (index) in
    }, onLoadMoreData: {
      if !(self.delegate?.isLoading ?? false) {
        if !self.term.isEmpty {
          self.delegate?.isLoading = true
          self.offset += 1
          self.presenter.fetchSearch(term: self.term, offset: self.offset)
        }
      }
    })
    
    searchTableView.dataSource = dataSource
    searchTableView.delegate = delegate
  }
  
  func searchesSuccessfully(_ searches: [Search]) {
    dataSource?.searchList.append(contentsOf: searches)
    searchTableView.reloadData()
    self.delegate?.isLoading = false
  }
}

extension SearchViewController: UISearchResultsUpdating, UISearchBarDelegate {
  func updateSearchResults(for searchController: UISearchController) {
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    term = searchBar.text ?? ""
    offset = 0
    presenter.fetchSearch(term: term)
    dataSource?.searchList.removeAll()
  }
}
