//
//  ProfileLogoutCell.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/22.
//

import UIKit

import SnapKit

class ProfileLogoutCell: UITableViewCell {

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
        btn = UIButton(frame: .zero)
        btn.setTitle("Sign out", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 16)
        btn.layer.cornerRadius = 2
        btn.layer.borderWidth = 1
        btn.layer.borderColor = AppColor.grey_bdbdbd.cgColor
        btn.setTitleColor(AppColor.black, for: .normal)
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

        btn.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(85)
            make.height.equalTo(32)
            make.center.equalTo(self.contentView)
        }
    }

    @objc func logoutClick() {
        if logoutCallBack != nil {
            logoutCallBack!()
        }
    }
}
