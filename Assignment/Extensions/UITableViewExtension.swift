//
//  UITableViewExtension.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-17.
//

import UIKit

extension UITableView {
    
    /// MARK: - Register Cells
    
    func registerClass<T: UITableViewCell>(forCell type: T.Type) {
        let className = String(describing: type)
        register(type, forCellReuseIdentifier: className)
    }
    
    func registerClass<T: UITableViewHeaderFooterView>(forView type: T.Type) {
        let className = String(describing: type)
        register(type, forHeaderFooterViewReuseIdentifier: className)
    }
    
    func registerNib<T: UITableViewCell>(forCell type: T.Type) {
        let className = String(describing: type)
        register(type.nib, forCellReuseIdentifier: className)
    }
    
    func registerNib<T: UITableViewHeaderFooterView>(forView type: T.Type) {
        let className = String(describing: type)
        register(type.nib, forHeaderFooterViewReuseIdentifier: className)
    }
    
    /// MARK: - Dequeue Cells
    
    func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type) -> T {
        let className = String(describing: type)
        let cell = dequeueReusableCell(withIdentifier: className) as? T
        return cell!
    }
    
    func dequeueReusableView<T: UITableViewHeaderFooterView>(_ type: T.Type) -> T {
        let className = String(describing: type)
        let view = dequeueReusableHeaderFooterView(withIdentifier: className) as? T
        return view!
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withIdentifier: T.reuseID, for: indexPath) as? T
        return cell!
    }
}



