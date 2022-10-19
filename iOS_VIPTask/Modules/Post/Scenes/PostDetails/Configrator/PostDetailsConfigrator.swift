//
//  PostDetailsConfigrator.swift
//  iOS_VIPTask
//
//  Created by Fintech on 19/10/2022.
//

import UIKit

class PostDetailsConfigrator {
    static func configureModule(view: PostDetailsVC) {
                
        let presenter = PostDetailsPresenter(postView: view)
        
        let postDetailsService = RemotePostsService()
        let interactor = PostDetailsInteractor(postsService: postDetailsService,
                                        postPresenter: presenter)
        view.postDetailsInteractor = interactor
    
    }

}
