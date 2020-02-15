//
//  ItunesMusicApi.swift
//  music
//
//  Created by Ulises Harris on 14-02-20.
//  Copyright © 2020 Ulises Harris. All rights reserved.
//

import Foundation
import Moya

public enum ItunesMusicApi {
  case search(term: String, offset: Int)
}

extension ItunesMusicApi: TargetType {
  public var baseURL: URL {
    return URL(string: Constants.BASE_URL)!
  }
  
  public var path: String {
    switch self {
    case .search: return "search"
    }
  }
  
  public var method: Moya.Method {
    switch self {
    case .search: return .get
    }
  }
  
  public var sampleData: Data {
    return Data()
  }
  
  public var task: Task {
    switch self {
    case .search(let term, let offset):
      return .requestParameters(parameters: [
        "term": term,
        "mediaType": "music",
        "limit": 20,
        "offset": offset * 20
      ], encoding: URLEncoding.default)
    }
  }
  
  public var headers: [String : String]? {
    return [
      "Content-Type": "application/json",
      "Accept": "application/json"
    ]
  }
  
  public var validationType: ValidationType {
    return .successCodes
  }
}
