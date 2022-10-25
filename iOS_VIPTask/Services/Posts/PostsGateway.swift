//
//  PostsGateway.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import Foundation

protocol PostsGateway {
    func getPosts(completionHandler: @escaping (Result<ServerResponse<[PostEntity]>, Error>) -> Void)
    
    func getPostDetails(postID: Int,
                        completionHandler: @escaping (Result<PostDetailsEntity, Error>) -> Void)
    
    func throwingGetPostDetails(postID: Int) async throws -> PostDetailsEntity
}
