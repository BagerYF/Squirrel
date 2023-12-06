//
//  MainTabBarController.swift
//  shopifytestios
//
//  Created by Bager on 2023/1/16.
//

import UIKit

class MainTabBarController: UITabBarController {

    static let shareInstance = MainTabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.tintColor = .black

        UITabBar.appearance().isTranslucent = false
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.selected)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: UIControl.State.normal)


        self.addChildVCWithImg(childVC: HomeViewController(), childTitle: "Shopify", imageName: "tab_home", selectedImageName: "tab_home_s", index: 0)
        self.addChildVCWithImg(childVC: DesignersViewController(), childTitle: "Designers", imageName: "tab_designers", selectedImageName: "tab_designers_s", index: 1)
        self.addChildVCWithImg(childVC: SearchViewController(), childTitle: "Search", imageName: "tab_search", selectedImageName: "tab_search_s", index: 2)
        self.addChildVCWithImg(childVC: WishListViewController.shareInstance, childTitle: "Wishlist", imageName: "tab_wishlist", selectedImageName: "tab_wishlist_s", index: 3)
        self.addChildVCWithImg(childVC: ProfileViewController.shareInstance, childTitle: "Profile", imageName: "tab_profile", selectedImageName: "tab_profile_s", index: 4)
        self.selectedIndex = 0
    }

    private func addChildVCWithImg(childVC: UIViewController, childTitle: String, imageName: String, selectedImageName: String, index: Int) {
        let navigation = BaseNavigationController(rootViewController: childVC)
        childVC.title = childTitle
        childVC.tabBarItem.tag = index
        childVC.tabBarItem.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        childVC.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.withRenderingMode(.alwaysOriginal)
        self.addChild(navigation)
    }
}

