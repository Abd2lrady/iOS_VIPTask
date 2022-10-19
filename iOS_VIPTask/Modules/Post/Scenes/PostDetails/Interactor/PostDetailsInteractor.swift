//
//  PostInteractor.swift
//  iOS_VIPTask
//
//  Created by Fintech on 19/10/2022.
//

import Foundation

protocol PostDetailsInteractorProtocol {
    func getPostDetails(request: PostDetails.Request)
}

class PostDetailsInteractor {
    let postsService: PostsGateway
    let postPresenter: PostDetailsPresenterProtocol
    
    init(postsService: PostsGateway, postPresenter: PostDetailsPresenterProtocol) {
        self.postsService = postsService
        self.postPresenter = postPresenter
    }
}

extension PostDetailsInteractor: PostDetailsInteractorProtocol {
    
    func getPostDetails(request: PostDetails.Request) {
        postsService.getPostDetails(postID: request.postID) { [weak self] result in
            switch result {
            case .failure:
                print("error post Details")
            case .success(let res):
                self?.postPresenter.presentPostDetails(postDetails: PostDetails.Response(postDetails: res))
            }
        }
    }

}
