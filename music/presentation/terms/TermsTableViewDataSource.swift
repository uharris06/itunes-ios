//
//  TermsTableViewDataSource.swift
//  music
//
//  Created by Ulises Harris on 18-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation

import UIKit

class TermsTableViewDataSource: NSObject, UITableViewDataSource {
  var terms = [String]()
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return terms.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let term = self.terms[indexPath.row]
    
    if let cell = tableView.dequeueReusableCell(withIdentifier: "TermsTableViewCellIdentifier", for: indexPath) as? TermsTableViewCell {
        cell.bind(term: term)
        return cell
    }
    return UITableViewCell()
  }
}
