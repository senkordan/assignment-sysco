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
    
    private func bind() {
        
        _ = viewModel.isLoading.subscribe(onNext: { isLoading in
            DispatchQueue.main.async(execute: {
                isLoading ? self.showLoadingIndicator() : self.hideLoadingIndicator()
            })
        }).disposed(by: disposeBag)
        
        tableView.rx.setDelegate(self).disposed(by: disposeBag)
        
        viewModel.planets.bind(to: tableView.rx.items(cellIdentifier: "PlanetListingTableViewCell", cellType: PlanetListingTableViewCell.self)) { row, item, cell in
            cell.setData(item)
        }.disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Planet.self).subscribe(onNext: { planet in
            self.viewModel.showPlanerDetails(with: planet)
        }).disposed(by: disposeBag)
        
        viewModel.errors.drive(errorBinding).disposed(by: disposeBag)
       
        viewModel.fetchPlanets()
    }

}

