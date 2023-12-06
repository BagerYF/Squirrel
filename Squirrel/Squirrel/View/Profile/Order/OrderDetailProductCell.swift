//
//  OrderDetailProductCell.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/28.
//

import UIKit

class OrderDetailProductCell: UITableViewCell {

    var img: UIImageView!
    var titleLabel: UILabel!
    var subTitleLabel: UILabel!
    var size: UILabel!
    var qtyTitle: UILabel!
    var priceTitle: UILabel!
    var priceValue: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        initView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initView() {

        img = UIImageView(frame: .zero)
        img.contentMode = .scaleAspectFit
        self.contentView.addSubview(img)

        titleLabel = UILabel(frame: .zero)
        titleLabel.font = .systemFont(ofSize: 14)
        self.contentView.addSubview(titleLabel)

        subTitleLabel = UILabel(frame: .zero)
        subTitleLabel.font = .systemFont(ofSize: 14)
        subTitleLabel.numberOfLines = 2
        subTitleLabel.lineBreakMode = .byWordWrapping
        self.contentView.addSubview(subTitleLabel)

        size = UILabel(frame: .zero)
        size.textColor = AppColor.black
        size.font = .systemFont(ofSize: 14)
        size.text = "Size"
        self.contentView.addSubview(size)

        qtyTitle = UILabel(frame: .zero)
        qtyTitle.text = "Qty"
        qtyTitle.textColor = AppColor.black
        qtyTitle.font = .systemFont(ofSize: 14)
        self.contentView.addSubview(qtyTitle)

        priceTitle = UILabel(frame: .zero)
        priceTitle.textColor = AppColor.black
        priceTitle.font = .systemFont(ofSize: 14)
        priceTitle.text = "Price"
        self.contentView.addSubview(priceTitle)

        priceValue = UILabel(frame: .zero)
        priceValue.textColor = AppColor.black
        priceValue.textAlignment = .right
        priceValue.font = .boldSystemFont(ofSize: 16)
        self.contentView.addSubview(priceValue)
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

        img.frame = CGRect(x: kPublicMargin, y: 20, width: 104, height: 156)
        titleLabel.frame = CGRect(x: CGRectGetMaxX(img.frame) + 20, y: 20, width: kScreenWidth - kPublicMargin * 2 - 50 - CGRectGetWidth(img.frame), height: 20)
        subTitleLabel.frame = CGRect(x: CGRectGetMinX(titleLabel.frame), y: CGRectGetMaxY(titleLabel.frame), width: CGRectGetWidth(titleLabel.frame), height: 40)
        size.frame = CGRect(x: CGRectGetMinX(subTitleLabel.frame), y: CGRectGetMaxY(subTitleLabel.frame) + 15, width: CGRectGetWidth(subTitleLabel.frame), height: 20)
        qtyTitle.frame = CGRect(x: CGRectGetMinX(size.frame), y: CGRectGetMaxY(size.frame) + 10, width: CGRectGetWidth(size.frame), height: 20)
        priceTitle.frame = CGRect(x: CGRectGetMinX(qtyTitle.frame), y: CGRectGetMaxY(qtyTitle.frame) + 10, width: 80, height: 20)
        priceValue.frame = CGRect(x: kScreenWidth - kPublicMargin - 120, y: CGRectGetMinY(priceTitle.frame) + 10, width: 120, height: 20)
    }

    func setValue(item: AppSchema.CustomerQuery.Data.Customer.Orders.Edge.Node.LineItems.Edge?) {
        img.kf.setImage(with: URL(string: item?.node.variant?.image?.url ?? AppConstants.ImagePlaceHolder))
        titleLabel.text = item?.node.variant?.product.productType
        subTitleLabel.text = item?.node.title
        size.text = "Size \(item?.node.variant?.title ?? "")"
        qtyTitle.text = "Qty \(item?.node.quantity ?? 0)"
        priceValue.text = "\((item?.node.originalTotalPrice.currencyCode ?? .case(.usd)).rawValue) \(item?.node.originalTotalPrice.amount ?? "")"
    }

}
