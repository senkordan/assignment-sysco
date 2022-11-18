//
//  UseCasesMock.swift
//  AssignmentTests
//
//  Created by Senkordan Satchithananthan on 2022-11-18.
//

import Foundation
import RxSwift
@testable import Assignment

class UseCasesMock: UseCases {
    
    var planetsReturnValue = PublishSubject<PlanetsResponse>()
    func fetchPlanets() -> Single<PlanetsResponse> {
        return planetsReturnValue.asSingle()
    }
}
