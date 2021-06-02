//
//  Post.swift
//  social-network-ios
//
//  Created by Rubens Ferreira Ramos on 02/06/21.
//

import Foundation

struct Post: Codable, Identifiable {
    let userId, id: Int
    let title, body: String
}
