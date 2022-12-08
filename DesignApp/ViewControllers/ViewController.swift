//
//  ViewController.swift
//  DesignApp
//
//  Created by Galexy on 28/02/2022.
//

import UIKit
import AppClip

class ViewController: UIViewController {

  @IBOutlet weak var getStarted: UIButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getStarted.layer.cornerRadius = 4
  }

  @IBAction func GETSTARTED(_ sender: Any) {
    AppDelegate.appDelegate().setLoginViewController()
//#if !APPCLIP
//
//#else
//
//#endif
  }
}

