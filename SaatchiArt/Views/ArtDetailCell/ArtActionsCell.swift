//
//  ArtButtonActionCell.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/26/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit

final class ArtActionsCell: UITableViewCell {

    @IBOutlet weak var btnAddToFavorites: UIButton!
    
    @IBOutlet weak var btnShareArt: UIButton!
    @IBOutlet weak var btnReport: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func addFavotires(_ sender: Any) {
    }
    
    @IBAction func shareArt(_ sender: Any) {
    }
    
    @IBAction func reportAction(_ sender: Any) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
