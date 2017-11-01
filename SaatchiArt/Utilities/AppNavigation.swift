//
//  AppNavigation.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/27/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import Foundation


struct AppNavigation {
    static func pushArtListVC(from viewController: UIViewController){
        let storyboard = UIStoryboard(name: "Browse", bundle: nil)
        let artListVC = storyboard.instantiateViewController(withIdentifier: "ImageListVC") as! ImageListVC
        artListVC.isHiddenNavigation = false
        viewController.navigationController?.pushViewController(artListVC, animated: true)
    }
}
