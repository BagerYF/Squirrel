//
//  CheckoutPaymentViewController.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/29.
//

import UIKit

class CheckoutPaymentViewController: BaseViewController {

    var data: [String : String]?
    var shippingMethodView: [UIView] = []
    var checkoutVC: CheckoutViewController?

    var scrollView: UIScrollView!

    var contactLabel: UILabel!
    var addressLabel: UILabel!
    var deliveryLabel: UILabel!
    var lineView: UIView!

    var bottomView: UIView!
    var subTotalLabel: UILabel!
    var totalLabel: UILabel!
    var shippingLabel: UILabel!
    var taxLabel: UILabel!
    var discountLabel: UILabel!
    var nextBtn: UIButton!

    var creditView: CheckoutPaymentCreditView!
    var billingAddressView: CheckoutPaymentBillingAddressView!
    var discountView: CheckoutPaymentDiscountView!

    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }

    func initView() {
        scrollView = UIScrollView(frame: .zero)
        scrollView.contentSize = CGSizeMake(kScreenWidth, 0)
        scrollView.showsVerticalScrollIndicator = false
        self.view.addSubview(scrollView)

        contactLabel = UILabel(frame: .zero)
        contactLabel.font = .boldSystemFont(ofSize: 12)
        contactLabel.text = "Contact"
        scrollView.addSubview(contactLabel)

        addressLabel = UILabel(frame: .zero)
        addressLabel.font = .boldSystemFont(ofSize: 12)
        addressLabel.text = "Address"
        scrollView.addSubview(addressLabel)

        deliveryLabel = UILabel(frame: .zero)
        deliveryLabel.text = "Delivery"
        deliveryLabel.font = .boldSystemFont(ofSize: 12)
        scrollView.addSubview(deliveryLabel)

        lineView = UIView(frame: .zero)
        lineView.backgroundColor = AppColor.grey_eeeeee
        scrollView.addSubview(lineView)

        creditView = CheckoutPaymentCreditView(frame: .zero)
        scrollView.addSubview(creditView)

        billingAddressView = CheckoutPaymentBillingAddressView(frame: .zero)
        scrollView.addSubview(billingAddressView)

        discountView = CheckoutPaymentDiscountView(frame: .zero)
        scrollView.addSubview(discountView)

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
        nextBtn.setTitle("Place Order", for: .normal)
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

        contactLabel.frame = CGRect(x: kPublicMargin, y: kPublicMargin, width: kScreenWidth - kPublicMargin * 2, height: 15)

        addressLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(contactLabel.frame) + 12, width: kScreenWidth - kPublicMargin * 2, height: 15)

        deliveryLabel.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(addressLabel.frame) + 12, width: kScreenWidth - kPublicMargin * 2, height: 15)

        lineView.frame = CGRect(x: kPublicMargin, y: CGRectGetMaxY(deliveryLabel.frame) + kPublicMargin, width: kScreenWidth - kPublicMargin * 2, height: 1)

        creditView.frame = CGRect(x: 0, y: CGRectGetMaxY(lineView.frame) + kPublicMargin, width: kScreenWidth, height: creditView.showFreeView == true ? CGRectGetMaxY(creditView.freeView.frame) : CGRectGetMaxY(creditView.creditView.frame))

        billingAddressView.frame = CGRect(x: 0, y: CGRectGetMaxY(creditView.frame) + 30, width: kScreenWidth, height: 200)

        discountView.frame = CGRect(x: 0, y: CGRectGetMaxY(billingAddressView.frame) + 30, width: kScreenWidth, height: 180)

        scrollView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - UIDevice.navigationFullHeight() - UIDevice.safeDistanceBottom() - CGRectGetHeight(bottomView.frame))

        scrollView.contentSize = CGSizeMake(kScreenWidth, CGRectGetMaxY(discountView.frame) + 50)
    }

    @objc func btnClick() {
        checkoutVC?.checkoutCompleteFree()
    }

    @objc func tapAction(gesture: UIGestureRecognizer) {

    }

    func updateView(checkout: AppSchema.CheckoutCommon?, shippingLine: AppSchema.CheckoutShippingLineUpdateMutation.Data.CheckoutShippingLineUpdate.Checkout.ShippingLine?, shippingRates: [AppSchema.CheckoutShippingLinesQuery.Data.Node.AsCheckout.AvailableShippingRates.ShippingRate], addressVC: CheckoutAddressViewController) {
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

        contactLabel.text = "Contact    \((addressVC.tempAddress["email"] ?? "") as String)"
        addressLabel.text = "Address    \((addressVC.tempAddress["address1"] ?? "") as String) \((addressVC.tempAddress["address2"]  ?? "") as String) \((addressVC.tempAddress["city"] ?? "") as String) \((addressVC.tempAddress["zip"]  ?? "") as String) \((addressVC.tempAddress["country"] ?? "") as String)"
        deliveryLabel.text = "Delivery    \((shippingLine?.title ?? "") as String)"

        if Double(checkout?.totalPriceV2.amount ?? "0") == 0 {
            creditView.updateView(showFreeViews: true)
        } else {
            creditView.updateView(showFreeViews: false)
        }
        viewDidLayoutSubviews()
        
        discountView.updateView(code: checkoutVC?.discountCode ?? "")
    }
}
