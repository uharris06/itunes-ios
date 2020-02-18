//
//  StubNetworkManager.swift
//  musicTests
//
//  Created by Ulises Harris on 18-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
@testable import music

class StubNetworkManager: NetworkManager {
  
  var isConnected: Bool = true
  
  override func isConnectedToInternet() -> Bool {
    return isConnected
  }
}
