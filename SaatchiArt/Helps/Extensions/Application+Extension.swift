//
//  ApplicationExtention.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/24/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import Foundation
extension UIApplication {
    
    
    static func configAppAppearance() {
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white,  NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)]
        UINavigationBar.appearance().tintColor = UIColor.white
        UINavigationBar.appearance().barTintColor = UIColor.init(rgb: 51, 51, 51, alpha: 1.0)
//        UINavigationBar.appearance().isTranslucent = false
//        UIApplication.shared.statusBarStyle = .default
//        UIBarButtonItem.appearance().setBackButtonTitlePositionAdjustment(UIOffsetMake(0, -60), for:UIBarMetrics.default)
    }
    
    final class func topViewController(_ viewController: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = viewController as? UINavigationController {
            return topViewController(nav.visibleViewController)
        }
        if let tab = viewController as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(selected)
            }
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(presented)
        }
        return viewController
    }
}
