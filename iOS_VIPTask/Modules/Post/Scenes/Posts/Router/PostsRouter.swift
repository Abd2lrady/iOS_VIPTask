//
//  PostsRouter.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import UIKit

protocol PostsRouterProtocol: AnyObject {
        
    func routeToPostDetails(postID: Int)
}


class PostsRouter: PostsRouterProtocol {
    
    var navigator: UINavigationController
    var postsDataStore: PostsDataStoreProtocol

    init(navigator: UINavigationController,
         postsDataStore: PostsDataStoreProtocol) {
        self.navigator = navigator
        self.postsDataStore = postsDataStore
    }
    
    func routeToPostDetails(postID: Int) {
        let postID = postsDataStore.getPostID(at: postID)
        let view = PostDetailsVC()
        view.postID = postID
        PostDetailsConfigrator.configureModule(view: view)
        navigator.pushViewController(view,
                                     animated: true)
//        print(postID)
//        let PostDetails = PostDetailsVC()
//        
//        navigator.pushViewController(PostDetails,
//                                     animated: true)
    }
    
}
