//
//  PostDetailsDataStore.swift
//  iOS_VIPTask
//
//  Created by Fintech on 23/10/2022.
//

import Foundation

protocol PostDetailsDataStoreProtocol {
    var postID: Int? { get set }
}

class PostDetailsDataStore: PostDetailsDataStoreProtocol {
    var postID: Int?
}
