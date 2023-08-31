//
//  SportsResultProtocol.swift
//  SportsResult
//
//  Created by Adit Hasan on 10/22/21.
//

import Foundation
import Combine

protocol SportsService {
  var apiSession: APISessionProtocol { get }
  func sportsCommentsResult() -> AnyPublisher<[Comment], APIError>
}

extension SportsService {
  func sportsCommentsResult() -> AnyPublisher<[Comment], APIError> {
    return apiSession.request(with: SportsEndpoint.sportsResult)
  }
}