//
//  PostsVCProtocol.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import Foundation

protocol PostsVCProtocol: AnyObject {
    func showPosts(posts: [Posts.ViewModel]) 
}
