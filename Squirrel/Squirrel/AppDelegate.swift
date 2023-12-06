    //
    //  AppDelegate.swift
    //  Squirrel
    //
    //  Created by Bager on 2023/12/4.
    //

import UIKit
import IQKeyboardManagerSwift
import MMKV

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.disabledDistanceHandlingClasses.append(UISearchController.self)

        let paths = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).map(\.path)
        let libraryPath = paths.first
        if (libraryPath?.count ?? 0) > 0 {
            let rootDir = URL(fileURLWithPath: libraryPath ?? "").appendingPathComponent("mmkv").path
            MMKV.initialize(rootDir: rootDir, logLevel: .error)
        }

        let vc = MainTabBarController.shareInstance
        window?.backgroundColor = UIColor.white
        window?.rootViewController = vc
        window?.makeKeyAndVisible()

        print("hello，world!");

        return true
    }

}

