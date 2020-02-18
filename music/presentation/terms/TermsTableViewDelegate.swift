//
//  TermsTableViewDelegate.swift
//  music
//
//  Created by Ulises Harris on 18-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
import UIKit

class TermsTableViewDelegate: NSObject, UITableViewDelegate {
  
  var onTermSelected: ((_ index: Int) -> Void)
  
  init(onTermSelected: @escaping ((_ index: Int) -> Void)) {
    self.onTermSelected = onTermSelected
    super.init()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    onTermSelected(indexPath.row)
  }
}
