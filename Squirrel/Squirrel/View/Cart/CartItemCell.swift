    //
    //  CartItemCell.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/3/20.
    //

import UIKit

class CartItemCell: UITableViewCell {

    var img: UIImageView!
    var titleLabel: UILabel!
    var subTitleLabel: UILabel!
    var deleteImg: UIImageView!
    var size: UILabel!
    var qtyView: UIView!
    var qtyTitle: UILabel!
    var qtyValue: UILabel!
    var qtyImg: UIImageView!
    var priceTitle: UILabel!
    var priceValue: UILabel!
    var wishlist: UILabel!
    var outofstockLabel: UILabel!
    var outofstockImg: UIImageView!
    var line: UIView!
    var deleteCallBack: CallBacks?
    var qtyCallBack: CallBacks?

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

        deleteImg = UIImageView(frame: .zero)
        deleteImg.contentMode = .scaleAspectFit
        deleteImg.isUserInteractionEnabled = true
        deleteImg.image = UIImage(named: "cart_delete_product")
        self.contentView.addSubview(deleteImg)

        let deleteImgTapGesture = UITapGestureRecognizer(target: self, action: #selector(deleteTapAction(gesture:)))
        deleteImg.addGestureRecognizer(deleteImgTapGesture)

        size = UILabel(frame: .zero)
        size.textColor = AppColor.grey_757575
        size.font = .systemFont(ofSize: 14)
        self.contentView.addSubview(size)

        qtyView = UIView(frame: .zero)
        qtyView.backgroundColor = AppColor.grey_eeeeee
        qtyView.layer.cornerRadius = 4
        qtyView.isUserInteractionEnabled = true
        self.contentView.addSubview(qtyView)

        let qtyTapGesture = UITapGestureRecognizer(target: self, action: #selector(qtyTapAction(gesture:)))
        qtyView.addGestureRecognizer(qtyTapGesture)

        qtyTitle = UILabel(frame: .zero)
        qtyTitle.text = "Qty"
        qtyTitle.textColor = AppColor.grey_757575
        qtyTitle.font = .systemFont(ofSize: 14)
        qtyView.addSubview(qtyTitle)

        qtyValue = UILabel(frame: .zero)
        qtyValue.font = .systemFont(ofSize: 14)
        qtyView.addSubview(qtyValue)

        qtyImg = UIImageView(frame: .zero)
        qtyImg.contentMode = .center
        qtyImg.image = UIImage(named: "porduct_detail_arrow")
        qtyView.addSubview(qtyImg)

        priceTitle = UILabel(frame: .zero)
        priceTitle.textColor = AppColor.grey_757575
        priceTitle.font = .systemFont(ofSize: 12)
        self.contentView.addSubview(priceTitle)

        priceValue = UILabel(frame: .zero)
        priceValue.textColor = AppColor.black
        priceValue.textAlignment = .right
        priceValue.font = .systemFont(ofSize: 14)
//        self.contentView.addSubview(priceValue)

        wishlist = UILabel(frame: .zero)
        wishlist.textColor = AppColor.grey_757575
        wishlist.font = .systemFont(ofSize: 12)
        wishlist.text = "Move to wishlist"
        self.contentView.addSubview(wishlist)

        outofstockLabel = UILabel(frame: .zero)
        outofstockLabel.font = .systemFont(ofSize: 14)
        outofstockLabel.text = "Out of Stock"
        outofstockLabel.textColor = AppColor.grey_757575
        outofstockLabel.textAlignment = .right
        self.contentView.addSubview(outofstockLabel)

        outofstockImg = UIImageView(frame: .zero)
        outofstockImg.contentMode = .scaleAspectFit
        outofstockImg.image = UIImage(named: "icon_cart_stock_big")
        self.contentView.addSubview(outofstockImg)

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

        img.frame = CGRect(x: kPublicMargin, y: 20, width: 104, height: 156)
        titleLabel.frame = CGRect(x: CGRectGetMaxX(img.frame) + 20, y: 20, width: kScreenWidth - kPublicMargin * 2 - 50 - 18 - CGRectGetWidth(img.frame), height: 20)
        subTitleLabel.frame = CGRect(x: CGRectGetMinX(titleLabel.frame), y: CGRectGetMaxY(titleLabel.frame), width: CGRectGetWidth(titleLabel.frame), height: 40)
        deleteImg.frame = CGRect(x: kScreenWidth - kPublicMargin - 16, y: 24, width: 16, height: 16)
        size.frame = CGRect(x: CGRectGetMinX(subTitleLabel.frame), y: CGRectGetMaxY(subTitleLabel.frame) + 8, width: CGRectGetWidth(subTitleLabel.frame), height: 20)
        wishlist.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(img.frame) + 8, width: CGRectGetWidth(img.frame), height: 20)
        qtyView.frame = CGRect(x: CGRectGetMinX(size.frame), y: CGRectGetMaxY(size.frame) + 12, width: 120, height: 32)
        qtyTitle.frame = CGRect(x: 10, y: 0, width: 30, height: 32)
        qtyValue.frame = CGRect(x: CGRectGetMaxX(qtyTitle.frame), y: 0, width: 50, height: 32)
        qtyImg.frame = CGRect(x: CGRectGetWidth(qtyView.frame) - 30, y: 0, width: 30, height: 32)
        priceTitle.frame = CGRect(x: CGRectGetMinX(qtyView.frame), y: CGRectGetMinY(wishlist.frame), width: 100, height: 20)
        priceValue.frame = CGRect(x: kScreenWidth - kPublicMargin - 120, y: CGRectGetMinY(wishlist.frame), width: 120, height: 20)
        outofstockImg.frame = CGRect(x: kScreenWidth - kPublicMargin - 20, y: CGRectGetMinY(wishlist.frame) + 3, width: 14, height: 14)
        outofstockLabel.frame = CGRect(x: kScreenWidth - kPublicMargin - 120, y: CGRectGetMinY(wishlist.frame), width: 95, height: 20)
        line.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(self.contentView.frame) - 1, width: kScreenWidth - kPublicMargin * 2, height: 1)
    }

    func setValue(item: AppSchema.CartCommon.Lines.Edge?) {
        img.kf.setImage(with: URL(string: item?.node.merchandise.asProductVariant?.image?.url ?? AppConstants.ImagePlaceHolder))
        titleLabel.text = item?.node.merchandise.asProductVariant?.product.productType
        subTitleLabel.text = item?.node.merchandise.asProductVariant?.product.title
        size.text = item?.node.merchandise.asProductVariant?.title
        qtyValue.text = "\(item?.node.quantity ?? 0)"
        if (item?.node.quantity ?? 0) > (item?.node.merchandise.asProductVariant?.quantityAvailable ?? 0) {
            priceTitle.text = "See related items"
            self.contentView.addSubview(outofstockLabel)
            self.contentView.addSubview(outofstockImg)
            priceValue.removeFromSuperview()
            titleLabel.textColor = AppColor.grey_757575
            subTitleLabel.textColor = AppColor.grey_757575
        } else {
            self.contentView.addSubview(priceValue)
            outofstockImg.removeFromSuperview()
            outofstockLabel.removeFromSuperview()
            priceTitle.text = "Price"
            priceValue.text = "\((item?.node.cost.totalAmount.currencyCode ?? .case(.usd)).rawValue) \(item?.node.cost.totalAmount.amount ?? "")"
            titleLabel.textColor = AppColor.black
            subTitleLabel.textColor = AppColor.black
        }
    }

    @objc func deleteTapAction(gesture: UIGestureRecognizer) {
        if (deleteCallBack != nil) {
            deleteCallBack!()
        }
    }

    @objc func qtyTapAction(gesture: UIGestureRecognizer) {
        if (qtyCallBack != nil) {
            qtyCallBack!()
        }
    }
}
