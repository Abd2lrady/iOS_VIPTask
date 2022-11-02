//
//  PostsPresenter.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import Foundation

protocol PostsPresenterProtocol {
    func presentPosts(from response: Posts.Response)
    func setTitle(indx: Int)
}

class PostsPresenter {
    weak var postsView: PostsVCProtocol?
    
    init(postsView: PostsVCProtocol) {
        self.postsView = postsView
    }
}


extension PostsPresenter: PostsPresenterProtocol {
    func setTitle(indx: Int) {
        DispatchQueue.main.async {
            self.postsView?.setTitle(title: "\(indx)")
        }
    }
    
    func presentPosts(from response: Posts.Response) {
        let postsVMs = response.posts.map { post in
            Posts.ViewModel(userID: "UserID: \(String(post.userID))",
                            post: post.title)
        }
        postsView?.showPosts(posts: postsVMs)
    }
    
    
    
}
