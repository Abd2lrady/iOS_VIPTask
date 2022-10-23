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
    let postID: Int?
    
    init(postsService: PostsGateway,
         postPresenter: PostDetailsPresenterProtocol,
         postID: Int) {
        self.postsService = postsService
        self.postPresenter = postPresenter
        self.postID = postID
    }
}

extension PostDetailsInteractor: PostDetailsInteractorProtocol, PostDetailsDataStoreProtocol {

    func getPostDetails(request: PostDetails.Request) {
        postsService.getPostDetails(postID: postID ?? 0) { [weak self] result in
            switch result {
            case .failure:
                print("error post Details")
            case .success(let res):
                self?.postPresenter.presentPostDetails(postDetails: PostDetails.Response(postDetails: res))
            }
        }
    }

}
