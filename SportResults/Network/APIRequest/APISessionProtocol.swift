//
//  APISessionProtocol.swift
//  SportsResult
//
//  Created by Adit Hasan on 10/22/21.
//

import Foundation
import Combine

protocol APISessionProtocol {
  func request<T: Decodable>(with builder: RequestBuilder) -> AnyPublisher<T, APIError>
}
