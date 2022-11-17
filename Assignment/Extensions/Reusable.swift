//
//  Reusable.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-17.
//

import Foundation

import UIKit

protocol Reusable {
    static var reuseID: String {get}
}

extension Reusable {
    static var reuseID: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: reuseID, bundle: nil)
    }
}

extension UICollectionViewCell: Reusable {}

extension UITableViewCell: Reusable {}

extension UITableViewHeaderFooterView: Reusable {}

