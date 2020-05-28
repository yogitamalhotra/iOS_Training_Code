//
//  AppDelegate.swift
//  DemoApp
//
//  Created by Yogita.a.Malhotra on 22/05/20.
//  Copyright © 2020 accenture. All rights reserved.
//

import UIKit

@UIApplicationMain
/*
Attributes in Swift start with an @ symbol and can be seen as instructions for the compiler.
The @UIApplicationMain attribute tells the compiler that AppDelegate is the class that
should be used as the application delegate.
Delegate Meaning-
delegate allows one object to send message to other object when any event occurs.
*/
class AppDelegate: UIResponder, UIApplicationDelegate {



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

