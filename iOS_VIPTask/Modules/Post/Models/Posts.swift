//
//  Post.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import Foundation

enum Posts {
    struct Request {}
    
    struct Response {
        let posts: [PostEntity]
        let postIDs: Int?
    }
    
    struct ViewModel {
        let userID: String
        let post: String
        var postID: String?
    }
}
