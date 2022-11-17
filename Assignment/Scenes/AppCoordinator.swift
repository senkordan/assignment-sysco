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
        print("App Coordinator Start")
    }
    
    func showPlanetDetails() {
        let PlanetDetailsViewController = StoryboardScene.PlanetDetails.initialScene.instantiate()
        PlanetDetailsViewController.viewModel = PlanetDetailsViewModel()
        navigationController.pushViewController(PlanetDetailsViewController, animated: true)
    }
    
}
