//
//  Search.swift
//  music
//
//  Created by Ulises Harris on 14-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
import Moya

struct Search: Decodable {
  let trackId: Int
  let artistName: String
  let collectionName: String
  let trackName: String
  let imageUrl: String
  let url: String
  
  private enum CodingKeys: String, CodingKey {
    case trackId
    case artistName
    case collectionName
    case trackName
    case imageUrl = "artworkUrl100"
    case url = "collectionViewUrl"
  }
}
