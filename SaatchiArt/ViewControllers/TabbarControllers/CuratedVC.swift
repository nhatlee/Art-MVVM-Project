//
//  CuratedVC.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/23/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit

final class CuratedVC: UIViewController {
    @IBOutlet weak var clvCurated: UICollectionView!
    
    let viewModel = CuratedViewModel()
    
    private var listDummyData:[ArtModel] = [] {
        didSet{
            clvCurated.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listDummyData = viewModel.loadData()
        clvCurated.addPullToRefresh { [weak self] in
            guard let strongSelf = self else{ return }
            strongSelf.listDummyData += strongSelf.viewModel.loadData()
            strongSelf.clvCurated.pullToRefreshView.stopAnimating()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension CuratedVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listDummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CuratedCustomCell", for: indexPath) as! CuratedCustomCell
        let obj = listDummyData[indexPath.row]
        cell.loadData(obj)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constant.ScreenSize.width - 20, height: 160)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        AppNavigation.pushArtListVC(from: self)
    }
    
}
