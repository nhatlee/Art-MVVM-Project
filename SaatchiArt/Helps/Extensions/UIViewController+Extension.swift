//
//  UIViewController+Extension.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/24/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import Foundation

private let swizzling: (AnyClass, Selector, Selector) -> () = { forClass, originalSelector, swizzledSelector in
    guard let originalMethod = class_getInstanceMethod(forClass, originalSelector),
        let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector) else { return }
    method_exchangeImplementations(originalMethod, swizzledMethod)
}

extension UIViewController {
    
    static let classInit: Void = {
        let originalSelector = #selector(viewWillAppear(_:))
        let swizzledSelector = #selector(swizzled_viewWillAppear)
        swizzling(UIViewController.self, originalSelector, swizzledSelector)
    }()
    
    @objc func swizzled_viewWillAppear(animated: Bool) {
        self.swizzled_viewWillAppear(animated: animated)
       configStatusBar()
    }
    func configStatusBar(){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: Constant.ScreenSize.size.width, height: 20))
        view.backgroundColor = UIColor.init(rgb: 51, 51, 51, alpha: 1.0)
        self.view.addSubview(view)
    }
}
