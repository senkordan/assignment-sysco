//
//  PlanetDetailsViewController.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-16.
//

import UIKit

class PlanetDetailsViewController: RootViewController {
    
    var viewModel: PlanetDetailsViewModel!
    
    @IBOutlet weak var planetNameLabel: Label! {
        didSet {
            planetNameLabel.set(typographyStyle: .Heading, alignment: .center)
        }
    }
    
    @IBOutlet weak var climateLabel: Label! {
        didSet {
            climateLabel.set(typographyStyle: .Body, alignment: .center)
        }
    }
    
    @IBOutlet weak var orbitalPeriodLabel: Label! {
        didSet {
            orbitalPeriodLabel.set(typographyStyle: .Body, alignment: .center)
        }
    }
    
    @IBOutlet weak var thumbIimageView: UIImageView!
    
    private(set) lazy var backButtonItem: NavBarItem = {
        return NavBarItem.backButton(target: self, action: #selector(onBackButtonClicked))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavBar(leftItem: backButtonItem)
        setNavigationBarTitleWith(L10n.appName)
    }
    
    @objc private func onBackButtonClicked() {
        viewModel.goBack()
    }
    
}
