//
//  ImageListVC.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/24/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit
import CHTCollectionViewWaterfallLayout

private let reuseIdentifier = "ImageListAsyncCell"

final class ImageListVC: UICollectionViewController, CHTCollectionViewDelegateWaterfallLayout {
    private let SegueListArtToDetail = "SegueListArtToDetail"
    
    let nodeConstructionQueue = OperationQueue()
    //Data
    private var listDummyData = [ArtModel]()
    private var selectedArt: ArtModel?
    var isHiddenNavigation = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            listDummyData = try dummy()
        }catch let err{
            print(err)
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
//        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(isHiddenNavigation, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return listDummyData.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ImageListAsyncCell
        let item = listDummyData[indexPath.item]
        cell.configureCellDisplayWithSwopItem(item, nodeConstructionQueue: nodeConstructionQueue)
        cell.backgroundColor = Constant.grayColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constant.ScreenSize.width, height: 190)
    }

    // MARK: UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedArt = listDummyData[indexPath.item]
        self.performSegue(withIdentifier: SegueListArtToDetail, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueListArtToDetail {
            let detailVC = segue.destination as! ArtDetailVC
            if let art = selectedArt{
                detailVC.viewModel = ArtDetailViewModel(art)
            }
        }
    }
    

}
