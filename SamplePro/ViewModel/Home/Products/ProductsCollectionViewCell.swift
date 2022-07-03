//
//  ProductsCollectionViewCell.swift
//  SamplePro
//
//  Created by Kavya on 02/07/22.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var lblOffer: UILabel!
    @IBOutlet weak var lblOfferPrice: UILabel!
    @IBOutlet weak var lblActualPrice: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imgExpress: UIImageView!
    @IBOutlet weak var buttonAdd: UIButton!
    @IBOutlet weak var buttonFav: UIButton!
    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var viewOffer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
