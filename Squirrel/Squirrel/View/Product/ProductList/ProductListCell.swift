//
//  ProductListCell.swift
//  shopifytestios
//
//  Created by Bager on 2023/1/31.
//

import UIKit
import SkeletonView

class ProductListCell: UICollectionViewCell {

    var margin: CGFloat = 0

    var imgView: UIImageView!
    var titleLabel: UILabel!
    var subTitleLabel: UILabel!
    var priceLabel: UILabel!
    var deleteBtn: UIButton!
    var callBack: CallBacks?

    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }

    func initView() {

        isSkeletonable = true

        imgView = UIImageView(frame: .zero)
        imgView.contentMode = .scaleAspectFit
        imgView.isSkeletonable = true
        self.contentView.addSubview(imgView)

        titleLabel = UILabel(frame: .zero)
        titleLabel.font = .boldSystemFont(ofSize: 14)
        titleLabel.textAlignment = .center
        titleLabel.isSkeletonable = true
        self.contentView.addSubview(titleLabel)

        subTitleLabel = UILabel(frame: .zero)
        subTitleLabel.font = .systemFont(ofSize: 14)
        subTitleLabel.textAlignment = .center
        subTitleLabel.numberOfLines = 2
        subTitleLabel.lineBreakMode = .byWordWrapping
        subTitleLabel.isSkeletonable = true
        subTitleLabel.skeletonTextNumberOfLines = 2
        subTitleLabel.skeletonLineSpacing = 2
        subTitleLabel.skeletonTextLineHeight = .fixed(17.0)
        subTitleLabel.skeletonPaddingInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        self.contentView.addSubview(subTitleLabel)

        priceLabel = UILabel(frame: .zero)
        priceLabel.textColor = UIColor.black
        priceLabel.textAlignment = .center
        priceLabel.font = .systemFont(ofSize: 14)
        priceLabel.isSkeletonable = true
        priceLabel.skeletonPaddingInsets = UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
        self.contentView.addSubview(priceLabel)

        deleteBtn = UIButton(frame: .zero)
        deleteBtn.setImage(UIImage(named: "wishlist_colse"), for: .normal)
        deleteBtn.addTarget(self, action: #selector(deleteClick), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imgView.frame = CGRect(x: margin, y: 10, width: self.contentView.bounds.size.width - margin * 2, height: 200)
        titleLabel.frame = CGRect(x: margin, y: CGRectGetMaxY(imgView.frame) + 16.0, width: self.contentView.bounds.width - margin * 2, height: 17)
        subTitleLabel.frame = CGRect(x: margin, y: CGRectGetMaxY(titleLabel.frame), width: self.contentView.bounds.width - margin * 2, height: 34)
        priceLabel.frame = CGRect(x: margin, y: CGRectGetMaxY(subTitleLabel.frame) + 10, width: self.contentView.bounds.width - margin * 2, height: 16)
        deleteBtn.frame = CGRect(x: self.contentView.bounds.size.width - 20, y: 0, width: 20, height: 20)
    }

    func setValue(item:AppSchema.CollectionQuery.Data.Collection.Products.Edge.Node) {
        imgView.kf.setImage(with: URL(string: item.images.edges.count > 0 ? item.images.edges[0].node.url : AppConstants.ImagePlaceHolder))
        titleLabel.text = item.title
        subTitleLabel.text = item.vendor
        priceLabel.text = "$ \(item.variants.edges[0].node.price.amount)"
    }

    func setRecommendedValues(item:AppSchema.ProductRecommendationsQuery.Data.ProductRecommendation) {
        imgView.kf.setImage(with: URL(string: item.images.edges.count > 0 ? item.images.edges[0].node.url : AppConstants.ImagePlaceHolder))
        titleLabel.text = item.title
        subTitleLabel.text = item.vendor
        priceLabel.text = "$ \(item.variants.edges[0].node.price.amount)"
    }

    func setWishlistValues(item:WishlistModel) {
        imgView.kf.setImage(with: URL(string: item.image ?? AppConstants.ImagePlaceHolder))
        titleLabel.text = item.title
        subTitleLabel.text = item.vendor
        priceLabel.text = "$ \(item.price ?? "")"
        self.contentView.addSubview(deleteBtn)
    }

    @objc func deleteClick() {
        if callBack != nil {
            callBack!()
        }
    }
}
