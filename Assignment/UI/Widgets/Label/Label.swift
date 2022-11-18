//
//  PrimaryLabel.swift
//  Assignment
//
//  Created by Senkordan Satchithananthan on 2022-11-17.
//

import UIKit

class Label: UILabel {
    
    private var attributes = StringAttributes.attributes(for: .body)
    
    private var typograpyStyle: TypographyStyle!
    private var alignment: NSTextAlignment!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure() {
        adjustsFontForContentSizeCategory = true
        numberOfLines = 0
    }
    
    /// Must be called after setting the attributed text
    func setNumberOfLines(_ numOfLines: Int, breakMode: NSLineBreakMode = .byTruncatingTail) {
        numberOfLines = numOfLines
        lineBreakMode = breakMode
    }
    
    /// This can be called after assigning typography style to set text directly
    /// - Parameter text: text to be set
    func setText(_ text: String) {
        self.text = text
        setLetterSpacing()
    }
    
    /// This will be called initially to assign a typograply style, text and alignment to the custom label
    /// - Parameters:
    ///   - text: text to be set
    ///   - typographyStyle: This holds the color, font and font size
    ///   - alignment: aligment
    func set(_ text: String = "", typographyStyle: TypographyStyle, alignment: NSTextAlignment = .left) {
        self.typograpyStyle = typographyStyle
        self.alignment = alignment
        self.text = text
        accessibilityLabel = text
        
        self.attributes = StringAttributes.attributes(for: typographyStyle, alignment: alignment)
        
        setLetterSpacing()
    }
    
    /// This helps to higlight texts in a specific ranges
    /// - Parameters:
    ///   - text: Initials text that needs to be highlighted in specific ranges
    ///   - coloredSections: texts that needs to be higlighted
    ///   - color: higlight color
    func setText(_ text: String,
                 withColoredTextSections coloredSections: [String], color: UIColor = ColorName.mediumGrey.color) {
        
        let attributes = StringAttributes.attributes(for: .subHeading, alignment: .left)
        
        let attributedFullString = NSMutableAttributedString(string: text,
                                                             attributes: attributes)
        
        coloredSections.forEach { section in
            let rangeOfSection = attributedFullString.mutableString.range(of: section)
            attributedFullString.addAttribute(.foregroundColor,
                                              value: color,
                                              range: rangeOfSection)
        }
        
        attributedText = attributedFullString
        
        accessibilityLabel = text
    }
    
    /// set letter spacing
    func setLetterSpacing() {
        let attributedString = NSMutableAttributedString(string: self.text ?? "", attributes: self.attributes)
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        paragraphStyle.alignment = alignment
        
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: self.text?.count ?? 0))
        
        attributedText = attributedString
    }
    
    /// Set letter spacing for each typography style
    /// - Parameter typographyStyle: typograpy style
    /// - Returns: letter spacing value
    private func letterSpacingForTypographyStyle(for typographyStyle: TypographyStyle) -> CGFloat {
        switch typographyStyle {
            
        default:
            return 0
        }
    }
    
}


