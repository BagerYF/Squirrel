    //
    //  BaseNavigationController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/1/17.
    //

import UIKit

class BaseNavigationController: UINavigationController ,UINavigationControllerDelegate {
    var popDelegate: UIGestureRecognizerDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        popDelegate = self.interactivePopGestureRecognizer?.delegate
        delegate = self
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = .white
    }

    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        if viewController == self.viewControllers[0] {
            self.interactivePopGestureRecognizer!.delegate = self.popDelegate
        } else {
            self.interactivePopGestureRecognizer!.delegate = nil
        }
    }

    func imageFromColor(color: UIColor, viewSize: CGSize) -> UIImage{

        let rect: CGRect = CGRect(x: 0, y: 0, width: viewSize.width, height: viewSize.height)

        UIGraphicsBeginImageContext(rect.size)

        let context: CGContext = UIGraphicsGetCurrentContext()!

        context.setFillColor(color.cgColor)

        context.fill(rect)

        let image = UIGraphicsGetImageFromCurrentImageContext()

        UIGraphicsGetCurrentContext()

        return image!

    }
}
