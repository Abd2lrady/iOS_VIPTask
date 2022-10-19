//
//  PostsRouter.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import UIKit

protocol PostsRouterProtocol: AnyObject {
        
    func routeToPostDetails(postIndx: Int)
}


class PostsRouter: PostsRouterProtocol {
    
    var navigator: UINavigationController
    var postsDataStore: PostsDataStoreProtocol

    init(navigator: UINavigationController,
         postsDataStore: PostsDataStoreProtocol) {
        self.navigator = navigator
        self.postsDataStore = postsDataStore
    }
    
    func routeToPostDetails(postIndx: Int) {
        let post = postsDataStore.loadPost(at: postIndx)
        print(post)
//        let PostDetails = PostDetailsVC()
//        
//        navigator.pushViewController(PostDetails,
//                                     animated: true)
    }
    
}
