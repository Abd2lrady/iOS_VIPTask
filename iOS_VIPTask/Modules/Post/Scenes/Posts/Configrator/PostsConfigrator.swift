//
//  PostsConfigrator.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import UIKit

enum PostsConfigrator {
   private static let postsService = RemotePostsService()
    static func configurePostsScene() -> UIViewController {
        let view = PostsVC()
        let presenter = PostsPresenter(postsView: view)
        let postsDataStore = PostsDataStore()
        let interactor = PostsInteractor(postsPresenter: presenter,
                                         postsService: postsService,
                                         postsDataStore: postsDataStore)
        view.interactor = interactor
        let router = PostsRouter(view: view,
                                 postsDataStore: postsDataStore)
        view.router = router
        return view
    }
    
    static func configurePostDetailsScene(postID: Int, interactorDelegate: PostDetailsInteractorDelegate?) -> UIViewController {
        let view = PostDetailsVC()
        let presenter = PostDetailsPresenter(postView: view)
        let dataStore = PostDetailsDataStore()
        let interactor = PostDetailsInteractor(postsService: postsService,
                                               postPresenter: presenter,
                                               postDetailsDataStore: dataStore,
                                               postID: postID)
        interactor.delegate = interactorDelegate
        let router = PostDetailsRouter(view: view,
                                       dataStore: dataStore)
        view.router = router
//        view.presenter = presenter
        view.interactor = interactor
        
        return view

    }


}
