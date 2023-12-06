    //
    //  AddressDetailViewController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/3/27.
    //

import UIKit
import Kingfisher

class AddressDetailViewController: BaseViewController {

    var data: AppSchema.CustomerQuery.Data.Customer.Addresses.Edge?
    var callBack: CallBacks?
    var countryList: [CountryModel] = []

    var scrollView: UIScrollView!
    var titleLabel: UILabel!

    var firstNameTextField: TextFieldView!
    var lastNameTextField: TextFieldView!
    var countryTextField: TextFieldView!
    var addressTextField: TextFieldView!
    var addressDetailTextField: TextFieldView!
    var cityTextField: TextFieldView!
    var stateTextField: TextFieldView!
    var zipTextField: TextFieldView!
    var phoneTextField: TextFieldView!

    var selectCountryModel: CountryModel?
    var selectStateModel: CountryModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        initView()

        initData()
    }

    func initData() {

        if data == nil {
            title = "Add address"
            for item in countryList {
                if item.code == "CN" {
                    selectCountryModel = item
                    countryTextField.textField.text = selectCountryModel?.name
                    let imgUrl = "https://d1mp1ehq6zpjr9.cloudfront.net/static/images/flags/\(selectCountryModel?.code ?? "").png"
                    countryTextField.leftImgView?.kf.setImage(with: URL(string: "\(imgUrl)"))
                    break
                }
            }
        } else {
            title = "Update Address"
            firstNameTextField.textField.text = data?.node.firstName
            lastNameTextField.textField.text = data?.node.lastName
            addressTextField.textField.text = data?.node.address1
            addressDetailTextField.textField.text = data?.node.address2
            cityTextField.textField.text = data?.node.city
            zipTextField.textField.text = data?.node.zip
            phoneTextField.textField.text = data?.node.phone

            for item in countryList {
                if item.code == data?.node.countryCodeV2?.rawValue {
                    selectCountryModel = item
                    countryTextField.textField.text = selectCountryModel?.name
                    let imgUrl = "https://d1mp1ehq6zpjr9.cloudfront.net/static/images/flags/\(selectCountryModel?.code ?? "").png"
                    countryTextField.leftImgView?.kf.setImage(with: URL(string: "\(imgUrl)"))
                    break
                }
            }

            for item in selectCountryModel?.provinces ?? [] {
                if item.code == data?.node.provinceCode {
                    selectStateModel = item
                    stateTextField.textField.text = selectStateModel?.name
                    break
                }
            }
        }
    }

    func initView() {
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - 60 - UIDevice.navigationFullHeight() - UIDevice.safeDistanceBottom()))
        scrollView.contentSize = CGSizeMake(kScreenWidth, 0)
        scrollView.showsVerticalScrollIndicator = false
        self.view.addSubview(scrollView)

        titleLabel = UILabel(frame: .zero)
        titleLabel.text = "*Required Fields"
        titleLabel.font = .boldSystemFont(ofSize: 12)
        scrollView.addSubview(titleLabel)

        firstNameTextField = TextFieldView.init(title: "First Name", required: true)
        scrollView.addSubview(firstNameTextField)

        lastNameTextField = TextFieldView.init(title: "Last Name", required: true)
        scrollView.addSubview(lastNameTextField)

        let imgUrl = "https://d1mp1ehq6zpjr9.cloudfront.net/static/images/flags/\(selectCountryModel?.code ?? "").png"
        countryTextField = TextFieldView.init(title: "Country", error: "Please select a country", required: true, enable: false, leftImg: imgUrl, rightImg: "arrow_down", clickCallBack: { [weak self] in
            self?.selectCountry()
        })
        countryTextField.textField.text = selectCountryModel?.name ?? ""
        scrollView.addSubview(countryTextField)

        addressTextField = TextFieldView.init(title: "Address", required: true)
        scrollView.addSubview(addressTextField)

        addressDetailTextField = TextFieldView.init(title: "Apartment,Suite,Unit,Building", optional: true)
        scrollView.addSubview(addressDetailTextField)

        cityTextField = TextFieldView.init(title: "City", required: true)
        scrollView.addSubview(cityTextField)

        stateTextField = TextFieldView.init(title: "State", error: "Please select a state", required: true, enable: false, rightImg: "arrow_down", clickCallBack: { [weak self] in
            self?.selectState()
        })
        scrollView.addSubview(stateTextField)

        zipTextField = TextFieldView.init(title: "Postcode / Zipcode", required: true)
        scrollView.addSubview(zipTextField)

        phoneTextField = TextFieldView.init(title: "Phone", optional: true)
        scrollView.addSubview(phoneTextField)

        let button = UIButton(frame: CGRect(x: kPublicMargin, y: kScreenHeight - 50 - UIDevice.navigationFullHeight() - UIDevice.safeDistanceBottom(), width: kScreenWidth - kPublicMargin * 2, height: 40))
        if data == nil {
            button.setTitle("Add address", for: .normal)
        } else {
            button.setTitle("Update address", for: .normal)
        }

        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 2
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        self.view.addSubview(button)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        titleLabel.frame = CGRect(x: kPublicMargin, y: kPublicMargin, width: kScreenWidth - kPublicMargin * 2, height: 22)

        firstNameTextField.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(titleLabel.frame), width: kScreenWidth - kPublicMargin * 2, height: firstNameTextField.showError ? 120 : 96)

        lastNameTextField.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(firstNameTextField.frame), width: kScreenWidth - kPublicMargin * 2, height: lastNameTextField.showError ? 120 : 96)

        countryTextField.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(lastNameTextField.frame), width: kScreenWidth - kPublicMargin * 2, height: countryTextField.showError ? 120 : 96)

        addressTextField.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(countryTextField.frame), width: kScreenWidth - kPublicMargin * 2, height: addressTextField.showError ? 120 : 96)

        addressDetailTextField.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(addressTextField.frame), width: kScreenWidth - kPublicMargin * 2, height: addressDetailTextField.showError ? 120 : 96)

        cityTextField.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(addressDetailTextField.frame), width: kScreenWidth - kPublicMargin * 2, height: cityTextField.showError ? 120 : 96)

        if selectCountryModel?.provinces.count ?? 0 > 0 {
            scrollView.addSubview(stateTextField)
            stateTextField.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(cityTextField.frame), width: (kScreenWidth - kPublicMargin * 3) / 2.0, height: stateTextField.showError ? 120 : 96)
            zipTextField.frame = CGRect(x:CGRectGetMaxX(stateTextField.frame) + kPublicMargin, y: CGRectGetMaxY(cityTextField.frame), width: (kScreenWidth - kPublicMargin * 3) / 2.0, height: zipTextField.showError ? 120 : 96)
        } else {
            stateTextField.removeFromSuperview()
            zipTextField.frame = CGRect(x:kPublicMargin, y: CGRectGetMaxY(cityTextField.frame), width: kScreenWidth - kPublicMargin * 2, height: zipTextField.showError ? 120 : 96)
        }

        phoneTextField.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(zipTextField.frame), width: kScreenWidth - kPublicMargin * 2, height: phoneTextField.showError ? 120 : 96)

        scrollView.contentSize = CGSizeMake(kScreenWidth, CGRectGetMaxY(phoneTextField.frame) + 50)
    }

    func selectCountry() {
        let country = CountryViewController()
        country.allList = countryList
        country.callBack = { [weak self] e in
            self!.selectCountryModel = e as? CountryModel
            self!.countryTextField.textField.text = self!.selectCountryModel?.name
            self!.viewDidLayoutSubviews()
            self!.selectStateModel = nil
            self!.stateTextField.textField.text = ""
            let imgUrl = "https://d1mp1ehq6zpjr9.cloudfront.net/static/images/flags/\(self!.selectCountryModel?.code ?? "").png"
            self!.countryTextField.leftImgView?.kf.setImage(with: URL(string: "\(imgUrl)"))
        }
        country.selectCode = selectCountryModel?.code ?? ""
        let navigation = BaseNavigationController(rootViewController: country)
        navigation.navigationBar.backgroundColor = .white
        navigation.modalPresentationStyle = .custom
        self.present(navigation, animated: true)
    }

    func selectState() {
        let country = CountryViewController()
        country.allList = selectCountryModel?.provinces ?? []
        country.callBack = { [weak self] e in
            self!.selectStateModel = e as? CountryModel
            self!.stateTextField.textField.text = self!.selectStateModel?.name
        }
        country.selectCode = selectStateModel?.code ?? ""
        let navigation = BaseNavigationController(rootViewController: country)
        navigation.navigationBar.backgroundColor = .white
        navigation.modalPresentationStyle = .custom
        self.present(navigation, animated: true)
    }

    @objc func btnClick() {
        var textFields = [firstNameTextField, lastNameTextField, addressTextField, cityTextField, stateTextField, zipTextField]
        if selectCountryModel?.provinces.count ?? 0 == 0 {
            textFields.remove(at: 4)
        }
        var error = false
        for item in textFields {
            if let r = item?.validateValue() {
                error = r
            }
        }
        if error == false {
            Loading.show()
            if data == nil {
                Network.shared.apollo.perform(mutation: AppSchema.CustomerAddressCreateMutation(address: AppSchema.MailingAddressInput(address1: .some(addressTextField.textField.text ?? ""), address2: .some(addressDetailTextField.textField.text ?? ""), city: .some(cityTextField.textField.text ?? ""), country: .some(countryTextField.textField.text ?? ""), firstName: .some(firstNameTextField.textField.text ?? ""), lastName: .some(lastNameTextField.textField.text ?? ""), phone: .some(phoneTextField.textField.text ?? ""), province: .some(stateTextField.textField.text ?? ""), zip: .some(zipTextField.textField.text ?? "")), customerAccessToken:LoginViewController.shareInstance.token!)) { [weak self] result in
                    switch result {
                    case .success(_):
                        Loading.dismiss()
                        if self?.callBack != nil {
                            self?.callBack!()
                        }
                        self?.navigationController?.popViewController(animated: true)
                    case .failure(let error):
                        print("error===\(error)")
                        Loading.dismiss()
                    }
                }
            } else {
                Network.shared.apollo.perform(mutation: AppSchema.CustomerAddressUpdateMutation(address: AppSchema.MailingAddressInput(address1: .some(addressTextField.textField.text ?? ""), address2: .some(addressDetailTextField.textField.text ?? ""), city: .some(cityTextField.textField.text ?? ""), country: .some(countryTextField.textField.text ?? ""), firstName: .some(firstNameTextField.textField.text ?? ""), lastName: .some(lastNameTextField.textField.text ?? ""), phone: .some(phoneTextField.textField.text ?? ""), province: .some(stateTextField.textField.text ?? ""), zip: .some(zipTextField.textField.text ?? "")), customerAccessToken:LoginViewController.shareInstance.token!, id: data?.node.id ?? "")) { [weak self] result in
                    switch result {
                    case .success(_):
                        Loading.dismiss()
                        if self?.callBack != nil {
                            self?.callBack!()
                        }
                        self?.navigationController?.popViewController(animated: true)
                    case .failure(let error):
                        print("error===\(error)")
                        Loading.dismiss()
                    }
                }
            }
        }
    }
}
