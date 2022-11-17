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
    
    private let useCases = UseCases()
    private let disposeBag = DisposeBag()
    private let errorTracker = ErrorTracker()
    
    let planets = BehaviorRelay<[Planet]>(value: [])
    let isLoading = BehaviorRelay<Bool>(value: false)
    
    lazy var errors: Driver<Error> = {
        return errorTracker.asDriver()
    }()
    
    func fetchPlanets(){
        isLoading.accept(true)
        useCases.fetchPlanets()
            .subscribe(onSuccess: { [weak self] response in
                self?.isLoading.accept(false)
                
                if let planets = response.results {
                    self?.planets.accept(planets)
                }
            }, onFailure: { [weak self] error in
                self?.isLoading.accept(false)
                self?.errorTracker.onError(error)
            })
            .disposed(by: disposeBag)
    }
    
    func showPlanerDetails(with planet: Planet) {
        coordinator.showPlanetDetails(with: planet)
    }
    
}
