//
//  FourthViewController.swift
//  DesignApp
//
//  Created by Galexy on 02/03/2022.
//


import UIKit

var products = [Product(image: "ic_caspari_c",name: "Black Simple Lamp",cost:  12.00, quantity: 0 ),
                Product(image: "ic_coffee_c", name: "Coffee Chair",     cost: 20.00, quantity: 0),
                Product(image: "ic_minimal_c",name: "Minimal Stand",    cost:  25.00, quantity: 0),
                Product(image: "ic_simple_c", name:"Simple Desk" , cost: 50.00, quantity: 0),
                Product(image: "ic_simple_c", name:"Simple Desk" , cost: 50.00, quantity: 0),
                Product(image: "ic_simple_c", name:"Simple Desk" , cost: 50.00, quantity: 0),
                Product(image: "ic_simple_c", name:"Simple Desk" , cost: 50.00, quantity: 0),
                Product(image: "ic_simple_c", name:"Simple Desk" , cost: 50.00, quantity: 0),
                Product(image: "ic_simple_c", name:"Simple Desk" , cost: 50.00, quantity: 0),
                Product(image: "ic_simple_c", name:"Simple Desk" , cost: 50.00, quantity: 0)]

class DashboardViewController : UIViewController {
  
  var categories = [collectionData(imageCollection: "ic_popular_cv.png", labelCollection: "Popular"),
                    collectionData(imageCollection: "ic_chair_cv", labelCollection: "Chair"),
                    collectionData(imageCollection: "ic_table_cv", labelCollection: "Table"),
                    collectionData(imageCollection: "ic_armchair_cv", labelCollection: "Armchair"),
                    collectionData(imageCollection: "ic_bed_cv", labelCollection: "Bed")]
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var collectionViewProduct: UICollectionView!
  
  var selectedCategoryIndex: Int = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
#if APPCLIP
    tabBarController?.tabBar.isHidden = true
#else
    tabBarController?.tabBar.isHidden = false
#endif
    
    self.navigationItem.title = "Make home BEAUTIFUL"
    let image = UIImage(named: "search.")!
    let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(searchTapped))
    button.tintColor = .black
    self.navigationItem.leftBarButtonItem = button
    
    let images = UIImage(named: "Vector-2")!
    let buttons = UIBarButtonItem(image: images, style: .plain, target: self, action: #selector(cartTapped))
    buttons.tintColor = .black
    self.navigationItem.rightBarButtonItem = buttons
    
    collectionView.register(UINib(nibName: "DashboardViewCell", bundle: nil), forCellWithReuseIdentifier: "DashboardViewCell")
    collectionViewProduct.register(UINib(nibName: "ProductCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductCollectionViewCell")
  }
}

extension DashboardViewController: UICollectionViewDataSource{
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == self.collectionViewProduct {
      return products.count
    } else {
      return categories.count
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if collectionView == self.collectionViewProduct {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as! ProductCollectionViewCell
      let collection = products[indexPath.row]
      cell.productLabel.text = collection.name
      cell.productCostLAbel.text = collection.cost.description
      cell.productImage.image = UIImage(named: collection.image)
      return cell
      
    } else {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashboardViewCell", for: indexPath) as! DashboardViewCell
      let collection = categories[indexPath.row]
      cell.labelCollection.text = collection.labelCollection
      cell.imageCollection.image = UIImage(named: collection.imageCollection)
      
      if selectedCategoryIndex == indexPath.row {
        cell.labelCollection.textColor = .black
        cell.dashview.backgroundColor = .black
      } else {
        cell.labelCollection.textColor = .lightGray
        cell.dashview.backgroundColor = .lightGray
      }
      return cell
    }
  }
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
}
extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    if collectionView == self.collectionViewProduct {
      
      let main = UIScreen.main.bounds
      let width = main.width - 60
      return CGSize(width: width/2, height: 240)
      
    } else {
      let main = UIScreen.main.bounds
      return CGSize(width: 90, height: 110)
    }}
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if collectionView == self.collectionViewProduct {
      
      let product = products[indexPath.row]
      
      let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
      let productDetailController = storyboard.instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
      
      self.navigationController?.pushViewController(productDetailController, animated: true)
    } else {
      selectedCategoryIndex = indexPath.row
      self.collectionView.reloadData()
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    if collectionView == self.collectionViewProduct {
      return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    } else {
      return UIEdgeInsets.zero
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    if collectionView == self.collectionViewProduct {
      return 18
    } else {
      return 0
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    if collectionView == self.collectionViewProduct {
      return 20
    } else {
      return 0
    }
  }
  
  @objc func searchTapped() {
  }
  
  @objc func cartTapped(){
    
  }
}
