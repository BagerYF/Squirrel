//
//  CheckoutAddressViewController.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/29.
//

import UIKit
import Kingfisher
import MMKV

class CheckoutAddressViewController: BaseViewController {

    var data: [String : String]?
    var checkoutVC: CheckoutViewController?
    var countryList: [CountryModel] = []
    var tempAddress: [String : String] = [:]

    var scrollView: UIScrollView!
    var titleLabel: UILabel!

    var firstNameTextField: TextFieldView!
    var lastNameTextField: TextFieldView!
    var emailTextField: TextFieldView!
    var countryTextField: TextFieldView!
    var addressTextField: TextFieldView!
    var addressDetailTextField: TextFieldView!
    var cityTextField: TextFieldView!
    var stateTextField: TextFieldView!
    var zipTextField: TextFieldView!
    var phoneTextField: TextFieldView!
    var subscribeBtn: UIButton!
    var saveBtn: UIButton!
    var bottomView: UIView!
    var subTotalLabel: UILabel!
    var totalLabel: UILabel!
    var shippingLabel: UILabel!
    var taxLabel: UILabel!
    var discountLabel: UILabel!
    var nextBtn: UIButton!

    var selectCountryModel: CountryModel?
    var selectStateModel: CountryModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        initView()

        initData()
    }

    func initData() {

        do {
            if let path = Bundle.main.path(forResource: "CountryData", ofType: "json") {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [Dictionary<String, AnyObject>] {
                    for item in jsonResult {
                        countryList.append(CountryModel.init(fromDictionary: item))
                    }
                }
            }
        } catch {
            print("error")
        }

        guard let mmkv = MMKV.default() else {
            return
        }

        let localAddress = mmkv.string(forKey: "MMKVCheckoutAddress")
        if localAddress != nil {
            let datas = localAddress!.data(using: .utf8)!
            do{
                data = try JSONSerialization.jsonObject(with: datas) as? [String : String]
            }
            catch {
                print (error)
            }
        }

        if data == nil {
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
            firstNameTextField.textField.text = data?["firstName"]
            lastNameTextField.textField.text = data?["lastName"]
            addressTextField.textField.text = data?["address1"]
            addressDetailTextField.textField.text = data?["address2"]
            cityTextField.textField.text = data?["city"]
            zipTextField.textField.text = data?["zip"]
            phoneTextField.textField.text = data?["phone"]
            emailTextField.textField.text = data?["email"]

            for item in countryList {
                if item.name == data?["country"] {
                    selectCountryModel = item
                    countryTextField.textField.text = selectCountryModel?.name
                    let imgUrl = "https://d1mp1ehq6zpjr9.cloudfront.net/static/images/flags/\(selectCountryModel?.code ?? "").png"
                    countryTextField.leftImgView?.kf.setImage(with: URL(string: "\(imgUrl)"))
                    break
                }
            }

            for item in selectCountryModel?.provinces ?? [] {
                if item.name == data?["province"] {
                    selectStateModel = item
                    stateTextField.textField.text = selectStateModel?.name
                    break
                }
            }
        }
    }

    func initView() {
        scrollView = UIScrollView(frame: .zero)
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

        emailTextField = TextFieldView.init(title: "Email", required: true)
        scrollView.addSubview(emailTextField)

        subscribeBtn = UIButton(frame: .zero)
        subscribeBtn.setTitle("  Subscribe to our newsletter", for: .normal)
        subscribeBtn.setTitleColor(.black, for: .normal)
        subscribeBtn.setImage(UIImage(named: "select_y"), for: .normal)
        subscribeBtn.setImage(UIImage(named: "select_n"), for: .selected)
        subscribeBtn.titleLabel?.font = .systemFont(ofSize: 14)
        subscribeBtn.contentHorizontalAlignment = .left
        subscribeBtn.addTarget(self, action: #selector(subscribeClick), for: .touchUpInside)
        scrollView.addSubview(subscribeBtn)

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

        saveBtn = UIButton(frame: .zero)
        saveBtn.setTitle("  Save address for next purchase", for: .normal)
        saveBtn.setTitleColor(.black, for: .normal)
        saveBtn.setImage(UIImage(named: "select_y"), for: .normal)
        saveBtn.setImage(UIImage(named: "select_n"), for: .selected)
        saveBtn.titleLabel?.font = .systemFont(ofSize: 14)
        saveBtn.contentHorizontalAlignment = .left
        saveBtn.addTarget(self, action: #selector(subscribeClick), for: .touchUpInside)
        scrollView.addSubview(saveBtn)

        bottomView = UIView(frame: .zero)
        self.view.addSubview(bottomView)

        let line = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 1))
        line.backgroundColor = AppColor.grey_eeeeee
        bottomView.addSubview(line)

        subTotalLabel = UILabel(frame: .zero)
        subTotalLabel.font = .systemFont(ofSize: 14)
        subTotalLabel.text = "Subtotal"
        bottomView.addSubview(subTotalLabel)

        shippingLabel = UILabel(frame: .zero)
        shippingLabel.font = .systemFont(ofSize: 14)
        shippingLabel.text = "Shipping"
        bottomView.addSubview(shippingLabel)

        taxLabel = UILabel(frame: .zero)
        taxLabel.font = .systemFont(ofSize: 14)
        taxLabel.text = "Tax"
        bottomView.addSubview(taxLabel)

        discountLabel = UILabel(frame: .zero)
        discountLabel.font = .systemFont(ofSize: 14)
        discountLabel.text = "Discount"
        bottomView.addSubview(discountLabel)

        totalLabel = UILabel(frame: .zero)
        totalLabel.font = .boldSystemFont(ofSize: 14)
        totalLabel.text = "Total"
        totalLabel.textAlignment = .right
        bottomView.addSubview(totalLabel)

        nextBtn = UIButton(frame: .zero)
        nextBtn.setTitle("Next", for: .normal)
        nextBtn.setTitleColor(.white, for: .normal)
        nextBtn.backgroundColor = .black
        nextBtn.layer.cornerRadius = 2
        nextBtn.titleLabel?.font = .systemFont(ofSize: 16)
        nextBtn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        bottomView.addSubview(nextBtn)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        subTotalLabel.frame = CGRect(x: kPublicMargin, y: kPublicMargin, width: (kScreenWidth - kPublicMargin * 2) / 2.0, height: 20)

        totalLabel.frame = CGRect(x: CGRectGetMaxX(subTotalLabel.frame), y: 10, width: (kScreenWidth - kPublicMargin * 2) / 2.0, height: 20)

        shippingLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(subTotalLabel.frame), width: kScreenWidth - kPublicMargin * 2, height: 20)

        taxLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(shippingLabel.frame), width: kScreenWidth - kPublicMargin * 2, height: 20)

        discountLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(taxLabel.frame), width: kScreenWidth - kPublicMargin * 2, height: 20)

        nextBtn.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(discountLabel.frame) + kPublicMargin, width: kScreenWidth - kPublicMargin * 2, height: 40)

        bottomView.frame = CGRect(x: 0, y: kScreenHeight - UIDevice.navigationFullHeight() - UIDevice.safeDistanceBottom() - CGRectGetMaxY(nextBtn.frame) - 10, width: kScreenWidth, height: CGRectGetMaxY(nextBtn.frame) + 10)

        titleLabel.frame = CGRect(x: kPublicMargin, y: kPublicMargin, width: kScreenWidth - kPublicMargin * 2, height: 22)

        firstNameTextField.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(titleLabel.frame), width: kScreenWidth - kPublicMargin * 2, height: firstNameTextField.showError ? 120 : 96)

        lastNameTextField.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(firstNameTextField.frame), width: kScreenWidth - kPublicMargin * 2, height: lastNameTextField.showError ? 120 : 96)

        emailTextField.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(lastNameTextField.frame), width: kScreenWidth - kPublicMargin * 2, height: emailTextField.showError ? 120 : 96)

        subscribeBtn.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(emailTextField.frame) + 20, width: 280, height: 24)

        countryTextField.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(subscribeBtn.frame), width: kScreenWidth - kPublicMargin * 2, height: countryTextField.showError ? 120 : 96)

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

        saveBtn.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(phoneTextField.frame) + 20, width: 280, height: 24)

        scrollView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - UIDevice.navigationFullHeight() - UIDevice.safeDistanceBottom() - CGRectGetHeight(bottomView.frame))

        scrollView.contentSize = CGSizeMake(kScreenWidth, CGRectGetMaxY(saveBtn.frame) + 50)
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

    @objc func subscribeClick() {
        subscribeBtn.isSelected = !subscribeBtn.isSelected
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

            tempAddress = ["address1": addressTextField.textField.text ?? "", "address2": addressDetailTextField.textField.text ?? "", "city": cityTextField.textField.text ?? "", "country": countryTextField.textField.text ?? "", "firstName": firstNameTextField.textField.text ?? "", "lastName": lastNameTextField.textField.text ?? "", "phone": phoneTextField.textField.text ?? "", "province": stateTextField.textField.text ?? "", "zip": zipTextField.textField.text ?? "", "email": emailTextField.textField.text ?? ""]

            let jsonData = try! JSONSerialization.data(withJSONObject: tempAddress)
            let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)

            guard let mmkv = MMKV.default() else {
                return
            }
            
            mmkv.set(jsonString, forKey: "MMKVCheckoutAddress")

            let addressInput = AppSchema.MailingAddressInput(address1: .some(addressTextField.textField.text ?? ""), address2: .some(addressDetailTextField.textField.text ?? ""), city: .some(cityTextField.textField.text ?? ""), country: .some(countryTextField.textField.text ?? ""), firstName: .some(firstNameTextField.textField.text ?? ""), lastName: .some(lastNameTextField.textField.text ?? ""), phone: .some(phoneTextField.textField.text ?? ""), province: .some(stateTextField.textField.text ?? ""), zip: .some(zipTextField.textField.text ?? ""))

            if checkoutVC != nil {
                checkoutVC?.addressNextClick(address: addressInput)
            }
        }
    }

    func updateView(checkout: AppSchema.CheckoutCommon?, shippingLine: AppSchema.CheckoutShippingLineUpdateMutation.Data.CheckoutShippingLineUpdate.Checkout.ShippingLine?) {
        subTotalLabel.text = "Subtotal     \(checkout?.subtotalPriceV2.currencyCode.rawValue ?? "USD") \(checkout?.subtotalPriceV2.amount ?? "0")"
        taxLabel.text = "Tax             \(checkout?.totalTaxV2.currencyCode.rawValue ?? "USD") \(checkout?.totalTaxV2.amount ?? "0")"
        totalLabel.text = "Totat \(checkout?.totalPriceV2.currencyCode.rawValue ?? "USD") \(checkout?.totalPriceV2.amount ?? "0")"

        let lineItemsSubtotalPrice = Double(checkout?.lineItemsSubtotalPrice.amount ?? "") ?? 0
        let subtotalPriceV2 = Double(checkout?.subtotalPriceV2.amount ?? "") ?? 0
        let discountValue = lineItemsSubtotalPrice - subtotalPriceV2

        discountLabel.text = "Discount    \(checkout?.subtotalPriceV2.currencyCode.rawValue ?? "USD") \(discountValue)"

        if shippingLine != nil {
            shippingLabel.text = "Shipping    \(shippingLine?.priceV2.currencyCode.rawValue ?? "USD") \(shippingLine?.priceV2.amount ?? "0")"
        } else {
            shippingLabel.text = "Shipping    CNY 0.0"
        }
    }
}
