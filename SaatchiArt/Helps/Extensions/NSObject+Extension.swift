//
//  NSObject+Extension.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/27/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import Foundation
// Swizzling
extension NSObject {
    class func swizzlingMethods(origSelector: Selector, withSelector: Selector, forClass: AnyClass) {
        guard let originalMethod = class_getInstanceMethod(forClass, origSelector),
            let swizzledMethod = class_getInstanceMethod(forClass, withSelector) else { return }
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }
    
    func swizzleMethods(origSelector: Selector, withSelector: Selector) {
        let aClass: AnyClass! = object_getClass(self)
        NSObject.swizzlingMethods(origSelector: origSelector, withSelector: withSelector, forClass: aClass)
    }
}
