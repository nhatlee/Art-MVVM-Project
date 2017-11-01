//
//  ArtInfoCell.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/26/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit

final class ArtInfoCell: UITableViewCell {
    
    @IBOutlet weak var lblArtName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblStyle: UILabel!
    @IBOutlet weak var lblMaterial: UILabel!
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblArtDescription: UILabel!
    static let ArtInforFont = UIFont(name: "Helvetica Neue", size: 15)!
    var item: ArtDetailViewModelProtocol? {
        didSet{
            guard let _item = item as? ArtDetailViewModelInfor else { return }
            //TEST
            print(lblSize.font)
            
            let art = _item.artObj
            lblArtName.text = art.name
            lblPrice.text = art.price
            lblUserName.text = art.artist?.userName
            lblCountry.text = art.place
            lblStyle.text = art.style
            lblMaterial.text = art.metarial
            lblSize.text = art.size
            lblArtDescription.text = art.artDesciption
        }
    }
    
    static func cellHight(_ obj: ArtDetailViewModelProtocol) -> CGFloat {
        guard let _item = obj as? ArtDetailViewModelInfor else { return 0 }
        let item = _item.artObj
        let leftPadding :CGFloat = 5
        let righPadding :CGFloat = 5
        let infoSpacing :CGFloat = 3
        let priceLabelWidth :CGFloat = 70
        let spacingWithDescription :CGFloat = 15
        let cellBottomPadding:CGFloat = 5
         let cellTopPadding:CGFloat = 5
       let cellWidth = UIScreen.main.bounds.size.width - leftPadding - righPadding
        var cellH :CGFloat = 0
        if let name = item.name {
            let nameHeight = name.height(for: cellWidth - priceLabelWidth - 5, font: ArtInforFont)//5 is padding
            cellH += nameHeight
        }
        if let artistName = item.artist?.userName{
            let userNameHeight = artistName.height(for: cellWidth, font: ArtInforFont)
            cellH += userNameHeight
        }
        if let place = item.place {
            let placeH = place.height(for: cellWidth, font: ArtInforFont)
            cellH += placeH
        }
        if let style = item.place {
            let styleH = style.height(for: cellWidth, font: ArtInforFont)
            cellH += styleH
        }
        if let metarial = item.metarial {
            let materialH = metarial.height(for: cellWidth, font: ArtInforFont)
            cellH += materialH
        }
        if let size = item.size {
            let sizeH = size.height(for: cellWidth, font: ArtInforFont)
            cellH += sizeH
        }
        if let artDesciption = item.artDesciption {
            let descH = artDesciption.height(for: cellWidth, font: ArtInforFont)
            cellH += descH
        }
        return (cellH + infoSpacing * 5 + spacingWithDescription + cellBottomPadding + cellTopPadding + 10)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
