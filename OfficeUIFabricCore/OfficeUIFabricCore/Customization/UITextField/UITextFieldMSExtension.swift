// Copyright (c) Microsoft Corporation. All rights reserved. Licensed under the MIT license. See LICENSE in the project root for license information.

import UIKit

extension UITextField {
    
    // MARK: TextField Background
    
    public func msTextFieldBox(borderColor: UIColor = UIColor.msNeutralSecondaryAlt(), backgroundColor: UIColor = UIColor.clear, leftPadding: CGFloat = MSTextFieldConstants.DefaultPadding) {
        self.borderStyle = UITextBorderStyle.none
        self.background = UIImage.msTextFieldBoxBackground(borderColor: borderColor, fillColor: backgroundColor)
        self.setLeftPadding(padding: leftPadding)
    }
    
    public func msTextFieldUnderline(borderColor: UIColor = UIColor.msNeutralSecondaryAlt(), backgroundColor: UIColor = UIColor.clear, leftPadding: CGFloat = MSTextFieldConstants.DefaultPadding) {
        self.borderStyle = UITextBorderStyle.none
        self.background = UIImage.msTextFieldUnderlineBackground(borderColor: borderColor, fillColor: backgroundColor)
        self.setLeftPadding(padding: leftPadding)
    }
    
    private func setLeftPadding(padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: 0))
        self.leftView = paddingView
        self.leftViewMode = UITextFieldViewMode.always
    }
    
    // MARK: TextField Font Style
    
    public func msTextFieldFontStyles(style: MSFontStyle = MSFontStyle.L, textColor: UIColor = UIColor.msNeutralPrimary()) {
        self.msTextFieldFontStyles(style: style, fontWeight: MSFontConstants.msPreferredFontWeight(style: style), textColor: textColor)
    }
    
    public func msTextFieldFontStyles(style: MSFontStyle = MSFontStyle.L, fontWeight: MSFontWeight, textColor: UIColor = UIColor.msNeutralPrimary()) {
        self.msTextFieldFontStyles(font: UIFont.msFont(style: style, weight: fontWeight), textColor: textColor)
    }
    
    public func msTextFieldFontStyles(font: UIFont?, textColor: UIColor = UIColor.msNeutralPrimary()) {
        self.font = font
        self.textColor = textColor
    }
    
    // MARK: TextField Placeholder Text
    
    public func msTextFieldPlaceholderText(text: String, placeholderColor: UIColor = UIColor.msNeutralSecondary(), font: UIFont? = nil) {
        if let font = font {
            self.attributedPlaceholder = NSAttributedString(string: text, attributes: [
                NSForegroundColorAttributeName: placeholderColor,
                NSFontAttributeName: font
            ]);
        } else {
            self.attributedPlaceholder = NSAttributedString(string: text, attributes: [
                NSForegroundColorAttributeName: placeholderColor
            ]);
        }
    }
    
    // MARK: Permament Placeholder Text
    
    public func msTextFieldPermanentPlaceholderText(text: String, placeholderColor: UIColor = UIColor.msNeutralSecondary(), font: UIFont? = nil, padding: CGFloat = MSTextFieldConstants.DefaultPadding * 2) {
        let placeholderLabel = UILabel()
        if let font = font ?? self.font {
            placeholderLabel.font = font
        }
        placeholderLabel.textColor = placeholderColor
        placeholderLabel.text = text
        placeholderLabel.sizeToFit()
        placeholderLabel.textAlignment = .center
        placeholderLabel.frame = CGRect(
            origin: placeholderLabel.frame.origin,
            size: CGSize(width: placeholderLabel.frame.width + padding, height: self.frame.size.height)
        )
        self.leftView = placeholderLabel
        self.leftViewMode = UITextFieldViewMode.always
    }
}
