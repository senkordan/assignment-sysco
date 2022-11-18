//
//  RootViewController.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-17.
//

import UIKit
import SVProgressHUD
import RxCocoa
import RxSwift

class RootViewController: UIViewController {

    let disposeBag = DisposeBag()
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    
    /// Reative wat to show error messages error emits
    var errorBinding: Binder<Error> {
        return Binder(self, binding: { (vc, error) in
           self.showErrorMessage(errorMessage: error.parse())
        })
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = ColorName.white.color
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    /// Show error as alert dialogs
    /// - Parameter errorMessage: error message
    func showErrorMessage(errorMessage: String) {
        let alert = UIAlertController(title: L10n.error, message: errorMessage, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: L10n.ok, style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }

    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
        }
    }
    
    func showLoadingIndicator() {
        SVProgressHUD.show()
    }
    
    func hideLoadingIndicator() {
        SVProgressHUD.dismiss()
    }
    
}
