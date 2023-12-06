//
//  OrderDetailContactCell.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/28.
//

import UIKit

class OrderDetailContactCell: UITableViewCell {

    var helpImg: UIImageView!
    var helpLabel: UILabel!
    var returnLabel: UILabel!
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

        helpImg = UIImageView(frame: .zero)
        helpImg.contentMode = .scaleAspectFit
        helpImg.image = UIImage(named: "icon_order_problem")
        self.contentView.addSubview(helpImg)

        helpLabel = UILabel(frame: .zero)
        helpLabel.font = .systemFont(ofSize: 14)
        helpLabel.textAlignment = .center
        helpLabel.numberOfLines = 0
        helpLabel.textColor = AppColor.grey_616161
        self.contentView.addSubview(helpLabel)
        let str = "Help and Contact \nQuestions about your\norder? Don't hesitate to ask\nContact Shopify"
        let attributedString = NSMutableAttributedString(string: str)
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor,value: AppColor.black,range: NSMakeRange(0,16))
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor,value: AppColor.grey_9e9e9e,range: NSMakeRange(str.count - 16,16))
        attributedString.addAttribute(NSAttributedString.Key.font,value: UIFont.boldSystemFont(ofSize: 14),range: NSMakeRange(0,15))
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle,value: NSUnderlineStyle.single.rawValue,range: NSMakeRange(str.count - 16,16))
        attributedString.addAttribute(NSAttributedString.Key.underlineColor,value: AppColor.grey_9e9e9e,range: NSMakeRange(str.count - 16,16))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8
        paragraphStyle.alignment = .center
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle,value: paragraphStyle,range: NSMakeRange(0,str.count))
        helpLabel.attributedText = attributedString

        returnLabel = UILabel(frame: .zero)
        returnLabel.font = .systemFont(ofSize: 14)
        returnLabel.numberOfLines = 0
        returnLabel.textColor = AppColor.grey_616161
        self.contentView.addSubview(returnLabel)

        let str1 = "Return Information \nThe eligible return period for this item(s) has expired. For more information, see our Return Policy.\nReturn Policy"
        let attributedString1 = NSMutableAttributedString(string: str1)
        attributedString1.addAttribute(NSAttributedString.Key.foregroundColor,value: AppColor.black,range: NSMakeRange(0,19))
        attributedString1.addAttribute(NSAttributedString.Key.foregroundColor,value: AppColor.grey_9e9e9e,range: NSMakeRange(str1.count - 14,14))
        attributedString1.addAttribute(NSAttributedString.Key.font,value: UIFont.boldSystemFont(ofSize: 14),range: NSMakeRange(0,19))
        attributedString1.addAttribute(NSAttributedString.Key.underlineStyle,value: NSUnderlineStyle.single.rawValue,range: NSMakeRange(str1.count - 14,14))
        attributedString1.addAttribute(NSAttributedString.Key.underlineColor,value: AppColor.grey_9e9e9e,range: NSMakeRange(str1.count - 14,14))
        let paragraphStyle1 = NSMutableParagraphStyle()
        paragraphStyle1.lineSpacing = 8
        attributedString1.addAttribute(NSAttributedString.Key.paragraphStyle,value: paragraphStyle1,range: NSMakeRange(0,str1.count))
        returnLabel.attributedText = attributedString1

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
        helpImg.frame = CGRect(x: kScreenWidth / 2.0 - 10, y: 40, width: 20, height: 20)
        helpLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(helpImg.frame) + kPublicMargin, width: kScreenWidth - kPublicMargin * 2, height: 100)
        line.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(helpLabel.frame) + 40, width: kScreenWidth - kPublicMargin * 2, height: 1)
        returnLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(line.frame) + kPublicMargin, width: kScreenWidth - kPublicMargin * 2, height: 100)
    }
}
