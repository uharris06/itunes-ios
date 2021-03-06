//
//  SearchViewController.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController<SearchPresenter>, SearchView, TermsViewControllerDelegate {
  
  @IBOutlet var searchTableView: UITableView!
  
  var term: String = ""
  var offset: Int = 0
  
  let searchController = UISearchController(searchResultsController: nil)
  
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
      self.searchController.dismiss(animated: true) {
          self.presenter.onItemClicked(search: self.dataSource!.searchList[index])
      }
    }, onLoadMoreData: {
      if !(self.delegate?.isLoading ?? false) && NetworkManager().isConnectedToInternet() {
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
  
  func showNoConnectionMessage() {
    let positiveAction = UIAlertAction(title: "OK", style: .default) { _ in
      self.presenter.onTermsConfirmed()
    }
    let negativeAction = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
    self.showAlertMessage("En estos momentos no tiene internet. Desea ver búsquedas anteriores?", positiveAction: positiveAction, negativeAction: negativeAction)
  }
  
  func gotToTermsVC() {
    self.searchController.dismiss(animated: true) {
      self.wireframe.terms(termsViewControllerDelegate: self).show()
    }
  }
  
  func goToCollectionVC(search: Search) {
    wireframe.collection(search: search).show()
  }
  
  func termSelected(term: String) {
    searchController.searchBar.text = term
    presenter.fetchLocalSearch(term: term)
  }
}

extension SearchViewController: UISearchResultsUpdating, UISearchBarDelegate {
  func updateSearchResults(for searchController: UISearchController) {
  }
  
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    term = searchBar.text ?? ""
    offset = 0
    presenter.fetchSearch(term: term)
    scrollToTop()
    dataSource?.searchList.removeAll()
  }
  
  private func scrollToTop() {
      let topRow = IndexPath(row: 0,
                             section: 0)
    if !(dataSource?.searchList.isEmpty ?? false) {
      self.searchTableView.scrollToRow(at: topRow,
                                 at: .top,
                                 animated: true)
    }
  }
}
