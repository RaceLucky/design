//
//  productData.swift
//  DesignApp
//
//  Created by Galexy on 02/03/2022.
//

import Foundation

class Product {
  
  var image: String
  var name: String
  var cost: Float
  var quantity: Int = 0
  
  init(image: String,name: String,cost: Float,quantity: Int) {
    self.image = image
    self.name = name
    self.cost = cost
    self.quantity = quantity
  }
}
