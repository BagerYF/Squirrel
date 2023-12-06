//
//  ProductDetailShippingAndReturnCell.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/13.
//

import UIKit

class ProductDetailShippingAndReturnCell: UITableViewCell {

    var titleLabel: UILabel!
    var topLineView: UIView!
    var bottomLineView: UIView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        initView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initView() {
        titleLabel = UILabel(frame: .zero)
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.contentView.addSubview(titleLabel)

        topLineView = UIView(frame: .zero)
        topLineView.backgroundColor = AppColor.grey_bdbdbd
        self.contentView.addSubview(topLineView)

        bottomLineView = UIView(frame: .zero)
        bottomLineView.backgroundColor = AppColor.grey_bdbdbd
        self.contentView.addSubview(bottomLineView)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
            // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        titleLabel.text = """
            Shipping and Returns

            Delivery Destinations

            Shopify ships globally to a large number of countries. For more information on delivery, visit our orders & shipping page.

            Returns

            You can purchase in confidence and send the items back to us if they are not right for you. If you would like to initiate a return, please go to your account at the top right corner where it says your name. Click \"Create Return\" next to the order your would like to return and follow the prompts.
            """
        titleLabel.frame = CGRect(x: kPublicMargin, y: kPublicMargin, width: kScreenWidth - kPublicMargin * 2, height: getLableHeight(labelStr: titleLabel.text!, font: .systemFont(ofSize: 14), width: kScreenWidth - kPublicMargin * 2))

        topLineView.frame = CGRect(x: kPublicMargin, y: 0, width: kScreenWidth - kPublicMargin * 2, height: 1)
        bottomLineView.frame = CGRect(x: kPublicMargin, y: 299, width: kScreenWidth - kPublicMargin * 2, height: 1)
    }
}
