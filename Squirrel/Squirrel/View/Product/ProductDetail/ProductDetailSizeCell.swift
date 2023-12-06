//
//  ProductSizeCell.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/13.
//

import UIKit

class ProductDetailSizeCell: UITableViewCell {

    var titleLabel: UILabel!
    var subTitleLabel: UILabel!
    var sizeBg: UIView!
    var size: UILabel!
    var arrowImg: UIImageView!
    var sizeImg: UIImageView!
    var callBack: CallBacks?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        initView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initView() {

        sizeImg = UIImageView(frame: .zero)
        sizeImg.contentMode = .scaleAspectFit
        sizeImg.image = UIImage(named: "porduct_detail_size")
        self.contentView.addSubview(sizeImg)

        titleLabel = UILabel(frame: .zero)
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.text = "Size Guide"
        self.contentView.addSubview(titleLabel)

        sizeBg = UILabel(frame: .zero)
        sizeBg.layer.borderColor = UIColor.black.cgColor
        sizeBg.layer.borderWidth = 1
        sizeBg.isUserInteractionEnabled = true
        self.contentView.addSubview(sizeBg)

        subTitleLabel = UILabel(frame: .zero)
        subTitleLabel.font = .systemFont(ofSize: 16)
        subTitleLabel.text = "Size"
        sizeBg.addSubview(subTitleLabel)

        size = UILabel(frame: .zero)
        size.textColor = UIColor.lightGray
        size.font = .systemFont(ofSize: 14)
        sizeBg.addSubview(size)

        arrowImg = UIImageView(frame: .zero)
        arrowImg.contentMode = .scaleAspectFit
        arrowImg.image = UIImage(named: "porduct_detail_arrow")
        sizeBg.addSubview(arrowImg)

        let sizeTapGesture = UITapGestureRecognizer(target: self, action: #selector(sizeTapAction(gesture:)))
        sizeBg.addGestureRecognizer(sizeTapGesture)
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

        sizeImg.frame = CGRect(x: kPublicMargin, y:0, width: 15, height: 15)
        titleLabel.frame = CGRect(x: CGRectGetMaxX(sizeImg.frame) + 5, y: 0, width: 70, height: 15)
        sizeBg.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(titleLabel.frame) + 20, width: kScreenWidth - kPublicMargin * 2, height: 48)
        subTitleLabel.frame = CGRect(x: 10, y: 0, width: 40, height: 48)
        size.frame = CGRect(x: CGRectGetMaxX(subTitleLabel.frame) + 5, y: 0, width: 180, height: 48)
        arrowImg.frame = CGRect(x: kScreenWidth - kPublicMargin * 2 - 10 - 12, y: 18, width: 12, height: 12)
    }

    func setValue(variant: AppSchema.GetProductByIdQuery.Data.Product.Variants.Edge?) {
        size.text = variant?.node.title
    }

    @objc func sizeTapAction(gesture: UIGestureRecognizer) {
        if (callBack != nil) {
            callBack!()
        }
    }
}
