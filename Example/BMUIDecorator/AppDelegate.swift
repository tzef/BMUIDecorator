//
//  AppDelegate.swift
//  BMUIDecorator
//
//  Created by LEE ZHE YU on 06/23/2019.
//  Copyright (c) 2019 LEE ZHE YU. All rights reserved.
//

import UIKit
import BMUIDecorator

enum AppStyleAdaptor: Int {
    case style1 = 1
    case style2 = 2

    func getViewStoreName() -> String {
        return "ViewStyle\(self.rawValue)"
    }
    func getLabelStoreName() -> String {
        return "LabelStyle\(self.rawValue)"
    }
    func getButtonStoreName() -> String {
        return "ButtonStyle\(self.rawValue)"
    }

    func install() {
        BMUIDecoratorStoresManager.default.autoGenerate(storeName: getViewStoreName(),
                                                        decoratorCode: DecoratorCode_View())
        BMUIDecoratorStoresManager.default.autoGenerate(storeName: getLabelStoreName(),
                                                        decoratorCode: DecoratorCode_Label())
        BMUIDecoratorStoresManager.default.autoGenerate(storeName: getButtonStoreName(),
                                                        decoratorCode: DecoratorCode_Button())
    }
}
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var appStyle = AppStyleAdaptor.style1

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        AppStyleAdaptor.style1.install()
        AppStyleAdaptor.style2.install()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

