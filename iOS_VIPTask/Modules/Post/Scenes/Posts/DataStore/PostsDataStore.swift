//
//  PostsDataStore.swift
//  iOS_VIPTask
//
//  Created by Fintech on 19/10/2022.
//

import Foundation

protocol PostsDataStoreProtocol {
    
    func savePosts(posts: Posts.Response)
    func loadPost(at index: Int) -> PostEntity?
}

class PostsDataStore {
    private var posts: [PostEntity]? = [PostEntity]()
}

extension PostsDataStore: PostsDataStoreProtocol {

    func savePosts(posts: Posts.Response) {
        
        self.posts?.append(contentsOf: posts.posts)        
    }
    
    func loadPost(at index: Int) -> PostEntity? {
         
        return self.posts?[index]
    }
    
    
}
