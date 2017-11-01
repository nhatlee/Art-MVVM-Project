//
//  ImageListAsyncCell.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/24/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit
import AsyncDisplayKit
import SDWebImage

final class ImageListAsyncCell: UICollectionViewCell {
    var featureImageSizeOptional: CGSize?
    var placeholderLayer: CALayer!
    var contentLayer: CALayer?
    var containerNode: ASDisplayNode?
    var nodeConstructionOperation: Operation?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.clear
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        if let operation = nodeConstructionOperation {
            operation.cancel()
        }
        containerNode?.recursivelySetDisplaySuspended(true)
        contentLayer?.removeFromSuperlayer()
        contentLayer = nil
        containerNode = nil
    }
    
    func configureCellDisplayWithSwopItem(_ item: ArtModel, nodeConstructionQueue: OperationQueue) {
        if let oldNodeConstructionOperation = nodeConstructionOperation {
            oldNodeConstructionOperation.cancel()
        }
        //MARK: Image Size Section
        featureImageSizeOptional = CGSize(width: Constant.ScreenSize.width, height: 135)
        let newNodeConstructionOperation = nodeConstructionOperationWithSwopItem(item, imageSize: featureImageSizeOptional!)
        nodeConstructionOperation = newNodeConstructionOperation
        nodeConstructionQueue.addOperation(newNodeConstructionOperation)
    }
    
    func nodeConstructionOperationWithSwopItem(_ item: ArtModel, imageSize: CGSize) -> Operation {
        let nodeBlockOperation = BlockOperation()
        nodeBlockOperation.addExecutionBlock {
            [weak self, weak nodeBlockOperation] in
            guard let strongNodeBlockOperation = nodeBlockOperation else {return}
            if strongNodeBlockOperation.isCancelled {
                return
            }
            guard let strongSelf = self else{ return }
            //MARK: Node Creation Section
            let backgroundNode = ASDisplayNode()
            backgroundNode.backgroundColor = Constant.grayColor
            backgroundNode.isLayerBacked = true
            
            
            //MARK: Container Node Creation Section
            let containerNode = ASDisplayNode(layerBlock: { () -> CALayer in
                return AnimatedContentsDisplayLayer()
            })
            containerNode.backgroundColor = Constant.grayColor
            //                containerNode.shouldRasterizeDescendants = true
            containerNode.clipsToBounds = true
            
            
            let featureImageNode = ASNetworkImageNode()
            featureImageNode.isLayerBacked = true
            //featureImageNode.contentMode = .ScaleAspectFit
            featureImageNode.contentMode = .scaleAspectFill
            
            if let imageUrl = item.url {
                SDWebImageManager.shared().loadImage(with: URL(string: imageUrl), options: .retryFailed, progress: nil, completed: { (image, data, error, cacheType, bool, url) in
                    if(image != nil) {
                        featureImageNode.image = image
                    } else {
                        featureImageNode.image = nil
                    }
                })
            }
            
            let itemNameNode = ASTextNode()
            itemNameNode.isLayerBacked = true
            itemNameNode.backgroundColor = UIColor.clear
            itemNameNode.attributedText = NSAttributedString.attributedStringForTitleText(item.name ?? "")
            
            let artistName = ASTextNode()
            artistName.isLayerBacked = true
            artistName.backgroundColor = UIColor.clear
            let aritistString = "By \(item.artist?.userName ?? "")"
            let atributeString = NSMutableAttributedString.attributedStringForTitleText(aritistString)
            atributeString.setColorForText(textToFind: item.artist?.userName ?? "", withColor: UIColor.blue)
            artistName.attributedText = atributeString
            //MARK: Node Hierarchy Section
            
            let priceTextNode = ASTextNode()
            priceTextNode.isLayerBacked = true
            priceTextNode.backgroundColor = UIColor.clear
            let priceStr = "$\(item.price ?? "")"
            priceTextNode.attributedText = NSMutableAttributedString.attributedStringForTitleText(priceStr)
            
            containerNode.addSubnode(backgroundNode)
            containerNode.addSubnode(featureImageNode)
            containerNode.addSubnode(itemNameNode)
            containerNode.addSubnode(artistName)
            containerNode.addSubnode(priceTextNode)
            
            //MARK: Node Layout Section
            //Same size with cell
            containerNode.frame = CGRect(x: 0, y: 0, width: Constant.ScreenSize.width, height: 195)
            
            featureImageNode.frame = CGRect(x: 0, y: 5, width: imageSize.width, height: imageSize.height)
            
            backgroundNode.frame = featureImageNode.frame
            
            let cellWidth = containerNode.frame.size.width
            
            let titleHeight = itemNameNode.layoutThatFits(ASSizeRangeMake(CGSize.zero, CGSize(width: cellWidth - 16, height: CGFloat.greatestFiniteMagnitude))).size.height
            
            itemNameNode.frame = CGRect(x: 8, y: featureImageNode.frame.origin.y + featureImageNode.frame.size.height + 6, width: cellWidth - 55, height: titleHeight)
            
            priceTextNode.frame = CGRect(x: itemNameNode.frame.size.width + 5, y: itemNameNode.frame.origin.y, width: 60, height: 18)
            artistName.frame = CGRect(x: itemNameNode.frame.origin.x, y: itemNameNode.frame.origin.y + 3 + itemNameNode.frame.size.height, width: cellWidth - 16, height: itemNameNode.frame.size.height)
            
            DispatchQueue.main.async { [weak strongNodeBlockOperation] in
                if let strongNodeConstructionOperation = strongNodeBlockOperation {
                    if strongNodeConstructionOperation.isCancelled {
                        return
                    }
                    if strongSelf.nodeConstructionOperation !== strongNodeConstructionOperation {
                        return
                    }
                    //MARK: Node Layer and Wrap Up Section
                    strongSelf.contentView.layer.addSublayer(containerNode.layer)
                    containerNode.setNeedsDisplay()
                    strongSelf.contentLayer = containerNode.layer
                    strongSelf.containerNode = containerNode
                }
            }
        }
        return nodeBlockOperation
    }
}
