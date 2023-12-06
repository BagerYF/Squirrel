//
//  OrderListCell.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/28.
//

import UIKit
import Kingfisher

class OrderListCell: UITableViewCell {

    var titleLabel: UILabel!
    var dateLabel: UILabel!
    var productImg: UIImageView!
    var arrowImg: UIImageView!
    var line: UIView!

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
        titleLabel.text = "Order# 999999"
        self.contentView.addSubview(titleLabel)

        dateLabel = UILabel(frame: .zero)
        dateLabel.font = .systemFont(ofSize: 14)
        dateLabel.text = "2022-22-22"
        dateLabel.textAlignment = .right
        dateLabel.textColor = AppColor.grey_9e9e9e
        self.contentView.addSubview(dateLabel)

        productImg = UIImageView(frame: .zero)
        productImg.contentMode = .scaleAspectFit
        self.contentView.addSubview(productImg)

        arrowImg = UIImageView(frame: .zero)
        arrowImg.contentMode = .scaleAspectFit
        arrowImg.image = UIImage(named: "arrow")
        self.contentView.addSubview(arrowImg)

        line = UIView(frame: .zero)
        line.backgroundColor = AppColor.grey_eeeeee
        self.contentView.addSubview(line)
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
        titleLabel.frame = CGRect(x: kPublicMargin, y: kPublicMargin, width: 150, height: 20)
        arrowImg.frame = CGRect(x: kScreenWidth - kPublicMargin - 18, y: kPublicMargin, width: 20, height: 20)
        dateLabel.frame = CGRect(x: CGRectGetMinX(arrowImg.frame) - 105, y: kPublicMargin, width: 100, height: 20)
        productImg.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(titleLabel.frame) + 10, width: 72, height: 72)
        line.frame = CGRect(x: kPublicMargin, y: 135, width: kScreenWidth - kPublicMargin * 2, height: 1)
    }

    func setValue(item:AppSchema.CustomerQuery.Data.Customer.Orders.Edge?) {
        let str = "Order#  \(item?.node.orderNumber ?? 0)"
        let attributedString = NSMutableAttributedString(string: str)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor,value: AppColor.grey_9e9e9e,range: NSMakeRange(0,6))
        titleLabel.attributedText = attributedString

        let dateStr: String = String(item?.node.processedAt.prefix(10) ?? "")
        dateLabel.text = dateStr

        productImg.kf.setImage(with: URL(string: "\(item?.node.lineItems.edges.first?.node.variant?.image?.url ?? "")"))

    }
}
