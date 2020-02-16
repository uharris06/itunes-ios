//
//  StubRestApi.swift
//  musicTests
//
//  Created by Ulises Harris on 16-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Moya
@testable import music

class StubRestApi<T: TargetType>: MoyaProvider<T> {
  let statusCode: Int
  
  init(statusCode: Int = 200) {
    self.statusCode = statusCode
    super.init(endpointClosure: {(target: T) -> Endpoint in
      var sampleResponseClosure: () -> Moya.EndpointSampleResponse = { .networkResponse(statusCode, target.sampleData) }
      if statusCode >= 400 {
        let error = NSError(domain: "", code: statusCode, userInfo: nil)
        sampleResponseClosure = { .networkError(error) }
      }
      
      return Endpoint (url: "\(target.baseURL)\(target.path)",
        sampleResponseClosure: sampleResponseClosure,
        method: target.method,
        task: target.task,
        httpHeaderFields: target.headers)
    }, stubClosure: MoyaProvider.immediatelyStub)
  }
}
