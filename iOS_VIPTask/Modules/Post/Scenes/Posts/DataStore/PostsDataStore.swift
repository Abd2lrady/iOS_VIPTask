//
//  PostsDataStore.swift
//  iOS_VIPTask
//
//  Created by Fintech on 19/10/2022.
//

import Foundation

protocol PostsDataStoreProtocol {
    
    func savePosts(posts: Posts.Response)
    func getPostID(at index: Int) -> Int?
    var posts: [PostEntity]? { get set }
    var postsIDs: Int? { get set }
}

class PostsDataStore {
     var posts: [PostEntity]? = [PostEntity]()
    var postsIDs: Int?
}

extension PostsDataStore: PostsDataStoreProtocol {
    

    func savePosts(posts: Posts.Response) {
        
        self.postsIDs = posts.postIDs
    }
    
    func getPostID(at index: Int) -> Int? {
         
        return self.posts?[index].id
    }
    
    
}
