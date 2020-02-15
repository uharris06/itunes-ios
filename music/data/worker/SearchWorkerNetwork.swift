//
//  SearchWorker.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation

class SearchWorkerNetwork: Repository<ItunesMusicApi>, SearchWorker {
  func fetchSearch(term: String, offset: Int = 0, completion: @escaping ([Search]?, String?) -> Void){
    api.request(ItunesMusicApi.search(term: term, offset: offset)){ response in
      do {
        let result = try response.get()
        if result.statusCode <= 300 {
          let decoder = JSONDecoder()
          let response = try decoder.decode(Response<Search>.self, from: result.data)
          completion(response.results, nil)
        } else {
          completion(nil, "Término no encontrado")
        }
      } catch let error {
        print(error)
        completion(nil, "Ha ocurrido un error intente de nuevo")
      }
    }
  }
}
