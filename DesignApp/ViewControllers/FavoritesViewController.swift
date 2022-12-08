//
//  FavoritesViewController.swift
//  DesignApp
//
//  Created by Galexy on 03/03/2022.
//

import UIKit

class FavoritesViewController: UIViewController {
  
  var favoriteProduct = [Product(image: "ic_caspari_c",name: "Black Simple Lamp",cost: 12.00, quantity: 0 ),
                         Product(image: "ic_coffee_c", name: "Coffee Chair",   cost: 20.00, quantity: 0),
                         Product(image: "ic_minimal_c",name: "Minimal Stand",  cost:  25.00, quantity: 0),
                         Product(image: "ic_simple_c", name:"Simple Desk" , cost: 50.00, quantity: 0),
                         Product(image: "ic_simple_c", name:"Simple Desk" , cost: 50.00, quantity: 0),
                         Product(image: "ic_simple_c", name:"Simple Desk" , cost: 50.00, quantity: 0),
                         Product(image: "ic_simple_c", name:"Simple Desk" , cost: 50.00, quantity: 0),
                         Product(image: "ic_simple_c", name:"Simple Desk" , cost: 50.00, quantity: 0),
                         Product(image: "ic_simple_c", name:"Simple Desk" , cost: 50.00, quantity: 0),
                         Product(image: "ic_simple_c", name:"Simple Desk" , cost: 50.00, quantity: 0),]
  
  @IBOutlet weak var cartButton: UIButton!
  @IBOutlet weak var favoriteTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.navigationItem.title = "Favorites"
    let navigationItemImage = UIImage(named: "search.")
    let navigationButton = UIBarButtonItem(image: navigationItemImage, style: .plain, target: .none, action: #selector(navigationSearchButton))
    
    navigationButton.tintColor = .black
    self.navigationItem.leftBarButtonItem = navigationButton
    
    let navigationCartImage  = UIImage(named: "Vector-2")
    let navigationCartButton = UIBarButtonItem(image: navigationCartImage, style: .plain, target: nil, action: #selector(navigationCartButton))
    navigationCartButton.tintColor = .black
    self.navigationItem.rightBarButtonItem = navigationCartButton
    cartButton.layer.cornerRadius = 8
    
    favoriteTableView.register(UINib(nibName: "FavoritesTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoritesTableViewCell")
    favoriteTableView.dataSource = self
    favoriteTableView.delegate = self
    favoriteTableView.contentInset = UIEdgeInsets.init(top: 0, left: 0, bottom: 70, right: 0)
  }
  
  
  @IBAction func addCart(_ sender: Any) {
    
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let passDataFromFavoriote = storyboard.instantiateViewController(withIdentifier: "MyCartController") as! MyCartController
    passDataFromFavoriote.plus = {
      self.favoriteProduct.first!.cost +  self.favoriteProduct.first!.cost
    }
    passDataFromFavoriote.cartArray = self.favoriteProduct
    self.navigationController?.pushViewController(passDataFromFavoriote, animated: true)
    
  }
  
}

extension FavoritesViewController: UITableViewDataSource{
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    favoriteProduct.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = favoriteTableView.dequeueReusableCell(withIdentifier: "FavoritesTableViewCell", for: indexPath) as! FavoritesTableViewCell
    let favoriteproductCollection = favoriteProduct[indexPath.row]
    cell.favoriteImage.image = UIImage(named: favoriteproductCollection.image)
    cell.favoriteName.text = favoriteproductCollection.name
  //  cell.favoriteCost.text = favoriteproductCollection.cost
    cell.favoriteCost.text = favoriteproductCollection.cost.description
    cell.sizeToFit()
    
    cell.delete = {
      self.favoriteProduct.remove(at: indexPath.row)
      self.favoriteTableView.reloadData()
    }
    
    return cell
  }
  
  
  @objc func navigationSearchButton() {
    
  }
  
  @objc func navigationCartButton() {
    
  }
  
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
  {
//    if editingStyle == .delete {
      
//      favoriteProduct.remove(at: indexPath.row)
      
//      tableView.deleteRows(at: [indexPath], with: .fade)
    }
  }
//}

  
  


extension FavoritesViewController: UITableViewDelegate{
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(favoriteProduct[indexPath.row])
  }
  
}
