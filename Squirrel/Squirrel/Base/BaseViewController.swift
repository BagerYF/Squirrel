    //
    //  BaseViewController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/1/17.
    //

import UIKit

class BaseViewController: UIViewController {

    var navLeftType: NavLeftType = .Back
    var cartButton: UIButton!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if cartButton != nil {
            cartButton.setTitle(CartViewController.shareInstance.getCartQty(), for: .normal)
        }

        NotificationCenter.default.addObserver(self, selector: #selector(updateCartQty), name: .init("NotificationUpdateCartQty"), object: nil)

        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        self.navigationController?.navigationBar.standardAppearance = appearance
        self.navigationController?.navigationBar.scrollEdgeAppearance = self.navigationController?.navigationBar.standardAppearance
    }

    @objc func updateCartQty() {
        if cartButton != nil {
            cartButton.setTitle(CartViewController.shareInstance.getCartQty(), for: .normal)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        if navLeftType != .None {
            setLeftNav()
        } else {
            let barButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
            barButtonItem.width = -10
            navigationItem.leftBarButtonItems = [barButtonItem]
        }
    }

    func setLeftNav() {
            //        self.navigationController?.navigationBar.topItem?.title = ""
            //        self.navigationController?.navigationBar.backItem?.title = ""
        let backButton = UIButton(type: .custom)

        if navLeftType == .Close {
            backButton.setImage(UIImage(named: "nav_close"), for: .normal)
        } else {
            backButton.setImage(UIImage(named: "backarrow"), for: .normal)
        }

        backButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)
        backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            //        backButton.backgroundColor = .cyan
        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)
        let backView = UIBarButtonItem(customView: backButton)
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        barButtonItem.width = -10
        navigationItem.leftBarButtonItems = [barButtonItem, backView]
    }

    func setRightNav() {
        cartButton = UIButton(type: .custom)
        cartButton.setImage(UIImage(named: "nav_bag"), for: .normal)
        cartButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        cartButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: -16, right: 0)
        cartButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            //        cartButton.backgroundColor = .cyan
        cartButton.titleLabel?.font = .systemFont(ofSize: 10)
        cartButton.titleLabel?.backgroundColor = .white
        cartButton.setTitleColor(.black, for: .normal)
        cartButton.setTitle(CartViewController.shareInstance.getCartQty(), for: .normal)
        cartButton.addTarget(self, action: #selector(goToCart), for: .touchUpInside)
        let cartView = UIBarButtonItem(customView: cartButton)
        let cartButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        cartButtonItem.width = -10
        navigationItem.rightBarButtonItems = [cartButtonItem, cartView]
    }

    @objc func goToCart() {
        let cart = CartViewController.shareInstance
        let navigation = BaseNavigationController(rootViewController: cart)
        navigation.navigationBar.backgroundColor = .white
        navigation.modalPresentationStyle = .custom
        self.present(navigation, animated: true)
    }

    @objc func back() {
        if navLeftType == .Close {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
