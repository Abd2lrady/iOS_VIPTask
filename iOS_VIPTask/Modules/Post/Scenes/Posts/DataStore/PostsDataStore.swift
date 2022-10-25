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
    var postIDs: Int? { get set }
}

class PostsDataStore {
     var posts: [PostEntity]? = [PostEntity]()
    var postIDs: Int?
}

extension PostsDataStore: PostsDataStoreProtocol {
    

    func savePosts(posts: Posts.Response) {
        
        self.postIDs = posts.postIDs
    }
    
    func getPostID(at index: Int) -> Int? {
         
        return self.posts?[index].id
    }
    
    
}
