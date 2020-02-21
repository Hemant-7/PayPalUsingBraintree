//
//  AppDelegate.swift
//  BrainTreeDemo
//
//  Created by Brain Tech on 2/19/20.
//  Copyright © 2020 Brain Tech. All rights reserved.
//

import UIKit

import BraintreeDropIn
import Braintree

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        Braintree.setReturnURLScheme("com.your-company.Your-App.payments")
          BTAppSwitch.setReturnURLScheme("com.your-company.Your-App.payments")
        return true
        // Override point for customization after application launch.
       
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        if url.scheme?.localizedCaseInsensitiveCompare("com.your-company.Your-App.payments") == .orderedSame {
            return BTAppSwitch.handleOpen(url, options: options)
        }
        return false
    }

    // If you support iOS 8, add the following method.
//    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//        if url.scheme?.localizedCaseInsensitiveCompare("com.brain.zMealPlanner.payments") == .orderedSame {
//            return BTAppSwitch.handleOpen(url, sourceApplication: sourceApplication)
//        }
//        return false
//    }
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

