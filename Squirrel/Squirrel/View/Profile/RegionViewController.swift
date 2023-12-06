//
//  RegionViewController.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/24.
//

import UIKit

class RegionViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Region"

        initView()
    }

    func initView() {
        let title = UILabel(frame: CGRect(x: kPublicMargin, y: 30, width: kScreenWidth - kPublicMargin * 2, height: 22))
        title.text = "Select your preferred region."
        title.numberOfLines = 0
        title.font = .systemFont(ofSize: 16)
        self.view.addSubview(title)

        let subTitle = UILabel(frame: CGRect(x: kPublicMargin, y: CGRectGetMaxY(title.frame) + kPublicMargin, width: 160, height: 15))
        subTitle.text = "Region"
        subTitle.font = .systemFont(ofSize: 12)
        self.view.addSubview(subTitle)

        let img = UIImageView(frame: CGRect(x: kPublicMargin, y: CGRectGetMaxY(subTitle.frame) + kPublicMargin + 2, width: 18, height: 18))
        img.kf.setImage(with: URL(string: "https://d1mp1ehq6zpjr9.cloudfront.net/static/images/flags/CN.png"))
        self.view.addSubview(img)

        let region = UILabel(frame: CGRect(x: CGRectGetMaxX(img.frame) + 5, y: CGRectGetMaxY(subTitle.frame) + kPublicMargin, width: 200, height: 22))
        region.text = "China, USD $"
        region.font = .systemFont(ofSize: 16)
        self.view.addSubview(region)

        let arrowImg = UIImageView(frame: CGRect(x: kScreenWidth - kPublicMargin - 22, y: CGRectGetMaxY(subTitle.frame) + kPublicMargin + 2, width: 18, height: 18))
        arrowImg.image = UIImage(named: "arrow_down")
        self.view.addSubview(arrowImg)

        let line = UIView(frame: CGRect(x: kPublicMargin, y: CGRectGetMaxY(region.frame) + 10, width: kScreenWidth - kPublicMargin * 2, height: 1))
        line.backgroundColor = AppColor.grey_eeeeee
        self.view.addSubview(line)

        let button = UIButton(frame: CGRect(x: kPublicMargin, y: kScreenHeight - 50 - UIDevice.navigationFullHeight() - UIDevice.safeDistanceBottom(), width: kScreenWidth - kPublicMargin * 2, height: 40))
        button.setTitle("Update Region", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 2
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(updateRegion), for: .touchUpInside)
        self.view.addSubview(button)
    }

    @objc func selectRegion(){

    }

    @objc func updateRegion(){

    }
}
