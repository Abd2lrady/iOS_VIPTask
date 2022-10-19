//
//  PostsInteractor.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import Foundation

protocol PostsInteractorProtocol {    
    func getPosts(request: Posts.Request)
}

class PostsInteractor {
    let postsPresenter: PostsPresenterProtocol
    let postsService: PostsGateway
    let postsDataStore: PostsDataStoreProtocol
    
    init(postsPresenter: PostsPresenterProtocol,
         postsService: PostsGateway,
         postsDataStore: PostsDataStoreProtocol) {
        
        self.postsDataStore = postsDataStore
        self.postsPresenter = postsPresenter
        self.postsService = postsService
    }
}


extension PostsInteractor: PostsInteractorProtocol {
    
    func getPosts(request: Posts.Request) {
         
        postsService.getPosts { [unowned self] result in
            switch result {
            case .success(let res):
                postsPresenter.presentPosts(from: Posts.Response(posts: res.data))
                postsDataStore.savePosts(posts: Posts.Response(posts: res.data))
            case .failure:
                print("error")
            }
        }
    }
    
    
    
}
