//
//  PostsRouter.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import UIKit

protocol PostsRouterProtocol: AnyObject {
        
    func routeToPostDetails(postID: Int)
    var postID: Int? { get }
}


class PostsRouter: PostsRouterProtocol {
    var postID: Int? {
        get {
            postsDataStore.postIDs
        }
    }
    
    
    weak var view: PostsVC?
    var postsDataStore: PostsDataStoreProtocol

    init(view: PostsVC,
         postsDataStore: PostsDataStoreProtocol) {
        self.view = view
        self.postsDataStore = postsDataStore
    }
    
    func routeToPostDetails(postID: Int) {
//        let postID = postsDataStore.getPostID(at: postID)
//        let view = PostDetailsVC()
//        view.postID = postID
        let destination = PostsConfigrator.configurePostDetailsScene(postID: postID, interactorDelegate: (view?.interactor as? PostsInteractor))
//        configurePostDetailsScene(postID: postID, interactorDelegate: view?.interactor)
        
        if let destination = destination as? PostDetailsVC, let router = destination.router as? PostDetailsRouter {
//            router.delegate = self
//            view?.navigationController?.delegate = router
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

extension PostsRouter: PostDetailsRouterDelegateProtocol {
    func routeToPosts(with id: Int) {
        postsDataStore.postIDs = id
//        view?.title = "\(id)"
    }
    
    
}
