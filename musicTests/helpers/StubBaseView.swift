//
//  StubBaseView.swift
//  musicTests
//
//  Created by Ulises Harris on 16-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import UIKit
@testable import music

class StubBaseView: BaseView {
  var showAlertCalled = false
  
  func getViewController() -> UIViewController {
    return UIViewController()
  }
  
  func showLoading() { }
  
  func hideLoading() { }
  
  func showSimpleAlert(message: String) {
    showAlertCalled = true
  }
}

