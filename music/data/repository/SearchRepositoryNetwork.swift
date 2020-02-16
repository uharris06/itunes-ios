//
//  SearchWorker.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation

class SearchRepositoryNetwork: Repository<ItunesMusicApi>, SearchRepository {
  func fetchSearch(term: String, offset: Int = 0, completion: @escaping ([Search]?, String?) -> Void){
    api.request(ItunesMusicApi.search(term: term, offset: offset)){ response in
      do {
        let result = try response.get()
        if result.statusCode <= 300 {
          let data = try result.map(Response.self)
          if data.resultCount == 0 {
            completion(nil, "Término no encontrado")
          } else {
            completion(data.results, nil)
          }
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
