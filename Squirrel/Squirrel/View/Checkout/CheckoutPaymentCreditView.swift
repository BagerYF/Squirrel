//
//  CheckoutPaymentCreditView.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/29.
//

import UIKit

class CheckoutPaymentCreditView: UIView {

    var showFreeView = false

    var titleLabel: UILabel = {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.text = "Payment"
        titleLabel.font = .boldSystemFont(ofSize: 12)
        return titleLabel
    }()

    var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel(frame: .zero)
        subTitleLabel.text = "All transactions are secure and encrypted"
        subTitleLabel.font = .systemFont(ofSize: 12)
        return subTitleLabel
    }()

    var creditView: UIView = {
        let creditView = UIView(frame: .zero)
        creditView.layer.borderWidth = 1
        creditView.layer.borderColor = AppColor.grey_eeeeee.cgColor

        let creditTitleLabel = UILabel(frame: CGRect(x: kPublicMargin, y: kPublicMargin, width: 180, height: 22))
        creditTitleLabel.font = .systemFont(ofSize: 16)
        creditTitleLabel.text = "Credit or Debit Card"
        creditView.addSubview(creditTitleLabel)

        let creditImgView = UIImageView(frame: CGRect(x: kScreenWidth - kPublicMargin * 3.0 - 108.0, y: kPublicMargin, width: 108, height: 25))
        creditImgView.image = UIImage(named: "pay_type")
        creditView.addSubview(creditImgView)

        let cardNumtextField = UITextField(frame: CGRect(x: kPublicMargin, y: CGRectGetMaxY(creditTitleLabel.frame) + 20, width: kScreenWidth - kPublicMargin * 4, height: 40))
        cardNumtextField.placeholder = "Card Number"
        cardNumtextField.font = .systemFont(ofSize: 16)
        cardNumtextField.addBottomBorder()
        creditView.addSubview(cardNumtextField)

        let dateTextField = UITextField(frame: CGRect(x: kPublicMargin, y: CGRectGetMaxY(cardNumtextField.frame) + kPublicMargin, width: (kScreenWidth - kPublicMargin * 4) / 2.0, height: 40))
        dateTextField.placeholder = "MM / YY"
        dateTextField.font = .systemFont(ofSize: 16)
        dateTextField.addBottomBorder()
        creditView.addSubview(dateTextField)

        let nameTextField = UITextField(frame: CGRect(x: kPublicMargin, y: CGRectGetMaxY(dateTextField.frame) + kPublicMargin, width: kScreenWidth - kPublicMargin * 4, height: 40))
        nameTextField.placeholder = "Name on Card"
        nameTextField.font = .systemFont(ofSize: 16)
        nameTextField.addBottomBorder()
        creditView.addSubview(nameTextField)

        let codeTextField = UITextField(frame: CGRect(x: kPublicMargin, y: CGRectGetMaxY(nameTextField.frame) + kPublicMargin, width: (kScreenWidth - kPublicMargin * 4) / 2.0, height: 40))
        codeTextField.placeholder = "Security code"
        codeTextField.font = .systemFont(ofSize: 16)
        codeTextField.addBottomBorder()
        creditView.addSubview(codeTextField)

        let creditCardImgView = UIImageView(frame: CGRect(x: CGRectGetMaxX(codeTextField.frame) + 10, y: CGRectGetMaxY(nameTextField.frame) + 20, width: 47, height: 32))
        creditCardImgView.image = UIImage(named: "credit")
        creditView.addSubview(creditCardImgView)

        let tipLabel = UILabel(frame: CGRect(x: kPublicMargin, y: CGRectGetMaxY(codeTextField.frame) + kPublicMargin, width: kScreenWidth - kPublicMargin * 4, height: 34))
        tipLabel.text = "The security number is the three digits on the back of the card in the signature box."
        tipLabel.numberOfLines = 0
        tipLabel.font = .systemFont(ofSize: 12)
        creditView.addSubview(tipLabel)

        return creditView
    }()
    
    var freeView: UIView = {
        let freeView = UIView(frame: .zero)
        freeView.layer.borderWidth = 1
        freeView.layer.borderColor = AppColor.grey_eeeeee.cgColor

        let freeImgView = UIImageView(frame: CGRect(x: (kScreenWidth - kPublicMargin * 2) / 2.0 - 11, y: 25, width: 22, height: 22))
        freeImgView.image = UIImage(named: "payment_free")
        freeView.addSubview(freeImgView)

        let freeTitleLabel = UILabel(frame: CGRect(x: 0, y: CGRectGetMaxY(freeImgView.frame) + 9, width: kScreenWidth - kPublicMargin * 2, height: 20))
        freeTitleLabel.font = .systemFont(ofSize: 16)
        freeTitleLabel.text = "This order is covered by your gift card"
        freeTitleLabel.textAlignment = .center
        freeView.addSubview(freeTitleLabel)

        return freeView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.addSubview(titleLabel)
        self.addSubview(subTitleLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        titleLabel.frame = CGRect(x: kPublicMargin, y: kPublicMargin, width: kScreenWidth - kPublicMargin * 2, height: 15)

        subTitleLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(titleLabel.frame) + 3, width: kScreenWidth - kPublicMargin * 2, height: 15)

        if showFreeView == true {
            freeView.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(subTitleLabel.frame) + kPublicMargin, width: kScreenWidth - kPublicMargin * 2, height: 100)
        } else {
            creditView.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(subTitleLabel.frame) + kPublicMargin, width: kScreenWidth - kPublicMargin * 2, height: 340)
        }
    }

    func updateView(showFreeViews: Bool) {
        showFreeView = showFreeViews
        if showFreeView == true {
            creditView.removeFromSuperview()
            self.addSubview(freeView)
        } else {
            self.addSubview(creditView)
            freeView.removeFromSuperview()
        }
        layoutSubviews()
    }
}
