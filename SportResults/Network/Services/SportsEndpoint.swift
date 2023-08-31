//
//  SportsEndpoint.swift
//  SportsResult
//
//  Created by Adit Hasan on 10/22/21.
//

import Foundation

enum SportsEndpoint {
  case sportsResult
}

extension SportsEndpoint: RequestBuilder {
  var urlRequest: URLRequest {
    switch self {
    case .sportsResult:
      guard let url = URL(string: URLs.contentURL) else { preconditionFailure("Invalid URL format") }
      var request = URLRequest(url: url)
      request.httpMethod = "GET"
      request.addValue("application/json", forHTTPHeaderField: "Content-Type")
      return request
    }
  }
}
