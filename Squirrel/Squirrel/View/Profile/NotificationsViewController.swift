    //
    //  NotificationsViewController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/3/23.
    //

import UIKit

class NotificationsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Notifications"

        initView()
    }

    func initView() {
        let title = UILabel(frame: CGRect(x: kPublicMargin, y: kPublicMargin, width: kScreenWidth - kPublicMargin * 2, height: 44))
        title.text = "Receive push notifications from us to get latest offers and promotion."
        title.numberOfLines = 0
        title.font = .systemFont(ofSize: 16)
        self.view.addSubview(title)

        let subTitle = UILabel(frame: CGRect(x: kPublicMargin, y: CGRectGetMaxY(title.frame) + kPublicMargin, width: 160, height: 60))
        subTitle.text = "Push Notifications"
        subTitle.font = .systemFont(ofSize: 16)
        self.view.addSubview(subTitle)

        let uiswitch = UISwitch()
        uiswitch.center = CGPointMake(kScreenWidth - kPublicMargin - 30, CGRectGetMidY(subTitle.frame));
        uiswitch.isOn = true;
        uiswitch.onTintColor = .black
        uiswitch.addTarget(self, action: #selector(switchDidChange),
                           for:.touchUpInside)
        self.view.addSubview(uiswitch);

        let line = UIView(frame: CGRect(x: 0, y: CGRectGetMaxY(subTitle.frame), width: kScreenWidth, height: 1))
        line.backgroundColor = AppColor.grey_eeeeee
        self.view.addSubview(line)
    }

    @objc func switchDidChange(){

    }
}
