//
//  ProductDetailBasicInfoCell.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/13.
//

import UIKit

class ProductDetailBasicInfoCell: UITableViewCell {

    var titleLabel: UILabel!
    var subTitleLabel: UILabel!
    var comparePrice: UILabel!
    var price: UILabel!
    var wishlist: UILabel!
    var wishlistImg: UIImageView!
    var addedWishlist = false
    var tempProduct: AppSchema.GetProductByIdQuery.Data.Product?

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
        titleLabel.font = .systemFont(ofSize: 24)
        self.contentView.addSubview(titleLabel)

        subTitleLabel = UILabel(frame: .zero)
        subTitleLabel.font = .systemFont(ofSize: 16)
        subTitleLabel.numberOfLines = 2
        subTitleLabel.lineBreakMode = .byWordWrapping
        self.contentView.addSubview(subTitleLabel)

        comparePrice = UILabel(frame: .zero)
        comparePrice.textColor = UIColor.black
        comparePrice.text = "Shop Now"
        comparePrice.font = .systemFont(ofSize: 14)
        self.contentView.addSubview(comparePrice)

        price = UILabel(frame: .zero)
        price.textColor = UIColor.red
        price.text = "Shop Now"
        price.font = .systemFont(ofSize: 14)
        self.contentView.addSubview(price)

        wishlist = UILabel(frame: .zero)
        wishlist.textColor = UIColor.black
        wishlist.text = "Shop Now"
        wishlist.font = .systemFont(ofSize: 14)
        wishlist.textAlignment = .right
        wishlist.isUserInteractionEnabled = true
        self.contentView.addSubview(wishlist)

        wishlistImg = UIImageView(frame: .zero)
        wishlistImg.contentMode = .scaleAspectFit
        wishlistImg.isUserInteractionEnabled = true
        self.contentView.addSubview(wishlistImg)

        let wishlistTapGesture = UITapGestureRecognizer(target: self, action: #selector(wishlistTapAction(gesture:)))
        let wishlistImgTapGesture = UITapGestureRecognizer(target: self, action: #selector(wishlistTapAction(gesture:)))
        wishlist.addGestureRecognizer(wishlistTapGesture)
        wishlistImg.addGestureRecognizer(wishlistImgTapGesture)
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
        titleLabel.frame = CGRect(x: kPublicMargin, y: 0, width: kScreenWidth - kPublicMargin * 2, height: 36)
        subTitleLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(titleLabel.frame), width: kScreenWidth - kPublicMargin * 2, height: 22)
        comparePrice.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(subTitleLabel.frame) + 14, width: 80, height: 25)
        price.frame = CGRect(x: CGRectGetMaxX(comparePrice.frame) + 5, y: CGRectGetMaxY(subTitleLabel.frame) + 14, width: 80, height: 25)
        wishlistImg.frame = CGRect(x: kScreenWidth - kPublicMargin - 18, y: CGRectGetMaxY(subTitleLabel.frame) + 14 + 3, width: 18, height: 18)
        wishlist.frame = CGRect(x: kScreenWidth - kPublicMargin - 18 - 130, y: CGRectGetMaxY(subTitleLabel.frame) + 14, width: 120, height: 25)
    }

    func setValue(product:AppSchema.GetProductByIdQuery.Data.Product?) {
        titleLabel.text = product?.vendor
        subTitleLabel.text = product?.title
        comparePrice.text = "$ \(product?.variants.edges.first?.node.compareAtPrice?.amount ?? "")"
        price.text = "$ \(product?.variants.edges.first?.node.price.amount ?? "")"
        tempProduct = product
        addedWishlist = WishListViewController.shareInstance.isAddedWishlist(product: product!)
        if addedWishlist {
            wishlist.text = "Added to Wishlist"
            wishlistImg.image = UIImage(named: "porduct_detail_star_select")
        } else {
            wishlist.text = "Add to Wishlist"
            wishlistImg.image = UIImage(named: "porduct_detail_star")
        }
    }

    @objc func wishlistTapAction(gesture: UIGestureRecognizer) {
        addedWishlist = !addedWishlist
        print(addedWishlist)
        if addedWishlist {
            WishListViewController.shareInstance.addWishlist(product: tempProduct!)
            wishlist.text = "Added to Wishlist"
            wishlistImg.image = UIImage(named: "porduct_detail_star_select")
        } else {
            WishListViewController.shareInstance.removeWishlist(id: tempProduct!.id)
            wishlist.text = "Add to Wishlist"
            wishlistImg.image = UIImage(named: "porduct_detail_star")
        }
    }
}
