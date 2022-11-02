//
//  PostDetailsRouter.swift
//  iOS_VIPTask
//
//  Created by Fintech on 23/10/2022.
//

import UIKit

protocol PostDetailsRouterProtocol: AnyObject {
//    var view: UIViewController? { get set }
//    var dataStore: PostDetailsDataStoreProtocol { get set }
//    var delegate: PostDetailsRouterDelegateProtocol? { get set }
}

protocol PostDetailsRouterDelegateProtocol: AnyObject {
    func routeToPosts(with Id: Int)
}

class PostDetailsRouter: NSObject, PostDetailsRouterProtocol {
    weak var view: UIViewController?
    var dataStore: PostDetailsDataStoreProtocol
    weak var delegate: PostDetailsRouterDelegateProtocol?
    
    init(view: UIViewController,
         dataStore: PostDetailsDataStoreProtocol) {
        self.view = view
        self.dataStore = dataStore
    }
}

//extension PostDetailsRouter: UINavigationControllerDelegate {
//    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
////        guard let source = navigationController.transitionCoordinator?.viewController(forKey: .from)
////        else { return }
////        if navigationController.viewControllers.contains(source) { return }
//        guard viewController as? PostsRouter != nil else { return }
//        delegate?.routeToPosts(with: dataStore.postID ?? 0)
//    }
//}

