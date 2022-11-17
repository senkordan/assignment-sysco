//
//  Coordinator.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-16.
//

import Foundation
import UIKit

protocol Coordinator {
    var parentCoordinator: Coordinator? { get set }
    var children: [Coordinator] { get set }
    var navigationController : UINavigationController { get set }
    
    func start()
}
