//
//  PostsVCProtocol.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import UIKit

protocol PostsVCProtocol: AnyObject {
    func showPosts(posts: [Posts.ViewModel])
    func setTitle(title: String)
//    var postsTV: UITableView { get set }
}
