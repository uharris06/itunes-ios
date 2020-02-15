//
//  BasePresenter.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation

class BasePresenter {

  internal weak var baseView: BaseView?

  init() {}

  func attachView<T: BaseView>(view: T) {
    self.baseView = view
  }
}
