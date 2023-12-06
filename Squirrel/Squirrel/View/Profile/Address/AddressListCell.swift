//
//  AddressListCell.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/27.
//

import UIKit

class AddressListCell: UITableViewCell {

    var titleLabel: UILabel!
    var editBtn: UIButton!
    var deleteBtn: UIButton!
    var editCallBack: CallBacks?
    var deleteCallBack: CallBacks?

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
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.numberOfLines = 0
        self.contentView.addSubview(titleLabel)

        editBtn = UIButton(frame: .zero)
        editBtn.setTitle("  Edit", for: .normal)
        editBtn.titleLabel?.font = .boldSystemFont(ofSize: 14)
        editBtn.setTitleColor(AppColor.black, for: .normal)
        editBtn.setImage(UIImage(named: "address_edit"), for: .normal)
        editBtn.addTarget(self, action: #selector(editClick), for: .touchUpInside)
        self.contentView.addSubview(editBtn)

        deleteBtn = UIButton(frame: .zero)
        deleteBtn.setTitle("  Delete", for: .normal)
        deleteBtn.titleLabel?.font = .boldSystemFont(ofSize: 14)
        deleteBtn.setTitleColor(AppColor.black, for: .normal)
        deleteBtn.setImage(UIImage(named: "address_del"), for: .normal)
        deleteBtn.addTarget(self, action: #selector(deleteClick), for: .touchUpInside)
        self.contentView.addSubview(deleteBtn)
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

        titleLabel.frame = CGRect(x: kPublicMargin, y: kPublicMargin, width: kScreenWidth - kPublicMargin * 2, height: 70)
        deleteBtn.frame = CGRect(x: kScreenWidth - kPublicMargin - 70, y: CGRectGetMaxY(titleLabel.frame), width: 70, height: 40)
        editBtn.frame = CGRect(x: CGRectGetMinX(deleteBtn.frame) - 70, y: CGRectGetMaxY(titleLabel.frame), width: 70, height: 40)
    }

    @objc func editClick() {
        if editCallBack != nil {
            editCallBack!()
        }
    }

    @objc func deleteClick() {
        if deleteCallBack != nil {
            deleteCallBack!()
        }
    }

    func setValue(item:AppSchema.CustomerQuery.Data.Customer.Addresses.Edge?) {
        let str = "\(item?.node.firstName ?? "") \(item?.node.lastName ?? "") \n\(item?.node.address1 ?? "") \(item?.node.address2 ?? "") \(item?.node.city ?? "") \n\(item?.node.province ?? "") \(item?.node.zip ?? "") \(item?.node.country ?? "")"
        let attributedString = NSMutableAttributedString(string: str)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 7
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle,value: paragraphStyle,range: NSMakeRange(0,str.count))
        titleLabel.attributedText = attributedString
    }
}
