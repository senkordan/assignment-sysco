//
//  AppApiClient.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-17.
//

import Foundation
import RxSwift
import RxCocoa
import UIKit

protocol ApiClient {
    func request<Response: Decodable>(_ endpoint: ApiEndpoint<Response>) -> Single<Response>
}

final class AppApiClient: ApiClient {
    
    static var shared = AppApiClient()
    
    private let session: URLSession = {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = AppConfigurations.TIME_OUT_INTERVAL
        let session = URLSession(configuration: sessionConfig)
        return session
    }()

    private var urlSessionDataTask: URLSessionDataTask?
    
    /// Common method to perform data tasks
    /// - Parameter endpoint: This containts essentials params to build url requrest
    /// - Returns: Generic decodable  response
    func request<Response: Decodable>(_ endpoint: ApiEndpoint<Response>) -> Single<Response> {
        return Single<Response>.create { observer in
        
            let urlRequest = self.prepareRequest(endpoint: endpoint)
            
            /// Cancelling if any pending url session tasks
            self.urlSessionDataTask?.cancel()
            
            self.urlSessionDataTask = self.session.dataTask(with: urlRequest) { data, response, error in
               
                if let data = data {
                    let parsedResponse: SingleEvent<Response> = self.parseResponse(data)
                    observer(parsedResponse)
                } else if let error = error {
                    /// Could't do any error hanling like 404, 500, since api returns those form data and those are not in a speicfic format.
                    observer(.failure(AppError.errorMessage(error.localizedDescription)))
                }
            }
            
            /// Starting any tasks in suspended states
            self.urlSessionDataTask?.resume()
            
            return Disposables.create()
        }
    }
    
    /// Decodes json into object
    /// - Parameter response: respose data from dataTask performed
    /// - Returns: Decoded data
    private func parseResponse<Response: Decodable>(_ response: Data) -> SingleEvent<Response> {
      
        guard let parsedResult: Response = try? JSONDecoder().decode(Response.self, from: response) else {
            return .failure(AppError.general)
        }
        return .success(parsedResult)
    }
    
    /// Builds url request
    /// - Parameter endpoint: This containts essentials params to build url requrest
    /// - Returns: Url request to be passed in data tasks
    private func prepareRequest<Response>(endpoint: ApiEndpoint<Response>) -> URLRequest {
        
        var urlComponents = URLComponents(url: endpoint.url, resolvingAgainstBaseURL: false)!
        
        if let queryStrings = endpoint.queryStrings {
            urlComponents.queryItems = queryStrings.map { (key: String, value: Any) in
                return URLQueryItem(name: key, value: "\(value)")
            }
        }
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = endpoint.method.rawValue
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let body = endpoint.body {
            urlRequest.httpBody = body
        }
        return urlRequest
    }
}

