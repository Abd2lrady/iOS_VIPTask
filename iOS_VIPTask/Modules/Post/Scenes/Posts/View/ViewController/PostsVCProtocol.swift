//
//  PostsVCProtocol.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import UIKit

protocol PostsVCProtocol: UIViewController, AnyObject {
    func showPosts(posts: [Posts.ViewModel])
    
    var postsTV: UITableView { get set }
}
