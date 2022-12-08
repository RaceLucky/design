//
//  AppDelegate.swift
//  DesignApp
//
//  Created by Galexy on 28/02/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    return true
  }

  // MARK: UISceneSession Lifecycle

  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }


}

extension AppDelegate {
  static func appDelegate() -> AppDelegate {
      return UIApplication.shared.delegate as! AppDelegate
  }
  
  func setHome() {
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    let viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
    window?.rootViewController = viewController
    window?.makeKeyAndVisible()
  }
  
  func setLoginViewController() {
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    let viewController = storyboard.instantiateViewController(withIdentifier: "LogInViewController") as! LogInViewController
    window?.rootViewController = viewController
    window?.makeKeyAndVisible()
  }
  
  func setSignupViewController() {
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    let viewController = storyboard.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
    window?.rootViewController = viewController
    window?.makeKeyAndVisible()
  }
  
  func setDashboardViewController() {
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    let tabViewController = storyboard.instantiateViewController(withIdentifier: "TabBarVC") as! TabBarVC
    window?.rootViewController = tabViewController//navigationController
    window?.makeKeyAndVisible()
  }
}
