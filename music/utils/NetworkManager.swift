//
//  NetworkManager.swift
//  music
//
//  Created by Ulises Harris on 17-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
  
  func isConnectedToInternet() -> Bool {
    return NetworkReachabilityManager()!.isReachable
  }
}
