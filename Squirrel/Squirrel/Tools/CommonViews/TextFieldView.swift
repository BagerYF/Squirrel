    //
    //  TextFieldView.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/3/24.
    //

import UIKit
import Kingfisher

class TextFieldView: UIView, UITextFieldDelegate {

    var titleLabel: UILabel!
    var textField: UITextField!
    var optionalLabel: UILabel!
    var line: UIView!
    var errorLabel: UILabel!
    var showError = false
    var requireds = false
    var callBack: CallBacks?
    var leftImgView: UIImageView!
    var rightImgView: UIImageView!

    init(title: String, placeHolder: String? = nil, error: String? = nil, required: Bool? = false, type: InputType? = nil, optional: Bool? = false, enable: Bool? = true, leftImg: String? = nil, rightImg: String? = nil, clickCallBack: CallBacks? = nil) {

        super.init(frame: .zero)

        requireds = required ?? false

        callBack = clickCallBack

        titleLabel = UILabel(frame: .zero)
        if required == true {
            titleLabel.text = "\(title)*"
        } else {
            titleLabel.text = title
        }
        titleLabel.font = .systemFont(ofSize: 12)
        self.addSubview(titleLabel)

        if optional == true {
            optionalLabel = UILabel(frame: .zero)
            optionalLabel.text = "optional"
            optionalLabel.font = .systemFont(ofSize: 12)
            optionalLabel.textAlignment = .right
            optionalLabel.textColor = AppColor.grey_9e9e9e
            self.addSubview(optionalLabel)
        }

        textField = UITextField(frame: .zero)
        textField.placeholder = placeHolder ?? title
        textField.font = .systemFont(ofSize: 16)
        textField.delegate = self
        if title == "Password" {
            textField.isSecureTextEntry = true
        }
        textField.isEnabled = enable ?? true
        self.addSubview(textField)

        line = UIView(frame: .zero)
        line.backgroundColor = AppColor.grey_e5e5e5
        self.addSubview(line)

        errorLabel = UILabel(frame: .zero)
        errorLabel.text = error ?? "Enter a \(title.lowercased())"
        errorLabel.textColor = .red
        errorLabel.font = .systemFont(ofSize: 12)

        if enable == false {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction(gesture:)))
            self.isUserInteractionEnabled = true
            self.addGestureRecognizer(tapGesture)
        }

        if leftImg != nil {
            leftImgView = UIImageView(frame: .zero)
            leftImgView.kf.setImage(with: URL(string: "\(leftImg ?? "")"))
            leftImgView.contentMode = .scaleAspectFit
            leftImgView.layer.masksToBounds = true
            leftImgView.layer.cornerRadius = 9
            self.addSubview(leftImgView)
        }

        if rightImg != nil {
            rightImgView = UIImageView(frame: .zero)
            rightImgView.image = UIImage(named: rightImg!)
            rightImgView.contentMode = .center
            self.addSubview(rightImgView)
        }
    }

    @objc func tapAction(gesture: UIGestureRecognizer) {
        if (callBack != nil) {
            callBack!()
        }
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        if requireds && textField.text!.count == 0 {
            line.backgroundColor = .red
            self.addSubview(errorLabel)
            showError = true
        } else {
            line.backgroundColor = AppColor.black
            errorLabel.removeFromSuperview()
            showError = false
        }
        self.parentContainerViewController()?.viewDidLayoutSubviews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        var tempFrame = self.frame
        if showError {
            tempFrame.size.height = CGRectGetMaxY(errorLabel.frame)
        } else {
            tempFrame.size.height = CGRectGetMaxY(line.frame)
        }
        self.frame = tempFrame

        let width = self.frame.size.width

        titleLabel.frame = CGRect(x: 0, y: 32, width: width, height: 15)
        if optionalLabel != nil {
            optionalLabel.frame = CGRect(x: width - 70, y: CGRectGetMinY(titleLabel.frame), width: 70, height: 15)
        }
        if leftImgView != nil {
            leftImgView.frame = CGRect(x: 0, y: CGRectGetMaxY(titleLabel.frame) + 8 + 11, width: 18, height: 18)
            textField.frame = CGRect(x: CGRectGetMaxX(leftImgView.frame) + 5, y: CGRectGetMaxY(titleLabel.frame) + 8, width: width - 23, height: 40)
        } else {
            textField.frame = CGRect(x: 0, y: CGRectGetMaxY(titleLabel.frame) + 8, width: width, height: 40)
        }
        line.frame = CGRect(x: 0, y: CGRectGetMaxY(textField.frame), width: width, height: 1)
        errorLabel.frame = CGRect(x: 0, y: CGRectGetMaxY(line.frame) + 5, width: width, height: 18)
        if rightImgView != nil {
            rightImgView.frame = CGRect(x: width - 40, y: CGRectGetMaxY(titleLabel.frame), width: 40, height: 40)
        }
    }

    func validateValue() -> Bool {
        if requireds && (textField.text!.count == 0) {
            line.backgroundColor = .red
            self.addSubview(errorLabel)
            showError = true
        } else {
            line.backgroundColor = AppColor.black
            errorLabel.removeFromSuperview()
            showError = false
        }
        self.parentContainerViewController()?.viewDidLayoutSubviews()
        return showError
    }
}
