//
//  Post.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import Foundation

enum Post {
    struct Request {}
    struct Response {}
    
    struct ViewModel {
        let userID: String
        let post: String
    }
}
