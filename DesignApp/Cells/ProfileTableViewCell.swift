//
//  ProfileTableViewCell.swift
//  DesignApp
//
//  Created by Galexy on 04/03/2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

  @IBOutlet weak var tableCellView: UIView!
  @IBOutlet weak var orderDetails: UILabel!
  @IBOutlet weak var profileSetting: UILabel!
  

  
  override func awakeFromNib() {
        super.awakeFromNib()
    
    tableCellView.layer.shadowColor = UIColor.black.cgColor
    tableCellView.layer.shadowOpacity = 0.1
    tableCellView.layer.shadowOffset = .zero
    tableCellView.layer.shadowRadius = 20
 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
