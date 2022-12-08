//
//  FavoritesTableViewCell.swift
//  DesignApp
//
//  Created by Galexy on 03/03/2022.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {
  
  @IBOutlet weak var cartView: UIView!
  @IBOutlet weak var favoriteCost: UILabel!
  @IBOutlet weak var favoriteName: UILabel!
  @IBOutlet weak var favoriteImage: UIImageView!
  
  var delete: (() -> ())?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    cartView.layer.cornerRadius = 10
    favoriteImage.layer.cornerRadius = 15
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    
  }
  
  @IBAction func Deletebutton(_ sender: Any) {
    delete?()
  }
  
}
