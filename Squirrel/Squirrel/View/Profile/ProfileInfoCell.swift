//
//  ProfileInfoCell.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/22.
//

import UIKit

class ProfileInfoCell: UITableViewCell {

    var titleLabel: UILabel!
    var btn: UIButton!
    var logoutCallBack: CallBacks?

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
        titleLabel.font = .systemFont(ofSize: 16)
        self.contentView.addSubview(titleLabel)

        btn = UIButton(frame: .zero)
        btn.setTitle("Sign out", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 14)
        btn.setTitleColor(AppColor.grey_757575, for: .normal)
        btn.addTarget(self, action: #selector(logoutClick), for: .touchUpInside)
        self.contentView.addSubview(btn)
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

        titleLabel.frame = CGRect(x: kPublicMargin, y: 17, width: 280, height: 22)
        btn.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(titleLabel.frame), width: 55, height: 20)
    }

    @objc func logoutClick() {
        if logoutCallBack != nil {
            logoutCallBack!()
        }
    }

    func setValue(item:AppSchema.CustomerQuery.Data.Customer?) {
        titleLabel.text = "Welcome \(item?.displayName ?? "")"
    }
}
