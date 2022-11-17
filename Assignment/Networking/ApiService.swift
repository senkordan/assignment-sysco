//
//  ApiService.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-17.
//

import Foundation

enum ApiServices {
    
    static var baseURL: URL {
        return URL(string: AppConfigurations.BASE_URL)!
    }
}

extension ApiServices {
    
    static func fetchPlanets() -> ApiEndpoint<PlanetsResponse> {
        return ApiEndpoint(url: ApiServices.baseURL.appendingPathComponent("planets"))
    }
    
}
