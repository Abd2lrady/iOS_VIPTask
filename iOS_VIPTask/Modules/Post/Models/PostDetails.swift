//
//  PostDetails.swift
//  iOS_VIPTask
//
//  Created by Fintech on 19/10/2022.
//

import Foundation

enum PostDetails {
    struct Request {
        let postID: Int
    }
    
    struct Response {
        let postDetails: PostDetailsEntity
    }
    
    struct ViewModel {
        let postID: String
        let postTilte: String
        let post: String
    }
}
