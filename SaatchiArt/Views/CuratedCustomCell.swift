//
//  CuratedCustomCell.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/23/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit
import Kingfisher
/*/https://cdn3.ivivu.com/2013/09/du-lich-da-lat-ivivu.com-3.jpg
 https://www.citypassguide.com/media/slideshow/0-bao-dai-summer-palace-in-dalat-vietnam-da-lat.jpg
 https://vietnamtravel.deals/wp-content/uploads/2016/02/5330703404_5251623633_b.jpg
 */
final class CuratedCustomCell: UICollectionViewCell {
    
    @IBOutlet weak var imvBig: UIImageView!
    @IBOutlet weak var imvTop: UIImageView!
    @IBOutlet weak var imvBottom: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    func loadData(_ obj: ArtModel) {
        if let urlStr = obj.url{
            let url1 = URL(string: urlStr)
            imvBig.kf.setImage(with: url1)
        }
        let url2 = URL(string: "https://www.citypassguide.com/media/slideshow/0-bao-dai-summer-palace-in-dalat-vietnam-da-lat.jpg")
        imvTop.kf.setImage(with: url2)
        let url3 = URL(string: "https://vietnamtravel.deals/wp-content/uploads/2016/02/5330703404_5251623633_b.jpg")
        imvBottom.kf.setImage(with: url3)
        lblDescription.text = obj.name ?? ""
    }
}
