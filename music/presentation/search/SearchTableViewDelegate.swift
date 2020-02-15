//
//  SearchTableViewDelegate.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
import UIKit

class SearchTableViewDelegate: NSObject, UITableViewDelegate {
  
  var isLoading = false
  
  var onSearchSelected: ((_ index: Int) -> Void)
  var onLoadMoreData: (() -> Void)
  
  init(onSearchSelected: @escaping ((_ index: Int) -> Void), onLoadMoreData: @escaping (() -> Void)) {
    self.onSearchSelected = onSearchSelected
    self.onLoadMoreData = onLoadMoreData
    super.init()
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    onSearchSelected(indexPath.row)
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.section == 0 {
        return 150
    } else {
        return 55
    }
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let offsetY = scrollView.contentOffset.y
    let contentHeight = scrollView.contentSize.height
    let scrollViewFrame = scrollView.frame.size.height
    let difference = contentHeight - scrollViewFrame
    if (offsetY > difference) && !isLoading {
      onLoadMoreData()
    }
  }
}
