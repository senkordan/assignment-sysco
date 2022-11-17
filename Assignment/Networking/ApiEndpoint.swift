//
//  ApiEndpoint.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-17.
//

import Foundation

typealias Parameters = [String: Any]
typealias Headers = [String: String]
typealias Path = String

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case patch = "PATCH"
    case put = "PUT"
    case delete = "DELETE"
}

struct ApiEndpoint<Response> {
    let method: HTTPMethod
    let url: URL
    let body: Data?
    let queryStrings: Parameters?
    let headers: Headers
    
    init(url: URL,
         method: HTTPMethod = .get,
         body: Data? = nil,
         queryStrings: Parameters? = nil,
         headers: Headers = [:]) {
        self.url = url
        self.method = method
        self.queryStrings = queryStrings
        self.body = body
        self.headers = headers
    }
}

