//
//  PlanetsCoordinator.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-16.
//

import Foundation
import UIKit

final class AppCoordinator: Coordinator {
    
    var parentCoordinator: Coordinator?
    var children: [Coordinator] = []
    var navigationController: UINavigationController
    
    init(navigationController : UINavigationController) {
        self.navigationController = navigationController
    }
    
    ///launching planet listing view controller as landing screen
    func start() {
        let planetDetailsViewController = StoryboardScene.PlanetListing.initialScene.instantiate()
        let planetListingViewModel = PlanetListingViewModel.init()
        planetListingViewModel.coordinator = self
        planetDetailsViewController.viewModel = planetListingViewModel
        navigationController.pushViewController(planetDetailsViewController, animated: true)
    }
    
    /// Show planet detauls
    /// - Parameter planet: selected planet details
    func showPlanetDetails(with planet: Planet) {
        let planetDetailsViewController = StoryboardScene.PlanetDetails.initialScene.instantiate()
        let planetDetailsViewModel = PlanetDetailsViewModel.init()
        planetDetailsViewModel.coordinator = self
        planetDetailsViewController.viewModel = planetDetailsViewModel
        navigationController.pushViewController(planetDetailsViewController, animated: true)
    }
    
    func goBack() {
        navigationController.popViewController(animated: true)
    }
    
}
