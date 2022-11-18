//
//  UseCases.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-17.
//

import Foundation
import RxSwift

protocol UseCases {
    func fetchPlanets() -> Single<PlanetsResponse>
}

class AppUseCases {
    private let apiClient = AppApiClient()
}

extension AppUseCases: UseCases {
    
    func fetchPlanets()-> Single<PlanetsResponse>{
        return apiClient.request(ApiServices.fetchPlanets())
    }
}
