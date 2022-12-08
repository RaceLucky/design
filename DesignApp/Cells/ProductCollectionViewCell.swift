//
//  ProductCollectionViewCell.swift
//  DesignApp
//
//  Created by Galexy on 02/03/2022.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var viewWrapper: UIView!
  @IBOutlet weak var cartbutton: UIButton!
  @IBOutlet weak var productCostLAbel: UILabel!
  @IBOutlet weak var productLabel: UILabel!
  @IBOutlet weak var productImage: UIImageView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
    
    viewWrapper.layer.cornerRadius = 10
    
    cartbutton.imageEdgeInsets = UIEdgeInsets(top: 35, left: 35, bottom: 35, right: 35)
   
    productImage.layer.cornerRadius = 12
    }

  @IBAction func productButton(_ sender: Any) {

  }
}
