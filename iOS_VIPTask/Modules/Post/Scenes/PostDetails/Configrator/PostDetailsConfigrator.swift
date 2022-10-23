//
//  PostDetailsConfigrator.swift
//  iOS_VIPTask
//
//  Created by Fintech on 19/10/2022.
//

import UIKit

class PostDetailsConfigrator {
    static func configureModule(postID: Int) -> UIViewController {
                
        let view = PostDetailsVC()
        let presenter = PostDetailsPresenter(postView: view)
        
        let postDetailsService = RemotePostsService()
        let interactor = PostDetailsInteractor(postsService: postDetailsService,
                                               postPresenter: presenter, postID: postID)
        let router = PostDetailsRouter(view: view)
        view.postDetailsPresenter = presenter
        view.postDetailsRouter = router
        view.postDetailsInteractor = interactor
        
        return view

    }

}
