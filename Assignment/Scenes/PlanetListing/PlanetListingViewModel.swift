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
    
    init() {
        fetchPlanets()
    }
    
    func fetchPlanets(){
        useCases.fetchPlanets()
            .subscribe(onSuccess: { [weak self] response in
                print("Fetching planet success", response)
            }, onError: { [weak self] error in
                print("Fetching planes failed", error)
            })
            .disposed(by: disposeBag)
    }
    
}
