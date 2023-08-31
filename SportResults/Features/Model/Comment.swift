//
//  Comment.swift
//  SportResults
//
//  Created by Adit Hasan on 8/25/23.
//

import Foundation

struct Comment: Codable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
