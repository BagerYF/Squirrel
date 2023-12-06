//
//  OrderDetailBasicInfoCell.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/28.
//

import UIKit

class OrderDetailBasicInfoCell: UITableViewCell {

    var subTotalLabel: UILabel!
    var shippingLabel: UILabel!
    var taxesLabel: UILabel!
    var orderNumLabel: UILabel!
    var orderDateLabel: UILabel!
    var shippingMethodLabel: UILabel!
    var contactLabel: UILabel!
    var addressLabel: UILabel!
    var totalLabel: UILabel!

    var lineOne: UIView!
    var lineTwo: UIView!
    var lineThree: UIView!
    var lineFour: UIView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        initView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initView() {
        subTotalLabel = UILabel(frame: .zero)
        subTotalLabel.font = .systemFont(ofSize: 14)
        self.contentView.addSubview(subTotalLabel)

        shippingLabel = UILabel(frame: .zero)
        shippingLabel.font = .systemFont(ofSize: 14)
        self.contentView.addSubview(shippingLabel)

        taxesLabel = UILabel(frame: .zero)
        taxesLabel.font = .systemFont(ofSize: 14)
        self.contentView.addSubview(taxesLabel)

        totalLabel = UILabel(frame: .zero)
        totalLabel.font = .boldSystemFont(ofSize: 16)
        totalLabel.textAlignment = .right
        self.contentView.addSubview(totalLabel)

        orderNumLabel = UILabel(frame: .zero)
        orderNumLabel.font = .systemFont(ofSize: 14)
        self.contentView.addSubview(orderNumLabel)

        orderDateLabel = UILabel(frame: .zero)
        orderDateLabel.font = .systemFont(ofSize: 14)
        self.contentView.addSubview(orderDateLabel)

        shippingMethodLabel = UILabel(frame: .zero)
        shippingMethodLabel.font = .systemFont(ofSize: 14)
        shippingMethodLabel.numberOfLines = 0
        self.contentView.addSubview(shippingMethodLabel)

        contactLabel = UILabel(frame: .zero)
        contactLabel.font = .systemFont(ofSize: 14)
        self.contentView.addSubview(contactLabel)

        addressLabel = UILabel(frame: .zero)
        addressLabel.font = .systemFont(ofSize: 14)
        addressLabel.numberOfLines = 0
        self.contentView.addSubview(addressLabel)

        lineOne = UIView(frame: .zero)
        lineOne.backgroundColor = AppColor.grey_eeeeee
        self.contentView.addSubview(lineOne)

        lineTwo = UIView(frame: .zero)
        lineTwo.backgroundColor = AppColor.grey_eeeeee
        self.contentView.addSubview(lineTwo)

        lineThree = UIView(frame: .zero)
        lineThree.backgroundColor = AppColor.grey_eeeeee
        self.contentView.addSubview(lineThree)

        lineFour = UIView(frame: .zero)
        lineFour.backgroundColor = AppColor.grey_eeeeee
        self.contentView.addSubview(lineFour)
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
        let width = kScreenWidth - kPublicMargin * 2
        subTotalLabel.frame = CGRect(x: kPublicMargin, y: kPublicMargin, width: width, height: 20)
        shippingLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(subTotalLabel.frame), width: width, height: 20)
        taxesLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(shippingLabel.frame), width: width, height: 20)
        totalLabel.frame = CGRect(x: kScreenWidth - kPublicMargin - 150, y: CGRectGetMaxY(shippingLabel.frame), width: 150, height: 20)
        lineOne.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(taxesLabel.frame) + kPublicMargin, width: width, height: 1)

        orderNumLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(lineOne.frame) + kPublicMargin, width: width, height: 20)
        orderDateLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(orderNumLabel.frame), width: width, height: 20)
        lineTwo.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(orderDateLabel.frame) + kPublicMargin, width: width, height: 1)

        shippingMethodLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(lineTwo.frame) + kPublicMargin, width: width, height: 40)
        lineThree.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(shippingMethodLabel.frame) + kPublicMargin, width: width, height: 1)

        contactLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(lineThree.frame) + kPublicMargin, width: width, height: 20)
        addressLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(contactLabel.frame), width: width, height: 60)
        lineFour.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(addressLabel.frame) + kPublicMargin, width: width, height: 1)
    }

    func setValue(item:AppSchema.CustomerQuery.Data.Customer.Orders.Edge?) {

        let str = "Subtotal                  \(item?.node.subtotalPriceV2?.currencyCode.rawValue ?? "") \(item?.node.subtotalPriceV2?.amount ?? "")"
        let attributedString = NSMutableAttributedString(string: str)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor,value: AppColor.grey_9e9e9e,range: NSMakeRange(0,12))
        subTotalLabel.attributedText = attributedString

        var str1 = "Shipping                 \(item?.node.totalShippingPriceV2.currencyCode.rawValue ?? "") \(item?.node.totalShippingPriceV2.amount ?? "")"
        if Int(item?.node.totalShippingPriceV2.amount ?? "") == 0 {
            str1 = "Shipping                      Free"
        }
        let attributedString1 = NSMutableAttributedString(string: str1)
        attributedString1.addAttribute(NSAttributedString.Key.foregroundColor,value: AppColor.grey_9e9e9e,range: NSMakeRange(0,12))
        shippingLabel.attributedText = attributedString1

        let str2 = "Taxes                      \(item?.node.totalTaxV2?.currencyCode.rawValue ?? "") \(item?.node.totalTaxV2?.amount ?? "")"
        let attributedString2 = NSMutableAttributedString(string: str2)
        attributedString2.addAttribute(NSAttributedString.Key.foregroundColor,value: AppColor.grey_9e9e9e,range: NSMakeRange(0,12))
        taxesLabel.attributedText = attributedString2

        let str0 = "Total \(item?.node.totalPriceV2.currencyCode.rawValue ?? "") \(item?.node.totalPriceV2.amount ?? "")"
        totalLabel.text = str0

        let str3 = "Order Number        \(item?.node.orderNumber ?? 0)"
        let attributedString3 = NSMutableAttributedString(string: str3)
        attributedString3.addAttribute(NSAttributedString.Key.foregroundColor,value: AppColor.grey_9e9e9e,range: NSMakeRange(0,12))
        orderNumLabel.attributedText = attributedString3

        let str4 = "Order Date             \(String(item?.node.processedAt.prefix(10) ?? ""))"
        let attributedString4 = NSMutableAttributedString(string: str4)
        attributedString4.addAttribute(NSAttributedString.Key.foregroundColor,value: AppColor.grey_9e9e9e,range: NSMakeRange(0,12))
        orderDateLabel.attributedText = attributedString4

        let str5 = "Shipping                  International Priority Express \n                                Shipping"
        let attributedString5 = NSMutableAttributedString(string: str5)
        attributedString5.addAttribute(NSAttributedString.Key.foregroundColor,value: AppColor.grey_9e9e9e,range: NSMakeRange(0,12))
        shippingMethodLabel.attributedText = attributedString5

        let str6 = "Contact                   \(item?.node.email ?? "")"
        let attributedString6 = NSMutableAttributedString(string: str6)
        attributedString6.addAttribute(NSAttributedString.Key.foregroundColor,value: AppColor.grey_9e9e9e,range: NSMakeRange(0,12))
        contactLabel.attributedText = attributedString6

        let str7 = "Shipping                  \(item?.node.shippingAddress?.firstName ?? "") \(item?.node.shippingAddress?.lastName ?? "") \n                                \(item?.node.shippingAddress?.address1 ?? "") \(item?.node.shippingAddress?.address2 ?? "") \(item?.node.shippingAddress?.city ?? "") \n                                \(item?.node.shippingAddress?.province ?? "") \(item?.node.shippingAddress?.zip ?? "") \(item?.node.shippingAddress?.country ?? "")"
        let attributedString7 = NSMutableAttributedString(string: str7)
        attributedString7.addAttribute(NSAttributedString.Key.foregroundColor,value: AppColor.grey_9e9e9e,range: NSMakeRange(0,12))
        addressLabel.attributedText = attributedString7
    }
}
