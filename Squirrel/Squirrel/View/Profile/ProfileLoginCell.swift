    //
    //  ProfileLoginCell.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/3/22.
    //

import UIKit

class ProfileLoginCell: UITableViewCell {
    
    var titleLabel: UILabel!
    var subTitleLabel: UILabel!
    var loginBtn: UIButton!
    var registerBtn: UIButton!
    var loginCallBack: CallBacks?
    var registerCallBack: CallBacks?
    
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
        titleLabel.text = "Login"
        titleLabel.textAlignment = .center
        self.contentView.addSubview(titleLabel)
        
        subTitleLabel = UILabel(frame: .zero)
        subTitleLabel.font = .systemFont(ofSize: 16)
        subTitleLabel.text = "Login to manage your orders and \n fast-track checkout"
        subTitleLabel.textAlignment = .center
        subTitleLabel.numberOfLines = 2
        self.contentView.addSubview(subTitleLabel)
        
        loginBtn = UIButton(frame: .zero)
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.titleLabel?.font = .systemFont(ofSize: 16)
        loginBtn.setTitleColor(AppColor.grey_757575, for: .normal)
        loginBtn.layer.cornerRadius = 2
        loginBtn.backgroundColor = .black
        loginBtn.setTitleColor(.white, for: .normal)
        loginBtn.addTarget(self, action: #selector(loginClick), for: .touchUpInside)
        self.contentView.addSubview(loginBtn)
        
        registerBtn = UIButton(frame: .zero)
        registerBtn.setTitle("Register", for: .normal)
        registerBtn.titleLabel?.font = .systemFont(ofSize: 16)
        registerBtn.setTitleColor(AppColor.black, for: .normal)
        registerBtn.layer.cornerRadius = 2
        registerBtn.layer.borderWidth = 1
        registerBtn.layer.borderColor = AppColor.grey_bdbdbd.cgColor
        registerBtn.addTarget(self, action: #selector(registerClick), for: .touchUpInside)
        self.contentView.addSubview(registerBtn)
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
        
        titleLabel.frame = CGRect(x: 0, y: 16, width: kScreenWidth, height: 20)
        subTitleLabel.frame = CGRect(x: 0, y: CGRectGetMaxY(titleLabel.frame) + 8, width: kScreenWidth, height: 44)
        loginBtn.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(subTitleLabel.frame) + 24, width: (kScreenWidth - kPublicMargin * 2 - 12.0) / 2.0, height: 40)
        registerBtn.frame = CGRect(x: CGRectGetMaxX(loginBtn.frame) + 12, y: CGRectGetMaxY(subTitleLabel.frame) + 24, width: (kScreenWidth - kPublicMargin * 2 - 12.0) / 2.0, height: 40)
    }
    
    @objc func loginClick() {
        if loginCallBack != nil {
            loginCallBack!()
        }
    }
    
    @objc func registerClick() {
        if registerCallBack != nil {
            registerCallBack!()
        }
    }
    
    func setValue(item:Item) {
        titleLabel.text = item.brand
    }
    
}
