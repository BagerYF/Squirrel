//
//  ProductDetailDescriptionCell.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/13.
//

import UIKit

class ProductDetailDescriptionCell: UITableViewCell {

    var titleLabel: UILabel!
    var subTitleLabel: UILabel!

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
        titleLabel.text = "Description"
        self.contentView.addSubview(titleLabel)

        subTitleLabel = UILabel(frame: .zero)
        subTitleLabel.font = .systemFont(ofSize: 14)
        subTitleLabel.numberOfLines = 0
        subTitleLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.contentView.addSubview(subTitleLabel)
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
    }

    func setValue(product:AppSchema.GetProductByIdQuery.Data.Product?) {
        titleLabel.frame = CGRect(x: kPublicMargin, y: 0, width: 74, height: 15)
        subTitleLabel.text = product?.description
        subTitleLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(titleLabel.frame) + 16, width: kScreenWidth - kPublicMargin * 2, height: getLableHeight(labelStr: subTitleLabel.text!, font: .systemFont(ofSize: 14), width: kScreenWidth - kPublicMargin * 2))
    }

    func getCellHeight(product:AppSchema.GetProductByIdQuery.Data.Product?) -> CGFloat {
        titleLabel.frame = CGRect(x: kPublicMargin, y: 0, width: 74, height: 15)
        subTitleLabel.text = product?.description
        subTitleLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(titleLabel.frame) + 16, width: kScreenWidth - kPublicMargin * 2, height: getLableHeight(labelStr: subTitleLabel.text!, font: .systemFont(ofSize: 14), width: kScreenWidth - kPublicMargin * 2))
        return CGRectGetMaxY(subTitleLabel.frame) + 10
    }
}
