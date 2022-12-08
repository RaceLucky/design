//
//  CartTableViewCell.swift
//  DesignApp
//
//  Created by Galexy on 04/03/2022.
//

import UIKit

class CartTableViewCell: UITableViewCell {

  
  
  @IBOutlet weak var cartImage: UIImageView!
  @IBOutlet weak var ProductName: UILabel!
  @IBOutlet weak var number: UILabel!
  @IBOutlet weak var productCost: UILabel!
  
  var cart: (() -> ())?
  var plus: (() -> ())?
  var minus: (() -> ())?
  
  override func awakeFromNib() {
        super.awakeFromNib()
    cartImage.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
  @IBAction func plusButton(_ sender: Any) {
    plus?()
    
  }
  
  @IBAction func minusButton(_ sender: Any) {
    minus?()
  }
}
