//
//  Factories.swift
//  Layers
//
//  Created by René Cacheaux on 10/11/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import Foundation
extension NSMutableAttributedString {
    func setColorForText(textToFind: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textToFind, options: .caseInsensitive)
        self.addAttribute(NSAttributedStringKey.foregroundColor, value: color, range: range)
    }
}

extension NSAttributedString {
    class func attributedStringForTitleText(_ text: String) -> NSMutableAttributedString {
        let titleAttributes =
            [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14),
             NSAttributedStringKey.foregroundColor: UIColor.black]
        return NSMutableAttributedString(string: text, attributes: titleAttributes)
    }
    
    class func attributedStringForAddressText(_ text: String) -> NSAttributedString {
        let descriptionAttributes =
            [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14),
             NSAttributedStringKey.foregroundColor: UIColor.darkGray]
        return NSAttributedString(string: text, attributes: descriptionAttributes)
    }
    
    class func attributedStringForWishListText(_ text: String, _ color: UIColor) -> NSAttributedString {
        let descriptionAttributes =
            [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14),
             NSAttributedStringKey.foregroundColor: color]
        return NSAttributedString(string: text, attributes: descriptionAttributes)
    }
    
    class func attributedStringForPriceText(_ text: String) -> NSAttributedString {
        let descriptionAttributes =
            [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15),
             NSAttributedStringKey.foregroundColor: UIColor.blue]
        return NSAttributedString(string: text, attributes: descriptionAttributes)
    }
    
    class func attributedStringForSwopType(_ text: String, _ color: UIColor) -> NSAttributedString {
        let descriptionAttributes =
            [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 14),
             NSAttributedStringKey.foregroundColor: color]
        return NSAttributedString(string: text, attributes: descriptionAttributes)
    }
}

extension NSParagraphStyle {
  class func justifiedParagraphStyle() -> NSParagraphStyle {
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.alignment = .justified
    return paragraphStyle.copy() as! NSParagraphStyle
  }
}

extension NSShadow {
  class func titleTextShadow() -> NSShadow {
    let shadow = NSShadow()
    shadow.shadowColor = UIColor(hue: 0, saturation: 0, brightness: 0, alpha: 0.3)
    shadow.shadowOffset = CGSize(width: 0, height: 2)
    shadow.shadowBlurRadius = 3.0
    return shadow
  }
  
  class func descriptionTextShadow() -> NSShadow {
    let shadow = NSShadow()
    shadow.shadowColor = UIColor(white: 0.0, alpha: 0.3)
    shadow.shadowOffset = CGSize(width: 0, height: 1)
    shadow.shadowBlurRadius = 3.0
    return shadow
  }
}
