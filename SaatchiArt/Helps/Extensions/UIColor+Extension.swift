//
//  UIColor+Extension.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/24/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import Foundation
extension UIColor {
    convenience init(rgb red: Int, _ green: Int, _ blue: Int, alpha: CGFloat) {
        let redPart: CGFloat = CGFloat(red) / 255
        let greenPart: CGFloat = CGFloat(green) / 255
        let bluePart: CGFloat = CGFloat(blue) / 255
        self.init(red: redPart, green: greenPart, blue: bluePart, alpha: alpha)
    }
}
