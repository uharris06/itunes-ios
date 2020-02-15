//
//  SearchTableViewDataSource.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
import UIKit

class SearchTableViewDataSource: NSObject, UITableViewDataSource {
  var searchList = [Search]()
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return searchList.count
    } else {
      return 1
    }
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      let search = self.searchList[indexPath.row]
    
      if let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCellIdentifier", for: indexPath) as? SearchTableViewCell {
        cell.bind(search: search)
        return cell
      }
      return UITableViewCell()
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "SearchAnimationTableViewCellIdentifier", for: indexPath) as! SearchAnimationTableViewCell
      if !self.searchList.isEmpty {
        cell.activityIndicator.isHidden = false
        cell.activityIndicator.startAnimating()
      } else {
        cell.activityIndicator.isHidden = true
      }
      return cell
    }
  }
}
