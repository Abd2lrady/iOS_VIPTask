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
    
    weak var view: UIViewController?
    var postsDataStore: PostsDataStoreProtocol

    init(view: UIViewController,
         postsDataStore: PostsDataStoreProtocol) {
        self.view = view
        self.postsDataStore = postsDataStore
    }
    
    func routeToPostDetails(postID: Int) {
//        let postID = postsDataStore.getPostID(at: postID)
//        let view = PostDetailsVC()
//        view.postID = postID
        let destination = PostDetailsConfigrator.configureModule(postID: postID ?? 0)
        
        if let destination = destination as? PostDetailsVC, let router = destination.postDetailsRouter as? PostDetailsRouter{
            view?.navigationController?.delegate = router
        }
        view?.navigationController?.pushViewController(destination,
                                     animated: true)
//        print(postID)
//        let PostDetails = PostDetailsVC()
//        
//        navigator.pushViewController(PostDetails,
//                                     animated: true)
    }
    
}
