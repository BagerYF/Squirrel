    //
    //  HelpAndContactViewController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/3/26.
    //

import UIKit
import FittedSheets

class HelpAndContactViewController: BaseViewController {

    var scrollView: UIScrollView!
    var text: UILabel!
    var underlineText: UILabel!
    var titleLabel: UILabel!
    var nameTextField: TextFieldView!
    var emailTextField: TextFieldView!
    var phoneTextField: TextFieldView!
    var enquiryTypeTextField: TextFieldView!
    var enquiryTypeVC = SinglePickController()
    var msgTextField: TextFieldView!

    var relatedView: UIView = {
        var relatedView = UIView(frame: .zero)

        var title = UILabel(frame: CGRect(x: 0, y: 16, width: kScreenWidth - kPublicMargin * 2, height: 22))
        title.text = "Is this Enquiry related to an existing order?*"
        title.numberOfLines = 0
        title.font = .systemFont(ofSize: 16)
        relatedView.addSubview(title)

        var yesBtn = UIButton(frame: CGRect(x: 0, y: CGRectGetMaxY(title.frame), width: 60, height: 54))
        yesBtn.setTitle("  Yes", for: .normal)
        yesBtn.setTitleColor(.black, for: .normal)
        yesBtn.setImage(UIImage(named: "selected"), for: .normal)
        yesBtn.setImage(UIImage(named: "unselected"), for: .selected)
        yesBtn.titleLabel?.font = .systemFont(ofSize: 14)
        yesBtn.contentHorizontalAlignment = .left
        relatedView.addSubview(yesBtn)

        var noBtn = UIButton(frame: CGRect(x: CGRectGetMaxX(yesBtn.frame), y: CGRectGetMaxY(title.frame), width: 60, height: 54))
        noBtn.setTitle("  No", for: .normal)
        noBtn.setTitleColor(.black, for: .normal)
        noBtn.setImage(UIImage(named: "unselected"), for: .normal)
        noBtn.setImage(UIImage(named: "selected"), for: .selected)
        noBtn.titleLabel?.font = .systemFont(ofSize: 14)
        noBtn.contentHorizontalAlignment = .left
        relatedView.addSubview(noBtn)

        return relatedView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Help and Contact"

        initView()

        enquiryTypeVC.callBack = {[weak self] index in
            let type = self!.enquiryTypeVC.data[index as! Int] as String
            self!.enquiryTypeTextField.textField.text = type
            let r = self!.enquiryTypeTextField.validateValue()
            print(r)
        }
    }

