//
//  PostsService.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import Foundation

enum PostServiceError: Error {
    case parseError
    case businessError
}

class RemotePostsService {
    private let remoteRepository: APIClient
    
    init(remoteRepository: APIClient =  APIClient.shared) {
        self.remoteRepository = remoteRepository
    }
}

extension RemotePostsService: PostsGateway {
    func getPosts(completionHandler: @escaping (Result<ServerResponse<[PostEntity]>, Error>) -> Void) {
        
        remoteRepository.request(for: .getPosts) { result in
            
            switch result {
            case .success(let data):
                
                do {
                    let response = try JSONDecoder().decode(ServerResponse<[PostEntity]>.self
                                                            ,from: data)
                    
                    completionHandler(.success(response))
                } catch {
                    completionHandler(.failure(PostServiceError.parseError))
                }
                
            case .failure:
                completionHandler(.failure(PostServiceError.businessError))
            }
        }
    }
    
    func getPostDetails(postID: Int,
                        completionHandler: @escaping (Result<PostDetailsEntity, Error>) -> Void) {
        remoteRepository.request(for: .getPostDetails(postID: postID)) { result in
            switch result {
            case .success(let data):
                do {
                    let response = try JSONDecoder().decode(PostDetailsEntity.self,
                                                              from: data)
                    completionHandler(.success(response))
                } catch {
                    completionHandler(.failure(PostServiceError.parseError))
                }
                
            case .failure:
                completionHandler(.failure(PostServiceError.businessError))
            }
        }
    }

}

