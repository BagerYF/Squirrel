    //
    //  CartReviewsAndReturnsCell.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/3/20.
    //

import UIKit

class CartReviewsAndReturnsCell: UITableViewCell {

    var reviewImg: UIImageView!
    var reviewTitle: UILabel!
    var reviewDetail: UILabel!
    var reviewBtn: UILabel!
    var reviewBtnLine: UILabel!

    var returnImg: UIImageView!
    var returnTitle: UILabel!
    var returnDetail: UILabel!
    var returnBtn: UILabel!
    var returnBtnLine: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        initView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initView() {

        reviewImg = UIImageView(frame: .zero)
        reviewImg.contentMode = .scaleAspectFit
        reviewImg.image = UIImage(named: "cart_icon_review")
        self.contentView.addSubview(reviewImg)

        reviewTitle = UILabel(frame: .zero)
        reviewTitle.font = .systemFont(ofSize: 14)
        reviewTitle.text = "Reviews"
        reviewTitle.textAlignment = .center
        self.contentView.addSubview(reviewTitle)

        reviewDetail = UILabel(frame: .zero)
        reviewDetail.font = .systemFont(ofSize: 12)
        reviewDetail.numberOfLines = 0
        reviewDetail.lineBreakMode = .byWordWrapping
        reviewDetail.text = "See what our customers \n have to say about \n shopping with us"
        reviewDetail.textAlignment = .center
        self.contentView.addSubview(reviewDetail)

        reviewBtn = UILabel(frame: .zero)
        reviewBtn.textColor = AppColor.grey_757575
        reviewBtn.text = "See Our Reviews"
        reviewBtn.font = .systemFont(ofSize: 12)
        self.contentView.addSubview(reviewBtn)

        reviewBtnLine = UILabel(frame: .zero)
        reviewBtnLine.backgroundColor = AppColor.grey_757575
        self.contentView.addSubview(reviewBtnLine)

        returnImg = UIImageView(frame: .zero)
        returnImg.contentMode = .scaleAspectFit
        returnImg.image = UIImage(named: "cart_icon_free_return")
        self.contentView.addSubview(returnImg)

        returnTitle = UILabel(frame: .zero)
        returnTitle.font = .systemFont(ofSize: 14)
        returnTitle.text = "Easy returns"
        returnTitle.textAlignment = .center
        self.contentView.addSubview(returnTitle)

        returnDetail = UILabel(frame: .zero)
        returnDetail.font = .systemFont(ofSize: 12)
        returnDetail.numberOfLines = 0
        returnDetail.lineBreakMode = .byWordWrapping
        returnDetail.text = "Shop in confidence with \n a quick and easy return \n process"
        returnDetail.textAlignment = .center
        self.contentView.addSubview(returnDetail)

        returnBtn = UILabel(frame: .zero)
        returnBtn.textColor = AppColor.grey_757575
        returnBtn.text = "Return Policy"
        returnBtn.font = .systemFont(ofSize: 12)
        self.contentView.addSubview(returnBtn)

        returnBtnLine = UILabel(frame: .zero)
        returnBtnLine.backgroundColor = AppColor.grey_757575
        self.contentView.addSubview(returnBtnLine)
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

        var margin = 15.0
        var width = kScreenWidth / 2.0 - 30.0

        reviewImg.frame = CGRect(x: margin, y: 25, width: width, height: 22)
        reviewTitle.frame = CGRect(x: margin, y: CGRectGetMaxY(reviewImg.frame) + 10, width: width, height: 20)
        reviewDetail.frame = CGRect(x: margin, y: CGRectGetMaxY(reviewTitle.frame) + 8, width: width, height: 60)
        reviewBtn.frame = CGRect(x: margin, y: CGRectGetMaxY(reviewDetail.frame) + 8, width: width, height: 20)
        reviewBtn.sizeToFit()
        reviewBtn.center = CGPoint(x: CGRectGetMidX(reviewDetail.frame), y: reviewBtn.center.y)
        reviewBtnLine.frame = CGRect(x: CGRectGetMinX(reviewBtn.frame), y: CGRectGetMaxY(reviewBtn.frame), width: CGRectGetWidth(reviewBtn.frame), height: 1)

        returnImg.frame = CGRect(x:kScreenWidth / 2.0 + margin, y: 25, width: width, height: 22)
        returnTitle.frame = CGRect(x:kScreenWidth / 2.0 +  margin, y: CGRectGetMaxY(returnImg.frame) + 10, width: width, height: 20)
        returnDetail.frame = CGRect(x:kScreenWidth / 2.0 +  margin, y: CGRectGetMaxY(returnTitle.frame) + 8, width: width, height: 60)
        returnBtn.frame = CGRect(x:kScreenWidth / 2.0 +  margin, y: CGRectGetMaxY(returnDetail.frame) + 8, width: width, height: 20)
        returnBtn.sizeToFit()
        returnBtn.center = CGPoint(x: CGRectGetMidX(returnDetail.frame), y: returnBtn.center.y)
        returnBtnLine.frame = CGRect(x: CGRectGetMinX(returnBtn.frame), y: CGRectGetMaxY(returnBtn.frame), width: CGRectGetWidth(returnBtn.frame), height: 1)
    }


    @objc func tapAction(gesture: UIGestureRecognizer) {

    }
}
