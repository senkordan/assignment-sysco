//
//  Fonts.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-17.
//

import Foundation
import UIKit

struct FontSize {
    
    /// Sets font size for each typography styles
    /// - Parameter typographyStyle: typographyStyle
    /// - Returns: UIFont with specifc size and font family
    static func font(for typographyStyle: TypographyStyle) -> UIFont {
        switch typographyStyle {
            case .Heading:
                return semiBold(size: 18.0)
            case .SubHeading:
                return semiBold(size: 15.0)
            case .Body:
                return regualr(size: 15.0)
        }
    }
    
    private static func semiBold(size: CGFloat) -> UIFont {
        return FontFamily.OpenSans.semiBold.font(size: size)
    }
    
    private static func regualr(size: CGFloat) -> UIFont {
        return FontFamily.OpenSans.regular.font(size: size)
    }
    
}
