//
//  UIFontExtension.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-17.
//

import UIKit

extension UIFont {
    
    /// !!! Note that scaling an already scaled font will cause an exception.
    var scaled: UIFont {
        if #available(iOS 11.0, *) {
            return UIFontMetrics.default.scaledFont(for: self)
        } else {
            return self
        }
    }
    
}
