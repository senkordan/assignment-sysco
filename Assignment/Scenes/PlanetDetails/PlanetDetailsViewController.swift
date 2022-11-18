//
//  PlanetDetailsViewController.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-16.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage

class PlanetDetailsViewController: RootViewController {
    
    var viewModel: PlanetDetailsViewModel!
    
    @IBOutlet weak var planetNameLabel: Label! {
        didSet {
            planetNameLabel.set(typographyStyle: .heading, alignment: .center)
        }
    }
    
    @IBOutlet weak var climateLabel: Label! {
        didSet {
            climateLabel.set(typographyStyle: .subHeading, alignment: .center)
        }
    }
    
    @IBOutlet weak var orbitalPeriodLabel: Label! {
        didSet {
            orbitalPeriodLabel.set(typographyStyle: .subHeading, alignment: .center)
        }
    }
    
    @IBOutlet weak var thumbIimageView: UIImageView!
    
    private(set) lazy var backButtonItem: NavBarItem = {
        return NavBarItem.backButton(target: self, action: #selector(onBackButtonClicked))
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavBar(leftItem: backButtonItem)
        setNavigationBarTitleWith(L10n.appName)
    }
    
    private func bind() {
        
        _ = viewModel
            .planetDetails
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { planetDetails in
                
                self.planetNameLabel.setText(planetDetails.name ?? "")
                self.climateLabel.setText(L10n.climateTitle(planetDetails.climate ?? ""))
                self.orbitalPeriodLabel.setText(L10n.orbitalPersionTitle(planetDetails.orbitalPeriod ?? ""))
                self.thumbIimageView.sd_setImage(with: URL(string: L10n.planetImageUrl(planetDetails.name ?? "")), placeholderImage:Asset.placeholder.image)
                
            }).disposed(by: disposeBag)
    }
    
    @objc private func onBackButtonClicked() {
        viewModel.goBack()
    }
    
}
