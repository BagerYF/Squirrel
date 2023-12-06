//
//  CheckoutPaymentDiscountView.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/29.
//

import UIKit

class CheckoutPaymentDiscountView: UIView {

    var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.text = "Add Code"
        titleLabel.font = .boldSystemFont(ofSize: 12)
        return titleLabel
    }()

    var codeTextField: UITextField = {
        let codeTextField = UITextField(frame: CGRect(x: 0, y: 0, width: kScreenWidth - kPublicMargin * 2 - 70.0 - 10.0, height: 40))
        codeTextField.font = .systemFont(ofSize: 16)
        codeTextField.placeholder = "Gift card or discount code"
        codeTextField.addBottomBorder()
        return codeTextField
    }()

    var applyBtn: UIButton = {
        let applyBtn = UIButton(frame: .zero)
        applyBtn.setTitle("Apply", for: .normal)
        applyBtn.setTitleColor(AppColor.black, for: .normal)
        applyBtn.titleLabel?.font = .systemFont(ofSize: 16)
        applyBtn.layer.borderWidth = 1
        applyBtn.layer.borderColor = AppColor.grey_9e9e9e.cgColor
        applyBtn.layer.cornerRadius = 2
        return applyBtn
    }()

    var codeBtn: UIButton = {
        let codeBtn = UIButton(frame: .zero)
        codeBtn.setTitleColor(AppColor.black, for: .normal)
        codeBtn.titleLabel?.font = .systemFont(ofSize: 16)
        codeBtn.layer.borderWidth = 1
        codeBtn.layer.borderColor = AppColor.grey_9e9e9e.cgColor
        codeBtn.layer.cornerRadius = 2
        return codeBtn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(titleLabel)
        self.addSubview(codeTextField)
        self.addSubview(applyBtn)
        self.addSubview(codeBtn)
        applyBtn.addTarget(self, action: #selector(applyCode), for: .touchUpInside)
        codeBtn.addTarget(self, action: #selector(deleteCode), for: .touchUpInside)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        titleLabel.frame = CGRect(x: kPublicMargin, y: kPublicMargin, width: kScreenWidth - kPublicMargin * 2, height: 15)

        codeTextField.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(titleLabel.frame) + 6, width: kScreenWidth - kPublicMargin * 2 - 70.0 - 10.0, height: 40)

        applyBtn.frame = CGRect(x: CGRectGetMaxX(codeTextField.frame) + 10, y: CGRectGetMaxY(titleLabel.frame) + 6, width: 70, height: 40)

        codeBtn.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(codeTextField.frame) + 30, width: 95, height: 40)
    }

    @objc func applyCode() {
        if codeTextField.text?.count ?? 0 > 0 {
            let checkoutVC = (self.parentContainerViewController() as! CheckoutPaymentViewController).checkoutVC
            checkoutVC?.appleyDiscountCode(code: codeTextField.text ?? "")
        }
    }

    @objc func deleteCode() {
        let checkoutVC = (self.parentContainerViewController() as! CheckoutPaymentViewController).checkoutVC
        checkoutVC?.removeDiscountCode()
    }

    func updateView(code: String) {
        if code.count > 0 {
            self.addSubview(codeBtn)
            let str1 = "\(code) ×"
            let attributedString1 = NSMutableAttributedString(string: str1)
            attributedString1.addAttribute(NSAttributedString.Key.font,value: UIFont.boldSystemFont(ofSize: 22),range: NSMakeRange(str1.count - 1,1))
            codeBtn.setAttributedTitle(attributedString1, for: .normal)
        } else {
            codeBtn.removeFromSuperview()
        }
    }
}
