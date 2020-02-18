//
//  TermsViewController.swift
//  music
//
//  Created by Ulises Harris on 18-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import UIKit

protocol TermsViewControllerDelegate {
  func termSelected(term: String)
}

class TermsViewController: BaseViewController<TermsPresenter>, TermsView {

  @IBOutlet var termsTableView: UITableView!
  
  var termViewControllerDelegate: TermsViewControllerDelegate?
  var dataSource: TermsTableViewDataSource?
  var delegate: TermsTableViewDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dataSource = TermsTableViewDataSource()
    delegate = TermsTableViewDelegate(onTermSelected: { (index) in
      self.termViewControllerDelegate?.termSelected(term: self.dataSource?.terms[index] ?? "")
      self.wireframe.popCurrentScreen()
    })
    
    termsTableView.dataSource = dataSource
    termsTableView.delegate = delegate
    
    presenter.fetchTerms()
  }
  
  func fetchedTermsSuccesfully(terms: [String]) {
    dataSource?.terms = terms
    termsTableView.reloadData()
  }
}
