//
//  PlanetDetailsViewModel.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-16.
//

import Foundation
import RxSwift
import RxCocoa

final class PlanetDetailsViewModel {
    
    weak var coordinator: AppCoordinator!
    
    let planetDetails: BehaviorRelay<Planet>
    
    init(planet: Planet) {
        planetDetails = BehaviorRelay<Planet>(value: planet)
    }
    
    func goBack() {
        coordinator.goBack()
    }
    
}
