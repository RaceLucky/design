//
//  SecondThirdViewController.swift
//  DesignApp
//
//  Created by Galexy on 01/03/2022.
//

import UIKit

class LogInViewController: UIViewController {
  
  @IBOutlet weak var eyebutton: UIButton!
  
  @IBOutlet weak var views: UIView!
  
  @IBOutlet weak var textfield: UITextField!
  
  @IBOutlet weak var loginButton: UIButton!
  
  @IBOutlet weak var label: UILabel!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    textfield.delegate = self
    
    eyebutton.imageEdgeInsets = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
    label.text = "Hello !\n\nWELCOME BACK"
    loginButton.layer.cornerRadius = 4
    let text = label.text!
    
    
    let test = NSMutableAttributedString.init(string: text)
    test.addAttribute(.foregroundColor, value: UIColor.init(red: 144/255, green: 144/255, blue: 144/255, alpha: 1) , range: NSRange(location: 0, length: 7))
    label.attributedText = test
    
    shadow()
    }
    
  @IBAction func signup(_ sender: Any) {
    AppDelegate.appDelegate().setSignupViewController()
  }
  
   
     @IBAction func eyebutton(_ sender: Any) {
       
       if textfield.isSecureTextEntry{
         
         textfield.isSecureTextEntry = false
       }
       else{
         textfield.isSecureTextEntry = true
       }
       
       
     }
  
  func shadow() {
    
    views.layer.shadowColor = UIColor.black.cgColor
    views.layer.shadowOpacity = 0.1
    views.layer.shadowOffset = .zero
    views.layer.shadowRadius = 20

  }
     

  @IBAction func loginButton(_ sender: Any) {
    AppDelegate.appDelegate().setDashboardViewController()
  }
}
extension LogInViewController: UITextFieldDelegate{
  
  
  public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
 
  
}
