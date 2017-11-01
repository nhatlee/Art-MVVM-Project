//
//  NodeFramesetter.swift
//  Layers
//
//  Created by René Cacheaux on 9/21/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

final class FrameCalculator {
  class var textAreaHeight: CGFloat {
    return 98.0
  }
  
  class var cardWidth: CGFloat {
    return (UIScreen.main.bounds.width - 34) / 2
  }

  class func frameForDescriptionText(containerBounds: CGRect, featureImageFrame: CGRect) -> CGRect {
    return CGRect(x: 24.0, y: featureImageFrame.maxY + 20.0, width: containerBounds.width - 48.0, height: textAreaHeight)
  }
  
  class func frameForTitleText(containerBounds: CGRect, featureImageFrame: CGRect) -> CGRect {
    let frameForTitleText = CGRect(x: 8, y: featureImageFrame.origin.y - featureImageFrame.height - 6, width: containerBounds.width - 16, height: 80)
    frameForTitleText.insetBy(dx: 20, dy: 20)
    return frameForTitleText
  }
  
  class func frameForGradient(featureImageFrame: CGRect) -> CGRect {
    return featureImageFrame
  }
  
  class func frameForFeatureImage(featureImageSize: CGSize, containerFrameWidth: CGFloat) -> CGRect {
    let imageFrameSize = aspectSizeForWidth(containerFrameWidth, originalSize: featureImageSize)
    return CGRect(x: 0, y: 0, width: imageFrameSize.width, height: imageFrameSize.height)
  }
  
  class func frameForBackgroundImage(containerBounds: CGRect) -> CGRect {
    return containerBounds
  }
  
  class func frameForContainer(featureImageSize: CGSize) -> CGRect {
    let containerWidth: CGFloat = cardWidth
    let size = sizeThatFits(CGSize(width: containerWidth, height: CGFloat.greatestFiniteMagnitude), withImageSize: featureImageSize)
    return CGRect(x: 0, y: 0, width: containerWidth, height: size.height)
  }
  
  class func sizeThatFits(_ size: CGSize, withImageSize imageSize: CGSize) -> CGSize {
    let imageFrameSize = aspectSizeForWidth(size.width, originalSize: imageSize)
    return CGSize(width: size.width, height: imageFrameSize.height + textAreaHeight)
  }
  
  class func aspectSizeForWidth(_ width: CGFloat, originalSize: CGSize) -> CGSize {
    let height =  ceil((originalSize.height / originalSize.width) * width)
    return CGSize(width: width, height: height)
  }
  
}
