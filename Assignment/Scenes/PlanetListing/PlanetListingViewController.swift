//
//  PlanetListingViewController.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-16.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage

class PlanetListingViewController: RootViewController, UITableViewDelegate {
    
    var viewModel: PlanetListingViewModel!
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.separatorStyle = .none
            tableView.allowsSelection = true
            tableView.registerNib(forCell: PlanetListingTableViewCell.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        showNavBar()
        setNavigationBarTitleWith(L10n.appName)
    }
    
    private func bind() {
        
        // Show hide loading indicator when isLoading emits
        viewModel
            .isLoading
            .observe(on: MainScheduler.instance)
            .skip(1)
            .subscribe(onNext: { [weak self] isLoading in
                guard let self = self else { return }
                isLoading ? self.showLoadingIndicator() : self.hideLoadingIndicator()
            })
            .disposed(by: disposeBag)
        
        /// Setting table view delegate
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        /// Biding planets array with table view
        viewModel.planets.bind(to: tableView.rx.items(cellIdentifier: "PlanetListingTableViewCell", cellType: PlanetListingTableViewCell.self)) { row, item, cell in
            cell.setData(item)
        }.disposed(by: disposeBag)
        
        // Show seleted planet
        tableView.rx.modelSelected(Planet.self).subscribe(onNext: { planet in
            self.viewModel.showPlanerDetails(with: planet)
        }).disposed(by: disposeBag)
        
        /// Error binding. Show error messages when errors emits
        viewModel.errors.drive(errorBinding).disposed(by: disposeBag)
        
        /// calling fetch planets api
        viewModel.fetchPlanets()
    }
    
}

