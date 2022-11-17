//
//  PlanetsCoordinator.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-16.
//

import Foundation
import UIKit

final class AppCoordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        //launching planet listing view controller as landing screen
        let PlanetDetailsViewController = StoryboardScene.PlanetListing.initialScene.instantiate()
        let planetListingViewModel = PlanetListingViewModel.init()
        planetListingViewModel.coordinator = self
        PlanetDetailsViewController.viewModel = PlanetListingViewModel()
        navigationController.pushViewController(PlanetDetailsViewController, animated: true)
    }
    
    func showPlanetDetails() {
        let PlanetDetailsViewController = StoryboardScene.PlanetDetails.initialScene.instantiate()
        let planetDetailsViewModel = PlanetDetailsViewModel.init()
        planetDetailsViewModel.coordinator = self
        PlanetDetailsViewController.viewModel = planetDetailsViewModel
        navigationController.pushViewController(PlanetDetailsViewController, animated: true)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
    
}
