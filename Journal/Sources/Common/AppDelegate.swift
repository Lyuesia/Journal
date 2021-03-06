//
//  AppDelegate.swift
//  Journal
//
//  Created by Bum JunKwon on 21/07/2018.
//  Copyright © 2018 Bum Jun Kwon. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if let navigationController = window?.rootViewController as? UINavigationController {
        navigationController.navigationBar.prefersLargeTitles = true
            navigationController.navigationBar.barStyle = .black
            navigationController.navigationBar.barTintColor = UIColor.blue
            navigationController.navigationBar.tintColor = UIColor.white
        }
        if let navViewController = window?.rootViewController as? UINavigationController {
            navViewController.navigationBar.prefersLargeTitles = true
            navViewController.navigationBar.barStyle = .black
            let bgimage = UIImage.gradientImage(with: [.gradientStart, .gradientEnd], size: CGSize(width: UIScreen.main.bounds.size.width, height: 1))
            navViewController.navigationBar.barTintColor = UIColor(patternImage: bgimage!)
            
        }
        
        if
            let navigationController = window?.rootViewController as? UINavigationController,
            let timelineViewController = navigationController.topViewController as? TimelineViewController {
            let repo = InMemoryRepository(entries: [
                Entry(text: "일기 1"),
                Entry(text: "일기 2"),
                Entry(text: "일기 3"),
                ]
            )
            timelineViewController.environment = Environment(
                entryRepository: repo
            )
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

