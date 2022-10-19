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
        let interactor = PostsInteractor(postsPresenter: presenter,
                                         postsService: postsService)
//        let router = Post
        view.postsInteractor = interactor
        
        return view
    }

}
