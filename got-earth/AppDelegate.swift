//
//  AppDelegate.swift
//  GOT Earth
//
//  Created by Ian Bastos on 16/04/2019.
//  Copyright © 2019 Ian Bastos. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let PREF_INITIATED = "initiatedv10"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // if preferences haven't been saved then set initial preferences
        let prefObserver = PreferenceObserver()
        if (prefObserver.fetchPreference(key: PREF_INITIATED) == nil) {
            
            // set initial checked list
            prefObserver.setValue(value: true, key: "Show Westeros")
            prefObserver.setValue(value: false, key: "Show Essos")
            prefObserver.setValue(value: false, key: "Show Sothoryos")
            
            // set initial purchased list (if they're disabled)
            let storeDefaults = StorePreferenceObserver()
            storeDefaults.setValue(value: false, key: StorePreferenceObserver.DEFAULTS_PREFIX + "Show Westeros")
            storeDefaults.setValue(value: true, key: StorePreferenceObserver.DEFAULTS_PREFIX + "Show Essos")
            storeDefaults.setValue(value: true, key: StorePreferenceObserver.DEFAULTS_PREFIX + "Show Sothoryos")
            
            prefObserver.setValue(value: true, key: PREF_INITIATED)
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

