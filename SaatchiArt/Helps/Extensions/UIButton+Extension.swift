//
//  UIButton+Extension.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/26/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import Foundation
extension UIButton{
    func alignImageRight() {
        if let titleLabel = self.titleLabel, let imageView = self.imageView {
            // Force the label and image to resize.
            titleLabel.sizeToFit()
            imageView.sizeToFit()
            imageView.contentMode = .scaleAspectFit
            
            // Set the insets so that the title appears to the left and the image appears to the right.
            // Make the image appear slightly off the top/bottom edges of the button.
            self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -1 * imageView.frame.size.width,
                                                bottom: 0, right: imageView.frame.size.width + 10)
            self.imageEdgeInsets = UIEdgeInsets(top: 4, left: titleLabel.frame.size.width,
                                                bottom: 4, right: -1 * titleLabel.frame.size.width)
        }
    }
}
