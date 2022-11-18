//
//  StringAttributes.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-17.
//

import UIKit

struct StringAttributes {
    
    /// Dictonary of Attributes strings. Holds font, color, aligment
    /// - Parameters:
    ///   - typographyStyle: typographyStyle
    ///   - alignment: alignment
    /// - Returns: Attributed strings
    static func attributes(for typographyStyle: TypographyStyle,
                           alignment: NSTextAlignment = .left) -> [NSAttributedString.Key: Any] {
        
        var attributes: [NSAttributedString.Key: Any] = [:]
        
        attributes[.font] = FontSize.font(for: typographyStyle).scaled
        attributes[.foregroundColor] = colorsForTypographyStyles(for: typographyStyle).color
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = alignment
        
        attributes[.paragraphStyle] = paragraphStyle
        
        return attributes
    }
    
    /// sets color for each typography styles
    /// - Parameter typographyStyle: typographyStyle
    /// - Returns: UIcolor
    private static func colorsForTypographyStyles(for typographyStyle: TypographyStyle) -> ColorName {
        
        switch typographyStyle {
            
        /// Color: Black
        case .Heading, .SubHeading:
            return ColorName.black
       
        /// Color: MediumGrey
        case .Body:
            return ColorName.mediumGrey

        }
    }
}


