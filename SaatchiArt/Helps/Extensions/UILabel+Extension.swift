//
//  UILabel+Extension.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/26/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import Foundation
import UIKit
extension UILabel {
    var defaultFont: UIFont? {
        get { return self.font }
        set { self.font = newValue }
    }
    func textHeight(for width: CGFloat) -> CGFloat {
        guard let text = text else {
            return 0
        }
        return text.height(for: width, font: font)
    }
    
    func attributedTextHeight(for width: CGFloat) -> CGFloat {
        guard let attributedText = attributedText else {
            return 0
        }
        return attributedText.height(for: width)
    }
}
