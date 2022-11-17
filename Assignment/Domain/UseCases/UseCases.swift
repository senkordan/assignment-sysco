//
//  UseCases.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-17.
//

import Foundation
import RxSwift

class UseCases {
    
    private let apiClient = AppApiClient()
    
    func fetchPlanets() -> Single<PlanetsResponse> {
        return apiClient.request(ApiServices.fetchPlanets())
    }
}
