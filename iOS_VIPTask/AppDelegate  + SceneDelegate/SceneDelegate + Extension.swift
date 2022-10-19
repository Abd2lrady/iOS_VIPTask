//
//  SceneDelegate + Extension.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import UIKit
extension SceneDelegate {
    func bootApp(scene: UIWindowScene) {
        let window = UIWindow(windowScene: scene)
        
        let navigator = UINavigationController()
        PostsConfigrator.configureModule(navigator: navigator)


        window.rootViewController = navigator
        self.window = window
        self.window?.makeKeyAndVisible()
    }
}

