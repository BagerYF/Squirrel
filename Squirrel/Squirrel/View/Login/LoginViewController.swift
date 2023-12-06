    //
    //  LoginViewController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/3/24.
    //

import UIKit
import MMKV
import Then

class LoginViewController: BaseViewController {

    static let shareInstance = LoginViewController()

    var emailTextField: TextFieldView!
    var pwdTextField: TextFieldView!
    var firstTextField: TextFieldView!
    var lastTextField: TextFieldView!
    var subscribeBtn: UIButton!
    var loginBtn: UIButton!
    var registerBtn: UIButton!
    var guestBtn: UIButton!
    var logo: UILabel!
    var isLogin = true
    var token : String?
    var customer: AppSchema.CustomerQuery.Data.Customer?

    override func viewDidLoad() {
        navLeftType = .Close
        super.viewDidLoad()

        initView()
    }

    func initData() {
        guard let mmkv = MMKV.default() else {
            return
        }
        token = mmkv.string(forKey: "MMKVToken")
        if token != nil {
            queryCustomer(showLoading: false)
        }
    }

    func initView() {

        logo = UILabel(frame: .zero)
        logo.text = "Shopify"
        logo.textAlignment = .center
        logo.font = .boldSystemFont(ofSize: 30)
        self.view.addSubview(logo)

        firstTextField = TextFieldView.init(title: "First Name", placeHolder: nil, error: nil, required: true, type: nil, optional: nil)

        lastTextField = TextFieldView.init(title: "Last Name", placeHolder: nil, error: nil, required: true, type: nil, optional: nil)

        emailTextField = TextFieldView.init(title: "Email", placeHolder: nil, error: nil, required: true, type: nil, optional: nil)
        self.view.addSubview(emailTextField)

        pwdTextField = TextFieldView.init(title: "Password", placeHolder: nil, error: nil, required: true, type: nil, optional: nil)
        self.view.addSubview(pwdTextField)

        subscribeBtn = UIButton(frame: .zero)
        subscribeBtn.setTitle("  Subscribe to our newsletter", for: .normal)
        subscribeBtn.setTitleColor(.black, for: .normal)
        subscribeBtn.setImage(UIImage(named: "selected"), for: .normal)
        subscribeBtn.setImage(UIImage(named: "unselected"), for: .selected)
        subscribeBtn.titleLabel?.font = .systemFont(ofSize: 14)
        subscribeBtn.contentHorizontalAlignment = .left
        subscribeBtn.addTarget(self, action: #selector(subscribeClick), for: .touchUpInside)

        loginBtn = UIButton(frame: .zero)
        loginBtn.setTitleColor(.white, for: .normal)
        loginBtn.backgroundColor = .black
        loginBtn.layer.cornerRadius = 2
        loginBtn.titleLabel?.font = .systemFont(ofSize: 16)
        loginBtn.addTarget(self, action: #selector(loginClick), for: .touchUpInside)
        self.view.addSubview(loginBtn)

        registerBtn = UIButton(frame: .zero)
        registerBtn.setTitleColor(.black, for: .normal)
        registerBtn.layer.cornerRadius = 2
        registerBtn.layer.borderColor = UIColor.black.cgColor
        registerBtn.layer.borderWidth = 1
        registerBtn.titleLabel?.font = .systemFont(ofSize: 16)
        registerBtn.addTarget(self, action: #selector(registerClick), for: .touchUpInside)
        self.view.addSubview(registerBtn)

        guestBtn = UIButton(frame: .zero)
        guestBtn.titleLabel?.numberOfLines = 0
        guestBtn.titleLabel?.textAlignment = .center
        guestBtn.setTitleColor(.black, for: .normal)
        guestBtn.titleLabel?.font = .systemFont(ofSize: 12)
        guestBtn.addTarget(self, action: #selector(guestClick), for: .touchUpInside)
        self.view.addSubview(guestBtn)

        if isLogin == false {
            let str = NSMutableAttributedString(string: "By signing up you agree with our \n Terms & Conditions and Privacy Policy")
            let rangeO = NSRange(location: 32, length: 22)
            str.addAttribute(.foregroundColor, value: AppColor.grey_9e9e9e, range: rangeO)
            let rangeT = NSRange(location: 58, length: 14)
            str.addAttribute(.foregroundColor, value: AppColor.grey_9e9e9e, range: rangeT)
            guestBtn.setAttributedTitle(str, for: .normal)
            self.view.addSubview(firstTextField)
            self.view.addSubview(lastTextField)
            self.view.addSubview(subscribeBtn)
            loginBtn.setTitle("Create account", for: .normal)
            registerBtn.setTitle("Back to login", for: .normal)
        } else {
            guestBtn.setAttributedTitle(nil, for: .normal)
            guestBtn.setTitle("Continue as guest", for: .normal)
            loginBtn.setTitle("Login", for: .normal)
            registerBtn.setTitle("Create a new account", for: .normal)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if isLogin {
            logo.snp.remakeConstraints { make in
                make.top.equalToSuperview().offset(0)
                make.left.equalToSuperview().offset(kPublicMargin)
                make.right.equalToSuperview().offset(-kPublicMargin)
                make.bottom.equalTo(emailTextField.snp.top).offset(0)
            }
        } else {
            logo.snp.remakeConstraints { make in
                make.top.equalToSuperview().offset(0)
                make.left.equalToSuperview().offset(kPublicMargin)
                make.right.equalToSuperview().offset(-kPublicMargin)
                make.bottom.equalTo(firstTextField.snp.top).offset(0)
            }

            firstTextField.snp.remakeConstraints { make in
                make.left.equalToSuperview().offset(kPublicMargin)
                make.right.equalTo(lastTextField.snp.left).offset(-kPublicMargin)
                make.height.equalTo(firstTextField.showError ? 120 : 96)
                make.bottom.equalTo(emailTextField.snp.top).offset(0)
                make.width.equalTo(lastTextField)
            }

            lastTextField.snp.remakeConstraints { make in
                make.left.equalTo(firstTextField.snp.right).offset(kPublicMargin)
                make.right.equalToSuperview().offset(-kPublicMargin)
                make.height.equalTo(lastTextField.showError ? 120 : 96)
                make.top.equalTo(firstTextField)
                make.width.equalTo(firstTextField)
            }
        }

        emailTextField.snp.remakeConstraints { make in
            make.left.equalToSuperview().offset(kPublicMargin)
            make.right.equalToSuperview().offset(-kPublicMargin)
            make.height.equalTo(emailTextField.showError ? 120 : 96)
            make.bottom.equalTo(pwdTextField.snp.top).offset(0)
        }

        if isLogin {
            pwdTextField.snp.remakeConstraints { make in
                make.left.equalToSuperview().offset(kPublicMargin)
                make.right.equalToSuperview().offset(-kPublicMargin)
                make.height.equalTo(pwdTextField.showError ? 120 : 96)
                make.bottom.equalTo(loginBtn.snp.top).offset(-36)
            }
        } else {
            pwdTextField.snp.remakeConstraints {make in
                make.left.equalToSuperview().offset(kPublicMargin)
                make.right.equalToSuperview().offset(-kPublicMargin)
                make.height.equalTo(pwdTextField.showError ? 120 : 96)
                make.bottom.equalTo(subscribeBtn.snp.top).offset(-kPublicMargin)
            }
            subscribeBtn.snp.makeConstraints { make in
                make.left.equalToSuperview().offset(kPublicMargin)
                make.width.equalTo(280)
                make.height.equalTo(24)
                make.bottom.equalTo(loginBtn.snp.top).offset(-36)
            }
        }

        loginBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(kPublicMargin)
            make.right.equalToSuperview().offset(-kPublicMargin)
            make.height.equalTo(40)
            make.bottom.equalTo(registerBtn.snp.top).offset(-10)
        }
        registerBtn.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(kPublicMargin)
            make.right.equalToSuperview().offset(-kPublicMargin)
            make.height.equalTo(40)
            make.bottom.equalTo(guestBtn.snp.top).offset(-24)
        }
        if isLogin {
            guestBtn.snp.remakeConstraints { make in
                make.left.equalToSuperview().offset(kPublicMargin)
                make.right.equalToSuperview().offset(-kPublicMargin)
                make.height.equalTo(15)
                make.bottom.equalToSuperview().offset(-(UIDevice.safeDistanceBottom() + 10.0))
            }
        } else {
            guestBtn.snp.remakeConstraints { make in
                make.left.equalToSuperview().offset(kPublicMargin)
                make.right.equalToSuperview().offset(-kPublicMargin)
                make.height.equalTo(36)
                make.bottom.equalToSuperview().offset(-(UIDevice.safeDistanceBottom() + 10.0))
            }
        }
    }

    @objc func loginClick() {
        if isLogin {
            let textFields = [emailTextField, pwdTextField]
            var error = false
                //            for item in textFields {
                //                if let r = item?.validateValue() {
                //                    error = r
                //                }
                //            }
            if error == false {
                    // login
                Loading.show()
                Network.shared.apollo.perform(mutation: AppSchema.CustomerAccessTokenCreateMutation(input: AppSchema.CustomerAccessTokenCreateInput(email: "bager1@163.com", password: "123321"))) {[weak self] result in
                    switch result {
                    case .success(let response):
                        self!.token = response.data?.customerAccessTokenCreate?.customerAccessToken?.accessToken
                        guard let mmkv = MMKV.default() else {
                            return
                        }
                        mmkv.set(self!.token!, forKey: "MMKVToken")
                        self!.queryCustomer()
                    case .failure(let error):
                        print("error===\(error)")
                        Loading.dismiss()
                    }
                }
            }
        } else {
            let textFields = [firstTextField, lastTextField, emailTextField, pwdTextField]
            var error = false
                //            for item in textFields {
                //                if let r = item?.validateValue() {
                //                    error = r
                //                }
                //            }
            if error == false {
                    // register
                Loading.show()
                Network.shared.apollo.perform(mutation: AppSchema.CustomerCreateMutation(input: AppSchema.CustomerCreateInput(firstName: "Bager", lastName: "Zhang", email: "bager2@163.com", password: "123321", acceptsMarketing: true))) { result in
                    switch result {
                    case .success(let response):
                        print(response)
                        Loading.dismiss()
                    case .failure(let error):
                        print("error===\(error)")
                        Loading.dismiss()
                    }
                }
            }
        }
    }

    @objc func registerClick() {
        if isLogin {
                // show register
            let str = NSMutableAttributedString(string: "By signing up you agree with our \n Terms & Conditions and Privacy Policy")
            let rangeO = NSRange(location: 32, length: 22)
            str.addAttribute(.foregroundColor, value: AppColor.grey_9e9e9e, range: rangeO)
            let rangeT = NSRange(location: 58, length: 14)
            str.addAttribute(.foregroundColor, value: AppColor.grey_9e9e9e, range: rangeT)
            guestBtn.setAttributedTitle(str, for: .normal)
            isLogin = false
            self.view.addSubview(firstTextField)
            self.view.addSubview(lastTextField)
            self.view.addSubview(subscribeBtn)
            loginBtn.setTitle("Create account", for: .normal)
            registerBtn.setTitle("Back to login", for: .normal)
        } else {
                // show login
            guestBtn.setAttributedTitle(nil, for: .normal)
            guestBtn.setTitle("Continue as guest", for: .normal)
            isLogin = true
            firstTextField.removeFromSuperview()
            lastTextField.removeFromSuperview()
            subscribeBtn.removeFromSuperview()
            loginBtn.setTitle("Login", for: .normal)
            registerBtn.setTitle("Create a new account", for: .normal)
        }
        viewDidLayoutSubviews()
    }

    @objc func guestClick() {
        if isLogin {
            self.dismiss(animated: true)
        }
    }

    @objc func subscribeClick() {
        subscribeBtn.isSelected = !subscribeBtn.isSelected
    }

    func queryCustomer(showLoading: Bool = true, callBack: CallBacks? = nil) {
        if showLoading {
            Loading.show()
        }
        Network.shared.apollo.fetch(query: AppSchema.CustomerQuery(customerAccessToken: token!), cachePolicy: .fetchIgnoringCacheData) { [weak self] result in
            switch result {
            case .success(let response):
                self!.customer = response.data?.customer

                Loading.dismiss()
                self!.dismiss(animated: true)
                ProfileViewController.shareInstance.isLogin = true
                if ProfileViewController.shareInstance.tableView != nil {
                    ProfileViewController.shareInstance.tableView.reloadData()
                }
                if callBack != nil {
                    callBack!()
                }
            case .failure(let error):
                print("error===\(error)")
                Loading.dismiss()
            }
        }
    }
}
