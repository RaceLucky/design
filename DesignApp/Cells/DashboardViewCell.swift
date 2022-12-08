//
//  FourthCollectionViewCell.swift
//  DesignApp
//
//  Created by Galexy on 02/03/2022.
//

import UIKit

class DashboardViewCell: UICollectionViewCell {

  @IBOutlet weak var labelCollection: UILabel!
  @IBOutlet weak var imageCollection: UIImageView!
  @IBOutlet weak var dashview: UIView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
 
    dashview.layer.cornerRadius = 15
    dashview.layer.backgroundColor = UIColor.lightGray.cgColor
    imageCollection.tintColor = .white
        
    }

}
