//
//  APIRouter.swift
//  iOS_VIPTask
//
//  Created by Fintech on 17/10/2022.
//

import Foundation

enum APIRouter {
    
    case getPosts
    case getPostDetails(postID: Int)
}

extension APIRouter: APIRouterProtocol {

    var scheme: NetworkRequestScheme {
        switch self {
        case .getPosts, .getPostDetails:
            return .HTTPS
        }
    }
    
    var baseURL: String {
        switch self {
        case .getPosts, .getPostDetails:
            return Constants.API.baseURLs.Posts
        }
    }
    
    var path: String {
        switch self {
        case .getPosts:
            return "posts"
        case .getPostDetails(postID: let ID):
            return "posts/\(ID)"
        }
    }
    
    var method: NetworkRequestMethod {
        switch self {
        case .getPosts, .getPostDetails:
            return .get
        }
    }
    
    var parameters: [String : Any] {
        switch self {
        case .getPosts, .getPostDetails:
            return [:]
        }
    }
    
    
    
    var headers: [String : String]? {
        switch self {
        case .getPosts, .getPostDetails:
            return nil
        }
    }

}
