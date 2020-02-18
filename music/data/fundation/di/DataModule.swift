//
//  DataModule.swift
//  music
//
//  Created by Ulises Harris on 15-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Swinject
import Moya

class DataModule {
  static func setup(_ defaultContainer: Container) {
    
    defaultContainer.register(SearchRepositoryDataBase.self) { r in
      SearchRepositoryDataBase(dao: SearchDao())
    }.inObjectScope(.container)

    defaultContainer.register(SearchRepositoryNetwork.self) { r in
      SearchRepositoryNetwork(api: getMoyaProvider())}
    .inObjectScope(.container)
    
    defaultContainer.register(URLSessionConfiguration.self) { _ in
      let config = URLSessionConfiguration.default
      config.httpCookieStorage = HTTPCookieStorage.shared
      config.httpCookieAcceptPolicy = .always
      config.httpShouldSetCookies = true
      return config
    }.inObjectScope(.container)
    
    func getMoyaProvider<T: TargetType>() -> MoyaProvider<T> {
      return MoyaProvider<T>(endpointClosure: { (target: T) in
        
        let url = "\(target.baseURL.absoluteString)\(target.path)"
        
        let endpoint = Endpoint(
          url: url,
          sampleResponseClosure: { .networkResponse(200, target.sampleData) },
          method: target.method,
          task: target.task,
          httpHeaderFields: target.headers)
        
        return endpoint
      })
    }
  }
}


