//
//  Response.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation

struct Response<T: Codable>: Codable {
  let results: [T] = [T]()
  
  private enum CodingKeys: String, CodingKey {
    case results
  }
}
