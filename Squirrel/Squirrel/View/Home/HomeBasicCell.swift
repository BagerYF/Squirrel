    //
    //  HomePageViewCell.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/1/30.
    //

import UIKit
import Kingfisher

class HomeBasicCell: UITableViewCell {

    var imgView: UIImageView!
    var titleLabel: UILabel!
    var subTitleLabel: UILabel!
    var shopLabel: UILabel!
    var shopLine: UIView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        initView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initView() {
        imgView = UIImageView(frame: .zero)
        imgView.contentMode = .scaleToFill
        self.contentView.addSubview(imgView)

        titleLabel = UILabel(frame: .zero)
        titleLabel.font = .systemFont(ofSize: 24)
        self.contentView.addSubview(titleLabel)

        subTitleLabel = UILabel(frame: .zero)
        subTitleLabel.font = .systemFont(ofSize: 14)
        subTitleLabel.numberOfLines = 2
        subTitleLabel.lineBreakMode = .byWordWrapping
        self.contentView.addSubview(subTitleLabel)

        shopLabel = UILabel(frame: .zero)
        shopLabel.textColor = UIColor.black
        shopLabel.text = "Shop Now"
        shopLabel.font = .systemFont(ofSize: 14)
        self.contentView.addSubview(shopLabel)

        shopLine = UIView(frame: .zero)
        shopLine.backgroundColor = UIColor.black
        self.contentView.addSubview(shopLine)
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
        imgView.frame = CGRect(x: 16, y: 10, width: self.contentView.bounds.width - 32, height: 280)
        titleLabel.frame = CGRect(x: 16, y: 306, width: self.contentView.bounds.width - 32, height: 30)
        subTitleLabel.frame = CGRect(x: 16, y: 344, width: self.contentView.bounds.width - 32, height: 40)
        shopLabel.frame = CGRect(x: 16, y: 400, width: 66, height: 20)
        shopLine.frame = CGRect(x: 16, y: 420, width: 66, height: 1)
    }

    func setValue(item:Item) {
        imgView.kf.setImage(with: URL(string: "\(item.absoluteMobileImageUrl ?? "https://img2.baidu.com/it/u=2716494774,2819221109&fm=253&fmt=auto&app=138&f=JPEG?w=499&h=299")"))
        titleLabel.text = item.brand
        subTitleLabel.text = item.productName
    }
}
