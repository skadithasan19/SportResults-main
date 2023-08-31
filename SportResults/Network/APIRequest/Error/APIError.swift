//
//  APIError.swift
//  SportsResult
//
//  Created by Adit Hasan on 10/22/21.
//

import Foundation

enum APIError: Error {
  case decodingError(error: Error)
  case validationError(error: Error)
  case httpError(response: HTTPURLResponse, builder: RequestBuilder)
  case noResponse
  case unknown(description: String)
  
  var errorDescription: String? {
    switch self {
    case .decodingError:
      return DecodingError.defaultDecodingError
    case .validationError:
      return DecodingError.defaultDecodingError
    case .noResponse:
      return HTTPError.noResponse
    case .unknown(let description):
      return description
    case .httpError(response: let response, _):
      switch response.statusCode {
      case 404:
        return HTTPError.statusCode404
      default:
        return ""
      }
    }
  }
}

extension APIError {
  enum DecodingError {
    static let defaultDecodingError = "There was a problem decoding the data from the server. Please try again"
  }
  enum HTTPError {
    static let statusCode404 = "The requested resource was not found"
    static let noResponse = "It looks like the server is not responding."
  }
}
