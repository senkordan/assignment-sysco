//
//  PlanetListingViewModel.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-16.
//

import Foundation
import RxSwift
import RxCocoa

final class PlanetListingViewModel {
    
    weak var coordinator: AppCoordinator!
    
    private let useCases = AppUseCases()
    private let disposeBag = DisposeBag()
    private let errorTracker = ErrorTracker()
    
    let planets = BehaviorRelay<[Planet]>(value: [])
    let isLoading = BehaviorRelay<Bool>(value: false)
    
    lazy var errors: Driver<Error> = {
        return errorTracker.asDriver()
    }()
    
    /// Calling fetch planes api
    func fetchPlanets() {
       
        isLoading.accept(true)
        useCases.fetchPlanets()
            .subscribe(onSuccess: { [weak self] response in
                guard let self = self else { return }
                self.isLoading.accept(false)
                
                if let planets = response.results {
                    self.planets.accept(planets)
                }
            }, onFailure: { [weak self] error in
                guard let self = self else { return }
                self.isLoading.accept(false)
                self.errorTracker.onError(error)
            })
            .disposed(by: disposeBag)
    }
    
    /// Show planet details
    /// - Parameter planet: selected planer description
    func showPlanerDetails(with planet: Planet) {
        coordinator.showPlanetDetails(with: planet)
    }
    
}
