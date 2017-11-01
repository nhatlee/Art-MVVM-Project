//
//  UIFont+Extension.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/24/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    class func systemFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue", size: size)!
    }
    
    class func italicSystemFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Italic", size: size)!
    }
    
    class func boldSystemFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: size)!
    }
    
    class func mediumSystemFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Medium", size: size)!
    }
    
    class func lightSystemFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Light", size: size)!
    }
    
    class func thinSystemFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-Thin", size: size)!
    }
    
    class func ultraLightSystemFontOfSize(size: CGFloat) -> UIFont {
        return UIFont(name: "HelveticaNeue-UltraLight", size: size)!
    }
    
    class func preferredFontForTextStyle(style: String) -> UIFont {
        switch UIFontTextStyle.init(rawValue: style) {
        case .body:
            return UIFont.systemFont(ofSize: 15)
        case .headline:
            return UIFont.lightSystemFontOfSize(size: 30)
        case .subheadline:
            return UIFont.lightSystemFontOfSize(size: 17)
        case .footnote:
            return UIFont.systemFont(ofSize: 13)
        case .caption1:
            return UIFont.systemFont(ofSize: 12)
        case .caption2:
            return UIFont.systemFont(ofSize: 11)
        default:
            return UIFont.systemFont(ofSize: 15)
        }
    }
}
