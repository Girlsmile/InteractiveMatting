//
//  AppDelegate.swift
//  BackgroundRemover
//
//  Created by 古智鹏 on 2020/4/26.
//  Copyright © 2020 MasterGu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        
        window?.makeKeyAndVisible()
        
        return true
    }

}

