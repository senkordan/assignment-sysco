//
//  ApiClientMock.swift
//  AssignmentTests
//
//  Created by Senkordan Satchithananthan on 2022-11-18.
//

import Foundation
import RxSwift
@testable import Assignment

class AppApiClientMock: ApiClient {
    
    var capturedEndpoints: [Any] = []
    var responseValue: Single<Any?> = Single.never()

    func request<Response>(_ endpoint: ApiEndpoint<Response>) -> Single<Response> {
        capturedEndpoints.append(endpoint)
        return responseValue.map { $0 as! Response }
    }
    
}
