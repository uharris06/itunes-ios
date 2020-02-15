//
//  Repository.swift
//  music
//
//  Created by Ulises Harris on 14-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
import Moya

class Repository<T: TargetType>: NSObject {
  
  internal let api: MoyaProvider<T>
  
  init(api: MoyaProvider<T>) {
    self.api = api
    super.init()
  }
}
