//
//  SearchWorker.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation

protocol SearchRepository {
  func fetchSearch(term: String, offset: Int, completion: @escaping ([Search]?, String?) -> Void)
}
