//
//  APISession.swift
//  SportsResult
//
//  Created by Adit Hasan on 10/22/21.
//

import Foundation
import Combine

protocol URLSessionProtocol {
  func dataTaskPublisher(for: URLRequest) -> URLSession.DataTaskPublisher
}

extension URLSession: URLSessionProtocol {}

struct APISession: APISessionProtocol {
  
  private let session: URLSessionProtocol
  
  init(session: URLSessionProtocol = URLSession.shared) {
    self.session = session
  }
  
  func request<T>(with builder: RequestBuilder) -> AnyPublisher<T, APIError> where T: Decodable {
    return session.dataTaskPublisher(for: builder.urlRequest)
      .tryMap { result in
        let decoder = JSONDecoder()
        guard let urlResponse = result.response as? HTTPURLResponse else {
          throw APIError.unknown(description: "Unknown Error: 0")
        }
        
        print("builder url:", builder.urlRequest.url as Any)
        if (200...299).contains(urlResponse.statusCode) {
          return try decoder.decode(T.self, from: result.data)
        } else {
          throw APIError.httpError(response: urlResponse, builder: builder)
        }
      }
      .mapError { error in
        print(builder.urlRequest.url as Any)
        switch error {
        case let apiError as APIError:
          return apiError
        case let decodingError as DecodingError:
          return APIError.decodingError(error: decodingError)
        default:
          return APIError.unknown(description: error.localizedDescription)
        }
      }
      .receive(on: DispatchQueue.main)
      .eraseToAnyPublisher()
  }
}

extension Data {
  var prettyPrintedJSONString: NSString? { /// NSString gives us a nice sanitized debugDescription
    guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
          let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
          let prettyPrintedString = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else { return nil }
    
    return prettyPrintedString
  }
}
