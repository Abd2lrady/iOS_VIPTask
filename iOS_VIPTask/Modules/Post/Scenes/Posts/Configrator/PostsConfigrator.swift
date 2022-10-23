//
//  PostsConfigrator.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import UIKit

class PostsConfigrator {
    
    static func configureModule() -> UIViewController {
        
        let view = PostsVC()
        
        let presenter = PostsPresenter(postsView: view)
        
        let postsService = RemotePostsService()
        let postsDataStore = PostsDataStore()
        let interactor = PostsInteractor(postsPresenter: presenter,
                                         postsService: postsService,
                                         postsDataStore: postsDataStore)
        view.postsInteractor = interactor
        
        let router = PostsRouter(view: view,
                                 postsDataStore: postsDataStore)
        view.router = router
        
        return view
        
    }

}
