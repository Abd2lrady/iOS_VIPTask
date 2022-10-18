//
//  PostsConfigrator.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import Foundation

class PostsConfigrator {
    static func configureModule(viewController: PostsVCProtocol) {
        let view = PostsVC()
        let presenter = PostsPresenter(postsView: view)
        let postsService = RemotePostsService()
        let interactor = PostsInteractor(postsPresenter: presenter,
                                         postsService: postsService)
        view.postsInteractor = interactor
    }

}
