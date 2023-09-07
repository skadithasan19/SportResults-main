//
//  SportsEndpoint.swift
//  SportsResult
//
//  Created by Adit Hasan on 10/22/21.
//

import Foundation

enum SportsEndpoint {
    case sportsResult
    case allUsers
    case sportsComments(String)
    case sportsPosts(String)
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
        case .allUsers:
            guard let url = URL(string: URLs.usersURL) else { preconditionFailure("Invalid URL format") }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            return request
        case .sportsComments(let postId):
            guard let url = URL(string: URLs.commentsByPostsURL + "\(postId)") else { preconditionFailure("Invalid URL format") }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            return request
        case .sportsPosts(let userID):
            guard let url = URL(string: URLs.postsByUserURL + "\(userID)") else { preconditionFailure("Invalid URL format") }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            return request
        }
    }
}
