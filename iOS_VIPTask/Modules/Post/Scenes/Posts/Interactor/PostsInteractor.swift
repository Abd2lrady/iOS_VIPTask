//
//  PostsInteractor.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import Foundation

protocol PostsInteractorProtocol {    
    func getPosts(request: Posts.Request)
    func getPostId(request: Posts.Request.PostCell)
}

class PostsInteractor {
    let postsPresenter: PostsPresenterProtocol
    let postsService: PostsGateway
    var postsDataStore: PostsDataStoreProtocol
    
    init(postsPresenter: PostsPresenterProtocol,
         postsService: PostsGateway,
         postsDataStore: PostsDataStoreProtocol) {
        
        self.postsDataStore = postsDataStore
        self.postsPresenter = postsPresenter
        self.postsService = postsService
    }
}


extension PostsInteractor: PostsInteractorProtocol {
    func getPostId(request: Posts.Request.PostCell) {
        switch request {
        case .setTitle(let indx, let id):
 // MARK: -
 // TODO: - trying to create vm for cell and invoke reload table view
//            postsPresenter.
//            postsDataStore.postsIDs
            print(indx, id)
        }
    }
    
    
    func getPosts(request: Posts.Request) {
         
        postsService.getPosts { [unowned self] result in
            switch result {
            case .success(let res):
                postsDataStore.posts = res.data
                postsPresenter.presentPosts(from: Posts.Response(posts: res.data, postIDs: postsDataStore.postIDs))
//                postsDataStore.savePosts(posts: Posts.Response(posts: res.data, postIDs: <#[Int?]#>))
            case .failure:
                print("error")
            }
        }
    }
    
    
    
}
extension PostsInteractor: PostDetailsInteractorDelegate {
    func setPostId(indx: Int) {
        postsPresenter.setTitle(indx: indx)
    }
    
    
}
