//
//  AnimatedContentsDisplayLayer.swift
//  Layers
//
//  Created by Rene Cacheaux on 4/23/15.
//  Copyright (c) 2015 Razeware LLC. All rights reserved.
//

import UIKit
import AsyncDisplayKit

final class AnimatedContentsDisplayLayer: _ASDisplayLayer {
    

    override func action(forKey event: String) -> CAAction? {
//    if let _ = super.actionForKey(event) {
//      return nil
//    }
    
    if event == "contents" && contents == nil {
      let transition = CATransition()
      transition.duration = 0.3
      transition.type = kCATransitionFade
      return transition
    }
    
    return nil
  }
}
