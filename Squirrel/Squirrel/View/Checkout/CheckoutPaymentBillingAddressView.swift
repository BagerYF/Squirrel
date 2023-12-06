//
//  CheckoutPaymentBillingAddressView.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/29.
//

import UIKit

class CheckoutPaymentBillingAddressView: UIView {

    var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.text = "Billing Address"
        titleLabel.font = .boldSystemFont(ofSize: 12)
        return titleLabel
    }()

    var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel(frame: .zero)
        subTitleLabel.text = "Same as shipping address"
        subTitleLabel.font = .systemFont(ofSize: 14)
        subTitleLabel.textColor = AppColor.grey_9e9e9e
        return subTitleLabel
    }()

    var addressLabel: UILabel = {
        let addressLabel = UILabel(frame: .zero)
        addressLabel.text = "Miles Lexington \n3654 Sunset Boulevard, Los Angeles \nCA 90026, United States of America"
        addressLabel.numberOfLines = 0
        addressLabel.font = .systemFont(ofSize: 14)
        return addressLabel
    }()

    var lineView: UIView = {
        let lineView = UIView(frame: .zero)
        lineView.backgroundColor = AppColor.grey_eeeeee
        return lineView
    }()

    var editView: UIView = {
        let editView = UIView(frame: .zero)

        let editImgView = UIImageView(frame: CGRect(x: kPublicMargin, y: 13, width: 14, height: 14))
        editImgView.image = UIImage(named: "pen")
        editView.addSubview(editImgView)

        let titleLabel = UILabel(frame: CGRect(x: CGRectGetMaxX(editImgView.frame) + 10, y: 9, width: 70, height: 22))
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.text = "Edit"
        editView.addSubview(titleLabel)

        let arrowImgView = UIImageView(frame: CGRect(x: kScreenWidth - kPublicMargin - 22, y: 13, width: 14, height: 14))
        arrowImgView.image = UIImage(named: "arrow")
        editView.addSubview(arrowImgView)

        return editView
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
        self.addSubview(addressLabel)
        self.addSubview(lineView)
        self.addSubview(editView)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        titleLabel.frame = CGRect(x: kPublicMargin, y: kPublicMargin, width: kScreenWidth - kPublicMargin * 2, height: 15)

        subTitleLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(titleLabel.frame) + 12, width: kScreenWidth - kPublicMargin * 2, height: 24)

        addressLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(subTitleLabel.frame), width: kScreenWidth - kPublicMargin * 2, height: 72)

        lineView.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(addressLabel.frame) + 12, width: kScreenWidth - kPublicMargin * 2, height: 1)

        editView.frame = CGRect(x: 0, y: CGRectGetMaxY(lineView.frame), width: kScreenWidth, height: 40)
    }
}
