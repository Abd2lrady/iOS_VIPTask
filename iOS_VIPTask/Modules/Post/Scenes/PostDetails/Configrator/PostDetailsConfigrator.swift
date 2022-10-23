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
        let dataStore = PostDetailsDataStore()
        let interactor = PostDetailsInteractor(postsService: postDetailsService,
                                               postPresenter: presenter,
                                               postDetailsDataStore: dataStore,
                                               postID: postID)
        let router = PostDetailsRouter(view: view,
                                       dataStore: dataStore)
        view.postDetailsRouter = router
        view.postDetailsPresenter = presenter
        view.postDetailsInteractor = interactor
        
        return view

    }

}
