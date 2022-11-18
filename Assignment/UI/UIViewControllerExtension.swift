//
//  UIViewControllerExtension.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-17.
//

import UIKit


enum NavBarItem {
    case backButton(target: Any?, action: Selector?)
    case button(image: UIImage, target: Any?, action: Selector?, color: UIColor = ColorName.black.color)
    case textbutton(title: String, target: Any?, action: Selector?)
}

extension UIViewController {
    
    func hideNavBar(animated: Bool = false) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    /// Sets componets of navigation bar
    /// - Parameters:
    ///   - leftItem: left nav bar items
    ///   - rightItem: right navbat items
    ///   - clearBackground: defines whether tansculant or not
    ///   - animated: adding default animation
    func showNavBar(leftItem: NavBarItem? = nil,
                    rightItem: [NavBarItem]? = nil,
                    clearBackground: Bool = false,
                    animated: Bool = true) {
        
        assert(navigationController != nil, "ViewController does not have a navigationController.")
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.barTintColor = ColorName.white.color
        navigationController?.navigationBar.shadowImage = UIImage()
        
        if let leftItem = leftItem {
            setNavBarLeftItem(leftItem)
        }
        
        setNavBarRightItems(rightItem)
        
        if clearBackground {
            makeNavBarClear()
        }
    }
    
    func setNavBarLeftItem(_ leftItem: NavBarItem?) {
        let leftBarButtonItem = barButtonItemFor(navItem: leftItem)
        navigationItem.setLeftBarButton(leftBarButtonItem, animated: false)
    }
    
    /// Sets a customized view in title area
    /// - Parameter titleView: customized view
    func setNavBarTitleItem(_ titleView: UIView) {
        navigationItem.titleView = titleView
    }
    
    func setNavBarRightItems(_ rightItems: [NavBarItem]?) {
        
        var rightBarButtonItems: [UIBarButtonItem] = []
        
        guard let righBarItems = rightItems else {
            return
        }
        
        for uiBarItem in righBarItems {
            
            guard let rightBarButtonItem = barButtonItemFor(navItem: uiBarItem) else {
                return
            }
            
            rightBarButtonItems.append(rightBarButtonItem)
        }
        
        navigationItem.setRightBarButtonItems(rightBarButtonItems, animated: true)
    }
    
    func makeNavBarClear() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }
    
    /// Sets tile to nav var
    /// - Parameter navTitle: title
    func setNavigationBarTitleWith(_ navTitle: String) {
        navigationItem.title = navTitle
    }
    
    
    func barButtonItemFor(navItem: NavBarItem?) -> UIBarButtonItem? {
        
        guard let navItem = navItem else {
            return nil
        }
        
        switch navItem {
        case .backButton(target: let target, action: let action):
            return makeBackButton(target: target, action: action, color: ColorName.black.color)
        case .button(let image, let target, let action, let color):
            return makeButton(image: image, target: target, action: action, color: color)
        case .textbutton(title: let title, target: let target, action: let action):
            return makeTextButton(title: title, target: target, action: action)
        }
    }
    
    private func makeBackButton(target: Any?, action: Selector?, color: UIColor) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem(image: Asset.backButtonIcon.image,
                                            style: .plain,
                                            target: target,
                                            action: action)
        barButtonItem.tintColor = color
        return barButtonItem
    }
    
    private func makeButton(image: UIImage, target: Any?, action: Selector?, color: UIColor) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem(image: image, style: .plain, target: target, action: action)
        barButtonItem.tintColor = color
        return barButtonItem
    }
    
    private func makeView(_ view: UIView) -> UIBarButtonItem {
        return UIBarButtonItem(customView: view)
    }
    
    private func makeTextButton(title: String, target: Any?, action: Selector?) -> UIBarButtonItem {
        let barButtonItem = UIBarButtonItem(title: title, style: .plain, target: target, action: action)
        barButtonItem.tintColor = .white
        return barButtonItem
    }
    
}


