//
//  BannersCollectionViewCell.swift
//  SamplePro
//
//  Created by Kavya on 02/07/22.
//

import UIKit

class BannersCell: UITableViewCell {
    
    var dict : [String : Any] = [:]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "BannerCollectionViewCell",bundle: nil), forCellWithReuseIdentifier: "BannerCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
//MARK: - collectionView DataSource and Delegate
extension BannersCell :  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (dict["values"] as! NSArray).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCollectionViewCell", for: indexPath) as! BannerCollectionViewCell
        let array = dict["values"] as! NSArray
        let myDict : [String : Any] = array[indexPath.row] as! [String : Any]
        let imgURL = myDict["banner_url"] as! String
        cell.imgView.kf.setImage(with: URL(string: imgURL))
        cell.imgView.contentMode = .scaleToFill
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 340, height: 181)
    }
    
}
