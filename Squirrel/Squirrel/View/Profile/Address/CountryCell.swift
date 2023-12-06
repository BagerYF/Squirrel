//
//  CountryCell.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/28.
//

import UIKit

class CountryCell: UITableViewCell {

    var leftImgView: UIImageView!
    var rightImgView: UIImageView!
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
        leftImgView = UIImageView(frame: .zero)
        leftImgView.contentMode = .scaleAspectFit
        leftImgView.layer.masksToBounds = true
        leftImgView.layer.cornerRadius = 9
        self.contentView.addSubview(leftImgView)

        rightImgView = UIImageView(frame: .zero)
        rightImgView.contentMode = .scaleAspectFit
        self.contentView.addSubview(rightImgView)

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
        leftImgView.frame = CGRect(x: kPublicMargin, y: 15, width: 18, height: 18)
        rightImgView.frame = CGRect(x: kScreenWidth - kPublicMargin - 30, y: 15, width: 18, height: 18)
        line.frame = CGRect(x: kPublicMargin, y: 47, width: kScreenWidth - kPublicMargin * 2, height: 1)
    }
}
