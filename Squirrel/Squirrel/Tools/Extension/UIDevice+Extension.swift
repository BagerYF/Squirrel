//
//  UIDevice+Extension.swift
//  shopifytestios
//
//  Created by Bager on 2023/2/24.
//

import Foundation

extension UIDevice {

    /// Top safety height
    static func safeDistanceTop() -> CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let window = windowScene.windows.first else { return 0 }
            return window.safeAreaInsets.top
        } else if #available(iOS 11.0, *) {
            guard let window = UIApplication.shared.windows.first else { return 0 }
            return window.safeAreaInsets.top
        }
        return 0;
    }

    /// Bottom safety height
    static func safeDistanceBottom() -> CGFloat {
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let window = windowScene.windows.first else { return 0 }
            return window.safeAreaInsets.bottom
        } else if #available(iOS 11.0, *) {
            guard let window = UIApplication.shared.windows.first else { return 0 }
            return window.safeAreaInsets.bottom
        }
        return 0;
    }

    /// Height of top status bar (including safe zone)
    static func statusBarHeight() -> CGFloat {
        var statusBarHeight: CGFloat = 0
        if #available(iOS 13.0, *) {
            let scene = UIApplication.shared.connectedScenes.first
            guard let windowScene = scene as? UIWindowScene else { return 0 }
            guard let statusBarManager = windowScene.statusBarManager else { return 0 }
            statusBarHeight = statusBarManager.statusBarFrame.height
        } else {
            statusBarHeight = UIApplication.shared.statusBarFrame.height
        }
        return statusBarHeight
    }

    /// Navigation bar height
    static func navigationBarHeight() -> CGFloat {
        return 44.0
    }

    /// Height of the status bar navigation bar
    static func navigationFullHeight() -> CGFloat {
        return UIDevice.statusBarHeight() + UIDevice.navigationBarHeight()
    }

    /// Height of the bottom navigation bar
    static func tabBarHeight() -> CGFloat {
        return 49.0
    }

    /// Height of bottom navigation bar (including safe area)
    static func tabBarFullHeight() -> CGFloat {
        return UIDevice.tabBarHeight() + UIDevice.safeDistanceBottom()
    }
}
