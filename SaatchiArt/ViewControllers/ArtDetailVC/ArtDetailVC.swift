//
//  ArtDetailVC.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/26/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit
enum ArtCellType: Int {
    case ArtCellImage
    case ArtCellInfo
    case ArtCellButtons
}
final class ArtDetailVC: UIViewController {
    //Cell reuse identifier
    private let ImageCellIdentifier     = "ArtImageCell"
    private let ArtInfoCellIdentifier   = "ArtInfoCell"
    private let ArtButtonCellIdentifier = "ArtButtonActionCell"
    
    @IBOutlet weak var btnView: UIButton!
    @IBOutlet weak var tbvArt: UITableView!
    
    var viewModel: ArtDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell()
        // Do any additional setup after loading the view.
    }
    
    private func registerCell() {
        tbvArt.dataSource = viewModel
        tbvArt.delegate = viewModel
        tbvArt.register(ArtImageCell.nib, forCellReuseIdentifier: ArtImageCell.identifier)
        tbvArt.register(ArtInfoCell.nib, forCellReuseIdentifier: ArtInfoCell.identifier)
        tbvArt.register(ArtActionsCell.nib, forCellReuseIdentifier: ArtActionsCell.identifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func LikeTap(_ sender: Any) {
    }
    
    @IBAction func viewInRoomTap(_ sender: Any) {
    }
    
    @IBAction func byOriginalTap(_ sender: Any) {
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

//extension ArtDetailVC: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = CellAt(indexPath)
//        return cell
//    }
//
//    private func CellAt(_ indexPath: IndexPath) -> UITableViewCell {
//        switch ArtCellType(rawValue: indexPath.row) {
//        case .ArtCellImage?:
//            let cell = tbvArt.dequeueReusableCell(withIdentifier: ImageCellIdentifier) as! ArtImageCell
//            cell.loadCell(currentArt)
//            return cell
//        case .ArtCellInfo?:
//           let cell = tbvArt.dequeueReusableCell(withIdentifier: ArtInfoCellIdentifier) as! ArtInfoCell
//            return cell
//        case .ArtCellButtons?:
//            let cell = tbvArt.dequeueReusableCell(withIdentifier: ArtButtonCellIdentifier) as! ArtActionsCell
//            return cell
//        default:
//            return UITableViewCell()
//        }
//    }
//}

