//
//  CheckoutResultViewController.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/30.
//

import UIKit

class CheckoutResultViewController: BaseViewController {

    var processLabel: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }

    override func viewDidLoad() {
        navLeftType = .None
        super.viewDidLoad()

        title = "Processing"

        processLabel = UILabel(frame: CGRect(x: 0, y: CGRectGetMidY(self.view.frame) - 10, width: kScreenWidth, height: 20))
        processLabel.text = "We are processing your order..."
        processLabel.textAlignment = .center
        processLabel.font = .systemFont(ofSize: 16)
        self.view.addSubview(processLabel)
    }

    func updateSuccessView(email: String) {

        title = "Order Complete"

        processLabel.removeFromSuperview()

        let img = UIImageView(frame: CGRect(x: kScreenWidth / 2.0 - 23, y: 270, width: 46, height: 46))
        img.image = UIImage(named: "success")
        self.view.addSubview(img)

        let titleLabel = UILabel(frame: CGRect(x: 0, y: CGRectGetMaxY(img.frame) + 25, width: kScreenWidth, height: 22))
        titleLabel.font = .boldSystemFont(ofSize: 16)
        titleLabel.text = "Your order is complete"
        titleLabel.textAlignment = .center
        self.view.addSubview(titleLabel)

        let subTitleLabel = UILabel(frame: CGRect(x: 0, y: CGRectGetMaxY(titleLabel.frame) + 8, width: kScreenWidth, height: 44))
        subTitleLabel.textAlignment = .center
        subTitleLabel.font = .systemFont(ofSize: 16)
        subTitleLabel.text = "A confirmation email will be sent to \n\(email)"
        subTitleLabel.textColor = AppColor.grey_616161
        subTitleLabel.numberOfLines = 0
        self.view.addSubview(subTitleLabel)

        let button = UIButton(frame: CGRect(x: kPublicMargin, y: kScreenHeight - 60 - UIDevice.navigationFullHeight() - UIDevice.safeDistanceBottom(), width: kScreenWidth - kPublicMargin * 2, height: 40))
        button.setTitle("Continue Shopping", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 2
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(continueShoppingClick), for: .touchUpInside)
        self.view.addSubview(button)
    }

    @objc func continueShoppingClick() {
        self.dismiss(animated: true)
        MainTabBarController.shareInstance.selectedIndex = 0
    }
}
