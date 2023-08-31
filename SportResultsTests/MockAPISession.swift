//
//  MockDecodableApiSession.swift
//  SportResultsTests
//
//  Created by Adit Hasan on 10/22/21.
//

import Combine
import Foundation
@testable import SportResults

struct MockDecodableApiSession<Output: Decodable, Failure: Error>: APISessionProtocol {
 
  class Stub {
    var expectedResult: Result<Output?, APIError> = .success(nil)
    var expectedReturnData: Data!
    var expectedURLRequest: URLRequest!
  }
  
  var stub = Stub()
 
  func request<T>(with builder: RequestBuilder) -> AnyPublisher<T, APIError> where T : Decodable {
    stub.expectedURLRequest = builder.urlRequest
    if case .success = stub.expectedResult {
      let result = try! JSONDecoder().decode(Output.self, from: stub.expectedReturnData)
      return Result.Publisher(result as! T).eraseToAnyPublisher()
    } else if case .failure(let error) = stub.expectedResult {
      return Result.Publisher(error).eraseToAnyPublisher()
    } else {
      fatalError("Bad test data")
    }
  }
  
} 
