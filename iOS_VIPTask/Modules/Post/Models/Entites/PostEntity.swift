//
//  PostEntity.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import Foundation

    
struct PostEntity: Codable {
    let id: Int
    let title, body: String
    let userID: Int
    let tags: [String]
    let reactions: Int
    
    enum CodingKeys: String, CodingKey {
        case id, title, body, tags, reactions
        case userID = "userId"
    }
}
