    //
    //  CheckoutViewController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/3/28.
    //

import UIKit
import JXSegmentedView
import MMKV

class CheckoutViewController: BaseViewController, JXSegmentedViewDelegate {

    var checkout: AppSchema.CheckoutCommon?
    var shippingRates: [AppSchema.CheckoutShippingLinesQuery.Data.Node.AsCheckout.AvailableShippingRates.ShippingRate] = []
    var shippingLine: AppSchema.CheckoutShippingLineUpdateMutation.Data.CheckoutShippingLineUpdate.Checkout.ShippingLine?

    var segmentedDataSource: JXSegmentedTitleDataSource!
    var segmentedView: JXSegmentedView!
    var contentScrollView: UIScrollView!
    var listVCArray = [UIViewController]()
    var addressVC = CheckoutAddressViewController()
    var deliveryVC = CheckoutDeliveryViewController()
    var paymentVC = CheckoutPaymentViewController()
    var discountCode = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addressVC.checkoutVC = self
        deliveryVC.checkoutVC = self
        paymentVC.checkoutVC = self

        initData()
    }

    func initData() {

        var lineItems : [AppSchema.CheckoutLineItemInput] = []
        for item in CartViewController.shareInstance.cart?.lines.edges ?? [] {
            lineItems.append(AppSchema.CheckoutLineItemInput.init(quantity: item.node.quantity, variantId: item.node.merchandise.asProductVariant?.id ?? ""))
        }

        Loading.show()
        Network.shared.apollo.perform(mutation: AppSchema.CheckoutCreateMutation(input: AppSchema.CheckoutCreateInput(lineItems: .some(lineItems)))) { [weak self] result in
            switch result {
            case .success(let response):
                self?.checkout = response.data?.checkoutCreate?.checkout?.fragments.checkoutCommon
                Loading.dismiss()
                self?.initView()
            case .failure(let error):
                print("error===\(error)")
                Loading.dismiss()
            }
        }
    }

    func initView() {
        segmentedView = JXSegmentedView()
        segmentedDataSource = JXSegmentedTitleDataSource()
        segmentedDataSource.isTitleColorGradientEnabled = true
        segmentedDataSource.isItemSpacingAverageEnabled = true
        segmentedDataSource.titleNormalColor = AppColor.grey_9e9e9e
        segmentedDataSource.titleSelectedColor = AppColor.black
        segmentedDataSource.itemWidthIncrement = 0
        segmentedDataSource.itemSpacing = 12
        segmentedDataSource.titleNormalFont = .boldSystemFont(ofSize: 16)
        segmentedDataSource.isItemTransitionEnabled = false

        segmentedView.dataSource = segmentedDataSource
        segmentedView.collectionView.bounces = false

            //        let indicator = JXSegmentedIndicatorLineView()
            //        indicator.indicatorWidth = JXSegmentedViewAutomaticDimension
            //        indicator.lineStyle = .lengthen
            //        segmentedView.indicators = [indicator]

            //        let indicator = JXSegmentedIndicatorBackgroundView()
            //        indicator.indicatorHeight = 32
            //        indicator.indicatorColor = .black
            //
            //        segmentedView.indicators = [indicator]

        segmentedView.delegate = self

        contentScrollView = UIScrollView()
            //        contentScrollView.isPagingEnabled = true
        contentScrollView.isScrollEnabled = false
        contentScrollView.showsVerticalScrollIndicator = false
        contentScrollView.showsHorizontalScrollIndicator = false
        contentScrollView.scrollsToTop = false
        contentScrollView.bounces = false

        contentScrollView.contentInsetAdjustmentBehavior = .never
        view.addSubview(contentScrollView)

        segmentedView.contentScrollView = contentScrollView

        DispatchQueue.main.async {
            self.reloadData()
        }
    }

    @objc func reloadData() {
        let titles:[String] = ["Address", "Delivery", "Payment"]
        let vcs  = [addressVC, deliveryVC, paymentVC]
        for vc in vcs {
            contentScrollView.addSubview(vc.view)
            listVCArray.append(vc)
        }
        segmentedDataSource.titles = titles
        segmentedView.defaultSelectedIndex = 0
        segmentedView.reloadData()
        self.navigationItem.titleView = segmentedView
        view.setNeedsLayout()
        self.updateView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if checkout != nil {
            segmentedView.frame = CGRect(x: 0, y: 0, width: 240, height: 30)
            contentScrollView.frame = CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height - UIDevice.safeDistanceBottom())
            contentScrollView.contentSize = CGSize(width: contentScrollView.bounds.size.width*CGFloat(segmentedDataSource.dataSource.count), height: contentScrollView.bounds.size.height)
            for (index, vc) in listVCArray.enumerated() {
                vc.view.frame = CGRect(x: contentScrollView.bounds.size.width*CGFloat(index), y: 0, width: contentScrollView.bounds.size.width, height: contentScrollView.bounds.size.height)
            }
        }
    }

    func addressNextClick(address: AppSchema.MailingAddressInput) {
        Loading.show()
        Network.shared.apollo.perform(mutation: AppSchema.CheckoutShippingAddressUpdateV2Mutation(checkoutId: checkout?.id ?? "", shippingAddress: address)) { [weak self] result in
            switch result {
            case .success(let response):
                self?.checkout = response.data?.checkoutShippingAddressUpdateV2?.checkout?.fragments.checkoutCommon
                self?.updateShippingRates()
            case .failure(let error):
                print("error===\(error)")
                Loading.dismiss()
            }
        }
    }

    func updateShippingRates() {
        Network.shared.apollo.fetch(query: AppSchema.CheckoutShippingLinesQuery(id: self.checkout?.id ?? ""), cachePolicy: .fetchIgnoringCacheData) { [weak self] result in
            switch result {
            case .success(let response):
                let tempCheckout = response.data?.node?.asCheckout
                if tempCheckout?.availableShippingRates?.ready == true {
                    self?.shippingRates = tempCheckout?.availableShippingRates?.shippingRates ?? []
                    self?.segmentedView.selectItemAt(index: 1)
                    Loading.dismiss()
                    self?.updateView(updateShippingLines: true)
                } else {
                    self?.updateShippingRates()
                }
            case .failure(let error):
                print("error===\(error)")
                Loading.dismiss()
            }
        }
    }

    func updateShippingLine(index: Int) {
        let tempShippingLine = shippingRates[index]
        if tempShippingLine.title == shippingLine?.title {
            return
        }
        Loading.show()
        Network.shared.apollo.perform(mutation: AppSchema.CheckoutShippingLineUpdateMutation(checkoutId: checkout?.id ?? "", shippingRateHandle: tempShippingLine.handle)) { [weak self] result in
            switch result {
            case .success(let response):
                self?.checkout = response.data?.checkoutShippingLineUpdate?.checkout?.fragments.checkoutCommon
                self?.shippingLine = response.data?.checkoutShippingLineUpdate?.checkout?.shippingLine
                self?.updateView()
                Loading.dismiss()
            case .failure(let error):
                print("error===\(error)")
                Loading.dismiss()
            }
        }
    }

    func deliveryNextClick() {
        self.segmentedView.selectItemAt(index: 2)
    }

    func appleyDiscountCode(code: String) {
        Loading.show()
        Network.shared.apollo.perform(mutation: AppSchema.CheckoutDiscountCodeApplyV2Mutation(checkoutId: checkout?.id ?? "", discountCode: code)) { [weak self] result in
            switch result {
            case .success(let response):
                self?.checkout = response.data?.checkoutDiscountCodeApplyV2?.checkout?.fragments.checkoutCommon
                self?.discountCode = code
                self?.updateView()
                Loading.dismiss()
            case .failure(let error):
                print("error===\(error)")
                Loading.dismiss()
            }
        }
    }

    func removeDiscountCode() {
        Loading.show()
        Network.shared.apollo.perform(mutation: AppSchema.CheckoutDiscountCodeRemoveMutation(checkoutId: checkout?.id ?? "")) { [weak self] result in
            switch result {
            case .success(let response):
                self?.checkout = response.data?.checkoutDiscountCodeRemove?.checkout?.fragments.checkoutCommon
                self?.discountCode = ""
                self?.updateView()
                Loading.dismiss()
            case .failure(let error):
                print("error===\(error)")
                Loading.dismiss()
            }
        }
    }

    func checkoutCompleteFree() {
        if Double(checkout?.totalPriceV2.amount ?? "0") == 0 {
            let resutVC = CheckoutResultViewController()
            self.navigationController?.pushViewController(resutVC, animated: false)
            Loading.show()
            Network.shared.apollo.perform(mutation: AppSchema.CheckoutCompleteFreeMutation(checkoutId: checkout?.id ?? "")) { [weak self] result in
                switch result {
                case .success(_):
                    Loading.dismiss()
                    resutVC.updateSuccessView(email: self?.addressVC.emailTextField.textField.text ?? "")
                case .failure(let error):
                    print("error===\(error)")
                    Loading.dismiss()
                }
            }
        }
    }

    func updateView(updateShippingLines: Bool = false) {
        addressVC.updateView(checkout: checkout, shippingLine: shippingLine)
        deliveryVC.updateView(checkout: checkout, shippingLine: shippingLine, shippingRates: shippingRates, addressVC: addressVC, updateShippingLines: updateShippingLines)
        paymentVC.updateView(checkout: checkout, shippingLine: shippingLine, shippingRates: shippingRates, addressVC: addressVC)
    }
}
