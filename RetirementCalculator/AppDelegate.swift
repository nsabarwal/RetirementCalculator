//
//  AppDelegate.swift
//  RetirementCalculator
//
//  Created by Naman Sabarwal on 27/09/23.
//

import UIKit
import AppCenter
import AppCenterCrashes
import AppCenterAnalytics

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        AppCenter.start(withAppSecret: "7bffe89c-24e5-43af-8141-298876424be3", services: [Analytics.self, Crashes.self])
        return true
    }
}

