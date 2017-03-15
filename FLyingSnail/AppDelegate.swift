//
//  AppDelegate.swift
//  FLyingSnail
//
//  Created by Suric on 16/9/25.
//  Copyright © 2016年 snail. All rights reserved.
//

import UIKit
import AdSupport
import Alamofire
import CoreTelephony

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // AdvertisingIdentifier
        printAdvertisingIdentifier()
        // send url request
        sendURLRequest()
        // request Cellular
        printCellularState()
        
        // test UserDefaults
        testUserDefaults()
        
        // test private deploy
        #if PRIVATE
        print("Private deploy")
        #else
        print("normal deploy")
        #endif
        
        print("nice")
        print("add release")
        
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

// MARK: - Private Methods

extension AppDelegate {
    func printAdvertisingIdentifier() {
        if let advertisingIdentifier = ASIdentifierManager.shared().advertisingIdentifier {
            print("advertisingIdentifier: \(advertisingIdentifier)")
        }
    }
    
    func sendURLRequest() {
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            print(response.request as Any)  // original URL request
            print(response.response as Any) // HTTP URL response
            print(response.data as Any)     // server data
            print(response.result)   // result of response serialization
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
    
    func printCellularState() {
        let cellularData = CTCellularData()
        cellularData.cellularDataRestrictionDidUpdateNotifier = { (state) -> Void
             in
            switch state {
            case .restrictedStateUnknown:
                print("Unknown State")
            case .restricted:
                print("Restricted State")
            case .notRestricted:
                print("notRestricted State")
            }
        }
    }
    
    func testUserDefaults() {
        let valueUserData = UserDefaults.standard.value(forKey: UserDefaultsConstants.userData)
        if let valueUserData = valueUserData as? Data, let userName = String(data: valueUserData, encoding: .utf8) {
            print("valueUserData: \(userName)")
        }
        
        let objectUserData = UserDefaults.standard.object(forKey: UserDefaultsConstants.userData)
        if let objectUserData = objectUserData as? Data, let userName = String(data: objectUserData, encoding: .utf8) {
            print("username: \(userName)")
        } else {
            let userData = "Suric".data(using: .utf8)
            UserDefaults.standard.setValue(userData, forKey: UserDefaultsConstants.userData)
            UserDefaults.standard.synchronize()
        }
        
        let a = UserDefaultsConstants.isNewUser
        let b = UserDefaultsConstants.isNewUser
        if a == b {
            print("So nice")
        }
    }
}

