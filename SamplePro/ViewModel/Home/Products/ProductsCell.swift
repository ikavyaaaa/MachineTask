//
//  ProductsCollectionViewCell.swift
//  SamplePro
//
//  Created by Kavya on 02/07/22.
//

import UIKit
import Kingfisher

class ProductsCell: UITableViewCell {
    
    var dict : [String : Any] = [:]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "ProductsCollectionViewCell",bundle: nil), forCellWithReuseIdentifier: "ProductsCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}
//MARK: - collectionView DataSource and Delegate
extension ProductsCell :  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (dict["values"] as! NSArray).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductsCollectionViewCell", for: indexPath) as! ProductsCollectionViewCell
        let array = dict["values"] as! NSArray
        let myDict : [String : Any] = array[indexPath.row] as! [String : Any]
        cell.lblName.text = myDict["name"] as? String
       
        
        //Actual price strikethrough text
        let actualPrice = myDict["actual_price"] as? String
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: actualPrice!)
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        cell.lblActualPrice.attributedText = attributeString
        let offerPrice = myDict["offer_price"] as? String
        cell.lblOfferPrice.text = offerPrice
        //If the actual price and offer price is the same, then don’t show the offer price
        if actualPrice == offerPrice {
            cell.lblActualPrice.isHidden = true
            cell.lblActualPrice.text = ""
        } else {
            cell.lblActualPrice.isHidden = false
            cell.lblActualPrice.text = offerPrice
        }
        
        
        
        
        let imgURL = myDict["image"] as! String
        cell.image.contentMode = .scaleAspectFit
        cell.image.kf.setImage(with: URL(string: imgURL))
        cell.buttonAdd.layer.cornerRadius = 5
        cell.imgExpress.backgroundColor = UIColor.systemYellow
        cell.viewBG.layer.borderWidth = 0.5
        cell.viewBG.layer.cornerRadius = 5
        cell.viewBG.layer.borderColor = UIColor.lightGray.cgColor
        
        //if the is_express value is true, then show the yellow truck image. Else, hide it
        if myDict["is_express"] as! Bool == true {
            cell.imgExpress.isHidden = false
        } else {
            cell.imgExpress.isHidden = true
        }
        //If the offer is > 0, then only show the % OFF.
        let offerPrie = myDict["offer"] as? Int
        if offerPrie! > 0 {
        cell.lblOffer.text = "\(offerPrie!)% OFF"
            cell.viewOffer.isHidden = false
        } else {
            cell.lblOffer.text = ""
            cell.viewOffer.isHidden = true
        }
       
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 285)
    }
}
