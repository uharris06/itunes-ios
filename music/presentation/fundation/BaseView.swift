//
//  BaseView.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import UIKit

protocol BaseView: class {
  func getViewController() -> UIViewController
  func showLoading()
  func hideLoading()
  func showSimpleAlert(message: String)
}
