//
//  ThirdViewController.swift
//  DesignApp
//
//  Created by Galexy on 01/03/2022.
//

import UIKit

class ThirdViewController: UIViewController {

  @IBOutlet weak var views: UIView!
  @IBOutlet weak var passbutton: UIButton!
  @IBOutlet weak var textfieldCpass: UITextField!
  @IBOutlet weak var textfieldPass: UITextField!
  @IBOutlet weak var signupButton: UIButton!
  @IBOutlet weak var cpassbutton: UIButton!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    viewShadow()
    
    signupButton.layer.cornerRadius = 4
    textfieldPass.delegate = self
    passbutton.imageEdgeInsets = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
    cpassbutton.imageEdgeInsets = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
    }
    
  
  
  @IBAction func cpassbutton(_ sender: Any) {
    
   if textfieldCpass.isSecureTextEntry{
      textfieldCpass.isSecureTextEntry = false
    }
    else{
      textfieldCpass.isSecureTextEntry = true
    }
  }
  
  @IBAction func passbutton(_ sender: Any) {
    
    if textfieldPass.isSecureTextEntry{
      textfieldPass.isSecureTextEntry = false
    }
    else{
      textfieldPass.isSecureTextEntry = true
    }
    
  }
  
  @IBAction func signin(_ sender: Any) {
    AppDelegate.appDelegate().setLoginViewController()
  }
  
}

extension ThirdViewController : UITextFieldDelegate{
  
  public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
    
    
  }
  
  func viewShadow() {
    views.layer.shadowColor = UIColor.black.cgColor
    views.layer.shadowOpacity = 0.1
    views.layer.shadowRadius = 20
    views.layer.shadowOffset = .zero
    
  }
}
