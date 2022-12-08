//
//  TabBarVC.swift
//
//

import UIKit

class TabBarVC: UITabBarController {
  
  // MARK:- LifeCycle Methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    initialSetup()
    setupStyle()
  }
  
  // MARK:- Private
  
  private func initialSetup() {
    self.delegate = self
    addInitialControllers()
    self.configureTabBar()
    
  }
  
  private func configureTabBar() {
    //setupStyle()
  }
  
  private func setupStyle() {
//    tabBar.selectedImageTintColor = .black
    tabBar.unselectedItemTintColor = .lightGray
    tabBar.tintColor = .black
  }
    
  func addInitialControllers() {
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    let homeViewController = storyboard.instantiateViewController(withIdentifier: "DashboardViewController") as! DashboardViewController
    let homeNavigation = UINavigationController.init(rootViewController: homeViewController)
    
    let cartViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
    let cartNavigation = UINavigationController.init(rootViewController: cartViewController)
    
    let uViewController = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
    let userNavigation = UINavigationController.init(rootViewController: uViewController)
    
    let markViewController = storyboard.instantiateViewController(withIdentifier: "FavoritesViewController") as! FavoritesViewController
    let markNavigation = UINavigationController.init(rootViewController: markViewController)
    
    viewControllers = [homeNavigation,markNavigation, cartNavigation,userNavigation]
    
    homeNavigation.tabBarItem = UITabBarItem(
      title:  nil,
      image: UIImage(systemName: "homekit"),
      selectedImage: nil)
      
    cartNavigation.tabBarItem = UITabBarItem(
        title: "",
        image: UIImage(systemName: "bell.fill"),
        selectedImage: nil)
  
    userNavigation.tabBarItem = UITabBarItem(
     title: "",
     image: UIImage(systemName: "person"),
     selectedImage: nil)
 
    markNavigation.tabBarItem = UITabBarItem(
        title: "",
        image: UIImage(systemName: "bookmark"),
        selectedImage: nil)
  }
}

// MARK:- UITabBarControllerDelegate

extension TabBarVC: UITabBarControllerDelegate {
  
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
      return true
  }
  
  func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
  }
}

extension UITabBar {
  
  static func setTransparentTabbar() {
    UITabBar.appearance().backgroundImage = UIImage()
    UITabBar.appearance().shadowImage     = UIImage()
    UITabBar.appearance().clipsToBounds   = true
  }
}

extension TabBarVC {
  
  private func navigationController(rootViewController: UIViewController) -> UINavigationController {
    let navigationController = UINavigationController(rootViewController: rootViewController)
    navigationController.navigationBar.isHidden = false
    navigationController.interactivePopGestureRecognizer?.isEnabled = true
    return navigationController
  }
}
