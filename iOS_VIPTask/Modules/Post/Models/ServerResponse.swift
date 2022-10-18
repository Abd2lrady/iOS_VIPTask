//
//  ServerResponse.swift
//  iOS_VIPTask
//
//  Created by Fintech on 18/10/2022.
//

import Foundation

struct ServerResponse<ResponseType: Codable>: Codable {

    let data: ResponseType
    let count: Int?
    
    enum CodingKeys: String, CodingKey {
        case data = "posts"
        case count = "total"
    }
    
}