    func initView() {
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - 60 - UIDevice.navigationFullHeight() - UIDevice.safeDistanceBottom()))
        scrollView.contentSize = CGSizeMake(kScreenWidth, 0)
        scrollView.showsVerticalScrollIndicator = false
        self.view.addSubview(scrollView)

        text = UILabel(frame: CGRect(x: kPublicMargin, y: kPublicMargin, width: kScreenWidth - kPublicMargin * 2, height: 0))
        let str = """
To submit an inquiry simply complete the contact form below and tap ‘Send’.  We aim to get back to you in one business day.

For information relating to common questions and inquiries please see the links below:
"""
        let attributedString = NSMutableAttributedString(string: str)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle,value: paragraphStyle,range: NSMakeRange(0,str.count))
        text.attributedText = attributedString
        text.numberOfLines = 0
        text.font = .systemFont(ofSize: 16)
        text.sizeToFit()
        scrollView.addSubview(text)

        underlineText = UILabel(frame: CGRect(x: kPublicMargin, y: CGRectGetMaxY(text.frame) + kPublicMargin, width: kScreenWidth - kPublicMargin * 2, height: 0))
        let underlineStr = """
Frequently Asked Questions
Orders and Shipping
Returns and Refunds
"""
        let underlineAttributedString = NSMutableAttributedString(string: underlineStr)
        let underlineParagraphStyle = NSMutableParagraphStyle()
        underlineParagraphStyle.lineSpacing = 8
        underlineAttributedString.addAttribute(NSAttributedString.Key.paragraphStyle,value: underlineParagraphStyle,range: NSMakeRange(0,underlineStr.count))
        underlineAttributedString.addAttribute(NSAttributedString.Key.foregroundColor,value: AppColor.grey_757575,range: NSMakeRange(0,underlineStr.count))
        underlineAttributedString.addAttribute(NSAttributedString.Key.underlineStyle,value: NSUnderlineStyle.single.rawValue,range: NSMakeRange(0,underlineStr.count))
        underlineAttributedString.addAttribute(NSAttributedString.Key.underlineColor,value: AppColor.grey_757575,range: NSMakeRange(0,underlineStr.count))
        underlineText.attributedText = underlineAttributedString
        underlineText.numberOfLines = 0
        underlineText.font = .systemFont(ofSize: 16)
        underlineText.sizeToFit()
        scrollView.addSubview(underlineText)


        titleLabel = UILabel(frame: .zero)
        titleLabel.text = "Contact Form"
        titleLabel.font = .boldSystemFont(ofSize: 16)
        scrollView.addSubview(titleLabel)

        nameTextField = TextFieldView.init(title: "Name", required: true)
        scrollView.addSubview(nameTextField)

        emailTextField = TextFieldView.init(title: "Email", required: true)
        scrollView.addSubview(emailTextField)

        phoneTextField = TextFieldView.init(title: "Phone", optional: true)
        scrollView.addSubview(phoneTextField)

        scrollView.addSubview(relatedView)

        enquiryTypeTextField = TextFieldView.init(title: "Enquiry Type", placeHolder: "Tell us about your enquiry", error: "Please select an enquiry type", required: true, enable: false, rightImg: "arrow_down", clickCallBack: { [weak self] in
            self?.enquiryTypePick()
        })
        scrollView.addSubview(enquiryTypeTextField)

        msgTextField = TextFieldView.init(title: "Message", placeHolder: "Type your message here", required: true)
        scrollView.addSubview(msgTextField)

        let button = UIButton(frame: CGRect(x: kPublicMargin, y: kScreenHeight - 50 - UIDevice.navigationFullHeight() - UIDevice.safeDistanceBottom(), width: kScreenWidth - kPublicMargin * 2, height: 40))
        button.setTitle("Send", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 2
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(sendClick), for: .touchUpInside)
        self.view.addSubview(button)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        titleLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(underlineText.frame) + 32, width: kScreenWidth - kPublicMargin * 2, height: 22)

        nameTextField.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(titleLabel.frame) + 8, width: kScreenWidth - kPublicMargin * 2, height: nameTextField.showError ? 120 : 96)

        emailTextField.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(nameTextField.frame), width: kScreenWidth - kPublicMargin * 2, height: emailTextField.showError ? 120 : 96)

        phoneTextField.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(emailTextField.frame), width: kScreenWidth - kPublicMargin * 2, height: phoneTextField.showError ? 120 : 96)

        relatedView.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(phoneTextField.frame) + kPublicMargin, width: kScreenWidth - kPublicMargin * 2, height: 92)

        enquiryTypeTextField.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(relatedView.frame), width: kScreenWidth - kPublicMargin * 2, height: enquiryTypeTextField.showError ? 120 : 96)

        msgTextField.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(enquiryTypeTextField.frame), width: kScreenWidth - kPublicMargin * 2, height: msgTextField.showError ? 120 : 96)

        scrollView.contentSize = CGSizeMake(kScreenWidth, CGRectGetMaxY(msgTextField.frame) + 100)
    }

    func enquiryTypePick() {
        let data: [String] = [
            "Trouble placing an order",
            "Product information",
            "Status of my order",
            "Delivery tracking",
            "Product I received",
            "Returns",
            "Refunds",
            "Change my address",
        ]
        let sheetController = SheetViewController(controller: enquiryTypeVC, sizes: [.fixed(310 + UIDevice.safeDistanceBottom())], options: SheetOptions(useInlineMode: true))
        enquiryTypeVC.initData(titles: "Please select an enquiry type", sheetControllers: sheetController, datas: data)
        sheetController.allowGestureThroughOverlay = false
        sheetController.gripSize = .zero
        sheetController.cornerRadius = 0

        sheetController.willMove(toParent: self)
        self.addChild(sheetController)
        view.addSubview(sheetController.view)
        sheetController.didMove(toParent: self)

        sheetController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sheetController.view.topAnchor.constraint(equalTo: view.topAnchor),
            sheetController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sheetController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sheetController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        sheetController.animateIn()
    }

    @objc func sendClick() {
        let textFields = [nameTextField, emailTextField, enquiryTypeTextField, msgTextField]
        var error = false
        for item in textFields {
            if let r = item?.validateValue() {
                error = r
            }
        }
        print(error)
    }

}
