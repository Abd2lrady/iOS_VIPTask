//
//  PostsRouter.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import UIKit

protocol PostsRouterProtocol: AnyObject {
    
    func navigateTo(post: Posts.ViewModel)
}


class PostsRouter: PostsRouterProtocol {
    var navigator: UINavigationController

    init(navigator: UINavigationController) {
        self.navigator = navigator
    }
    
    func navigateTo(post: Posts.ViewModel) {
        
    }
}
