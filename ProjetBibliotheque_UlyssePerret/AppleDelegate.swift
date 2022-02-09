//
//  AppleDelegate.swift
//  ProjetBibliotheque_UlyssePerret
//
//  Created by Ulysse Perret on 09/02/2022.
//

import UIKit

import Firebase


@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {


  var window: UIWindow?


  func application(_ application: UIApplication,

    didFinishLaunchingWithOptions launchOptions:

      [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

    FirebaseApp.configure()

    return true

  }

}
