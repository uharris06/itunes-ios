//
//  Response.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
import Moya

struct Response: Decodable {
  let resultCount: Int
  let results: [Search]
}
