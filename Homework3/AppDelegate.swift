//
//  AppDelegate.swift
//  Homework3
//
//  Created by Johnathon Frocillo on 1/30/20.
//  Copyright © 2020 Johnathon Frocillo. All rights reserved.
//

import UIKit

let BACKGROUND_COLOR = UIColor.init(red: 0, green: 0.1098, blue: 0.3176, alpha: 1.0) /* #001c51 DARK BLUE*/
let FOREGROUND_COLOR = UIColor.init(red: 1, green: 1, blue: 0.5, alpha: 1.0) /* #ffffff YELLOW ish*/

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let navAppearance = UINavigationBar.appearance()
        navAppearance.barTintColor = BACKGROUND_COLOR
        navAppearance.tintColor = FOREGROUND_COLOR
        navAppearance.isTranslucent = false
        navAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
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

