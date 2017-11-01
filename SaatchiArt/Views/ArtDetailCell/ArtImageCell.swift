//
//  ArtImageCell.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/26/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit
import Kingfisher

final class ArtImageCell: UITableViewCell {
    @IBOutlet weak var imvArt: UIImageView!
    
    var item: ArtDetailViewModelProtocol? {
        didSet{
            guard let item = item as? ArtDetailViewModelImage else { return }
            let url = URL(string: item.pictureUrl)
            imvArt.kf.setImage(with: url)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadCell(_ art: ArtModel?) {
        guard let urlString = art?.url, let url = URL(string: urlString) else{ return }
        imvArt.kf.setImage(with: url)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
