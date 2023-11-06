//
//  Person.swift
//  mvpSOLID
//
//  Created by Goodwasp on 05.11.2023.
//

import Foundation

struct Comment: Decodable {
    var postId: Int
    var id: Int
    var name: String
    var email: String
    var body: String
}
