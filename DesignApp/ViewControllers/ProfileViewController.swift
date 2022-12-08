//
//  ProfileViewController.swift
//  DesignApp
//
//  Created by Galexy on 03/03/2022.
//

import UIKit

class ProfileViewController: UIViewController {
  
  var UserData = [UserProfile(SettingName: "My orders", SettingData: "Already have 10 orders"),
                  UserProfile(SettingName: "Shipping Addresses", SettingData: "03 addresses")
                  ,UserProfile(SettingName: "Payment Method" , SettingData: "You have 2 cards")
                  ,UserProfile(SettingName: "My review", SettingData: "Review for 5 items "),
                  UserProfile(SettingName: "Setting", SettingData: "Notification, Password FaQ Contact")]
  
  @IBOutlet weak var ProfileTableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    ProfileTableView.separatorStyle = .none
    ProfileTableView.dataSource = self
    ProfileTableView.delegate = self
    ProfileTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 70, right: 0)
    
    ProfileTableView.register(UINib(nibName: "ProfileTableViewCell", bundle: nil), forCellReuseIdentifier: "ProfileTableViewCell")
    
    self.navigationItem.title = "Profile"
    
    let image = UIImage(named: "search.")!
    let button = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(searchTapped))
    button.tintColor = .black
    self.navigationItem.leftBarButtonItem = button
    
    let images = UIImage(named: "ic_logout_back")!
    let buttons = UIBarButtonItem(image: images, style: .plain, target: self, action: #selector(cartTapped))
    buttons.tintColor = .black
    self.navigationItem.rightBarButtonItem = buttons
    
  }
  
  
  @objc func searchTapped() {
    
  }
  
  @objc func cartTapped() {
    
    let alert = UIAlertController(title: "Log Out", message: "Are You Sure You Want to Log out ?", preferredStyle: .alert)
    let alertControllerYes = UIAlertAction(title: "YES", style: .default) { logInScreen in
      
      AppDelegate.appDelegate().setLoginViewController()
      }
    
    let alertControllerNo = UIAlertAction(title: "NO", style: .destructive)
    alert.addAction(alertControllerNo)
    alert.addAction(alertControllerYes)
    self.present(alert, animated: true, completion: nil)
  }
}

extension ProfileViewController: UITableViewDataSource{
  
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    UserData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = ProfileTableView.dequeueReusableCell(withIdentifier: "ProfileTableViewCell", for: indexPath) as! ProfileTableViewCell
    let userSetting = UserData[indexPath.row]
    
    cell.orderDetails.text = userSetting.SettingName
    cell.profileSetting.text = userSetting.SettingData
    
    return cell
  }
}

extension ProfileViewController: UITableViewDelegate {
}

