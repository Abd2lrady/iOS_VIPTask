//
//  PostDetailsRouter.swift
//  iOS_VIPTask
//
//  Created by Fintech on 23/10/2022.
//

import UIKit

protocol PostDetailsRouterProtocol {
    func routeToPosts(with Id: Int)
}

class PostDetailsRouter: NSObject {
    weak var view: UIViewController?
    
    init(view: UIViewController) {
        self.view = view
    }
}

extension PostDetailsRouter: PostDetailsRouterProtocol  {
    func routeToPosts(with Id: Int) {
        print("poping the source with \(Id)")
    }
    
    
}

extension PostDetailsRouter: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let source = navigationController.transitionCoordinator?.viewController(forKey: .from)
        else { return }
        
        if navigationController.viewControllers.contains(source) { return }
        routeToPosts(with: 1)
    }
}

