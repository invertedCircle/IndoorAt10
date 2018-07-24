//
//  AppDelegate.swift
//  CloneInstagram
//
//  Created by Donald Mactavish on 10/07/2018.
//  Copyright © 2018 Inverted Circle. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        rememberUser() //function callled in the appplication wel  l...function
        
        let config = ParseClientConfiguration { (ParseMutableClientConfiguration)in //parse client configuration
            
            ParseMutableClientConfiguration.applicationId = "ee97b74a0ab7a8417704a2c2e6521c739f5b4965"
            ParseMutableClientConfiguration.clientKey = "7ecee1698bbff1a2307df17110c3a6caee39e7c9"
            ParseMutableClientConfiguration.server = "http://18.222.178.137:80/parse"
        }
        
        
        ///// PARSE CONFIGURATION BEGINS ////////
        Parse.initialize(with: config) // initialise connection to server with config
        
        let defaultACL = PFACL()  // define access-levels for database
        
        defaultACL.hasPublicReadAccess = true // read from datatabase
        defaultACL.hasPublicWriteAccess = true // write from the database
        
        PFACL.setDefault(defaultACL, withAccessForCurrentUser: true)

        
        
        return true
        
        ///// PARSE CONFIGURATION CONCLUDED ////////
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

    func rememberUser(){ //code to rememeber user everytime app is closed. Does not have to log back in
        
        let user : String? = UserDefaults.standard.string(forKey: "username") //string username is inherited from class on homepage
        
        if user != nil {
            
            let board : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let tabBar = board.instantiateViewController(withIdentifier: "tabBar") as! UITabBarController //casts the tabBar from storyboard usin the "tabBar" identifier
            
            window?.rootViewController = tabBar
            
        }
        }
        
    }


