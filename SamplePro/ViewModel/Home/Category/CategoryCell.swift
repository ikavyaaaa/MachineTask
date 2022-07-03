//
//  CategoryCollectionViewCell.swift
//  SamplePro
//
//  Created by Kavya on 02/07/22.
//

import UIKit
import Kingfisher

class CategoryCell: UITableViewCell {
    
    var dict : [String : Any] = [:]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "CategoryCollectionCell",bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}
//MARK: - collectionView DataSource and Delegate
extension CategoryCell :  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (dict["values"] as! NSArray).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionCell", for: indexPath) as! CategoryCollectionCell
        let array = dict["values"] as! NSArray
        let myDict : [String : Any] = array[indexPath.row] as! [String : Any]
        cell.lbl.text = myDict["name"] as? String
        let imgURL = myDict["image_url"] as! String
        cell.imgView.kf.setImage(with: URL(string: imgURL))
        cell.imgView.contentMode = .scaleAspectFit
        cell.imgView.layer.cornerRadius = cell.imgView.frame.size.width/2
        cell.imgView.backgroundColor = self.colorsOfCharts()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 94, height: 120)
    }
    
    
    private func colorsOfCharts() -> UIColor {
        let red = Double(arc4random_uniform(256))
        let green = Double(arc4random_uniform(256))
        let blue = Double(arc4random_uniform(256))
        return UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
    }
}
