//
//  AppDelegate.swift
//  SaatchiArt
//
//  Created by nhatlee on 10/23/17.
//  Copyright © 2017 nhatlee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    override init() {
        UIViewController.classInit
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
        UIApplication.configAppAppearance()
        UILabel.appearance().defaultFont = UIFont(name: "Helvetica Neue", size: 15)
        return true
    }

    private func configStatusBar(){
        let view = UIView(frame: CGRect(x: 0, y: 0, width: Constant.ScreenSize.size.width, height: 20))
        view.backgroundColor = UIColor.init(rgb: 51, 51, 51, alpha: 1.0)
        let VC = UIApplication.topViewController() == nil ? self.window?.rootViewController : UIApplication.topViewController()
        VC?.view.addSubview(view)
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

