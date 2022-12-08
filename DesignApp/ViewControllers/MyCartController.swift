//
//  MyCartViewController.swift
//  DesignApp
//
//  Created by Galexy on 04/03/2022.
//

import UIKit

class MyCartController: UIViewController {

  @IBOutlet weak var PromoView: UIView!
  @IBOutlet weak var checkOut: UIButton!
  @IBOutlet weak var CarttableView: UITableView!
  @IBOutlet weak var backButton: UIButton!
  
  var cartArray: [Product] = []
  var plus: (() -> ())?
  
    override func viewDidLoad() {
      super.viewDidLoad()
      
      self.navigationItem.title = "My Cart"
      PromoView.layer.shadowColor = UIColor.black.cgColor
      PromoView.layer.shadowRadius = 5
      PromoView.layer.shadowOffset = .zero
      PromoView.layer.shadowOpacity =  0.1
      PromoView.layer.cornerRadius = 10
      
    checkOut.layer.cornerRadius = 8
    CarttableView.register(UINib(nibName: "CartTableViewCell", bundle: nil), forCellReuseIdentifier: "CartTableViewCell")
      backButton.layer.cornerRadius = 10
  }
}

extension MyCartController: UITableViewDataSource {
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    cartArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    

    let cell = CarttableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as! CartTableViewCell
    
    let cartarrayData = cartArray[indexPath.row]
    
    cell.cartImage.image = UIImage(named: cartarrayData.image)
    cell.productCost.text = cartarrayData.cost.description
    cell.ProductName.text = cartarrayData.name
    
    cell.plus = {
      
      if self.cartArray[indexPath.row].quantity == 10 {
        self.plus?()
//        cell.number.text = self.cartArray[indexPath.row].quantity.description

      } else {
        self.cartArray[indexPath.row].quantity += 1
        cell.number.text = self.cartArray[indexPath.row].quantity.description
        self.plus?()
      }
}
    
    
    cell.minus = {
      if self.cartArray[indexPath.row].quantity == 1 {
        
        self.cartArray.remove(at: indexPath.row)
        self.CarttableView.reloadData()
        
      } else {
        self.cartArray[indexPath.row].quantity -= 1
        cell.number.text = self.cartArray[indexPath.row].quantity.description
      }
    }
//    cartArray[indexPath.row].quntity += 1
//    cell.ProductName.text = cartArray[indexPath.row].quntity.description
   
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
}

extension MyCartController: UITableViewDelegate{
  
}
