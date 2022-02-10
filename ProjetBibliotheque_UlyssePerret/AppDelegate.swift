//
//  AppDelegate.swift
//  ProjetBibliotheque_UlyssePerret
//
//  Created by Ulysse Perret on 10/02/2022.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
  var window: UIWindow?
    
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
      FirebaseApp.configure()
      
    return true
  }
    
    //Mark : UISceneSession Lifecycle
    func  application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration{
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
 func application(_ application: UIApplication, didDiscardSceneSessions didDiscardSceneSession: Set<UISceneSession>){
        
    }
}
