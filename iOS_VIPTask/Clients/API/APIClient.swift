//
//  NetworkClient.swift
//  iOS_VIPTask
//
//  Created by Fintech on 17/10/2022.
//

import Foundation
import Alamofire


enum APIError: Error {
    case NoStatusCode
}

class APIClient {
    
    static let shared = APIClient()
    
    private init() {}
        
    func request(for endpoint: APIRouter,
                 completionHandler: @escaping (Result<Data, Error>) -> Void ) {
        let urlString = endpoint.baseURL + "/" + endpoint.path
        
        guard let url = URL(string: urlString)
        else { fatalError("can`t get url \(urlString)") }
        
        let method = Alamofire.HTTPMethod(rawValue: endpoint.method.rawValue)
        let headers = Alamofire.HTTPHeaders(endpoint.headers ?? [:])
        let parameters = endpoint.parameters
        
        var encoding: ParameterEncoding {
            switch endpoint {
            case .getPosts, .getPostDetails:
                return URLEncoding.default
            }
        }
        
        AF.request(url,
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: headers,
                   interceptor: nil,
                   requestModifier: nil).response { response in
            
            guard let statusCode = response.response?.statusCode
            else {
                completionHandler(.failure(APIError.NoStatusCode))
                return
            }
        
            if  (200 ..< 300) ~= statusCode,
                let data = response.data {
                completionHandler(.success(data))
            }
        
        }
    }
    
    
    func throwingRequest(for endpoint: APIRouter) async throws -> Data {
        let urlString = endpoint.baseURL + "/" + endpoint.path
        
        guard let url = URL(string: urlString)
        else { fatalError("can`t get url \(urlString)") }
        
        let method = Alamofire.HTTPMethod(rawValue: endpoint.method.rawValue)
        let headers = Alamofire.HTTPHeaders(endpoint.headers ?? [:])
        let parameters = endpoint.parameters
        
        var encoding: ParameterEncoding {
            switch endpoint {
            case .getPosts, .getPostDetails:
                return URLEncoding.default
            }
        }
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url,
                       method: method,
                       parameters: parameters,
                       encoding: encoding,
                       headers: headers,
                       interceptor: nil,
                       requestModifier: nil).response { response in
                
                guard let statusCode = response.response?.statusCode
                else {
                    continuation.resume(throwing: APIError.NoStatusCode)
                    return
                }
                if  (200 ..< 300) ~= statusCode,
                    let data = response.data {
                    continuation.resume(returning: data)
                }
            
            }
        }
        
    }
}
