//
//  PostPresenter.swift
//  iOS_VIPTask
//
//  Created by Fintech on 19/10/2022.
//

import Foundation

protocol PostDetailsPresenterProtocol {
    func presentPostDetails(postDetails: PostDetails.Response)
}

class PostDetailsPresenter {
    weak var postView: PostDetailsVCProtocol?
    
    init(postView: PostDetailsVCProtocol) {
        self.postView = postView
    }
}

extension PostDetailsPresenter: PostDetailsPresenterProtocol {

    func presentPostDetails(postDetails: PostDetails.Response) {
        
        let details = PostDetails.ViewModel(postID: String(postDetails.postDetails.id),
                                            postTilte: postDetails.postDetails.title,
                                            post: postDetails.postDetails.body)
        postView?.showPostDetails(post: details)
    }
}
