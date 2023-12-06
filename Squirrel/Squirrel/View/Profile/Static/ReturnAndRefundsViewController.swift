    //
    //  ReturnAndRefundsViewController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/3/23.
    //

import UIKit

class ReturnAndRefundsViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Return and Refunds"

        initView()
    }

    func initView() {
        let scrollView = UIScrollView(frame: self.view.frame)
        scrollView.contentSize = CGSizeMake(kScreenWidth, 1020)
        scrollView.showsVerticalScrollIndicator = false
        self.view.addSubview(scrollView)

        let returnTitle = UILabel(frame: CGRect(x: kPublicMargin, y: 0, width: kScreenWidth - kPublicMargin * 2, height: 50))
        returnTitle.text = "Returns"
        returnTitle.font = .boldSystemFont(ofSize: 16)
        scrollView.addSubview(returnTitle)

        let returnText = UILabel(frame: CGRect(x: kPublicMargin, y: CGRectGetMaxY(returnTitle.frame), width: kScreenWidth - kPublicMargin * 2, height: 0))
        returnText.text = """
    You can purchase in confidence and send the items back to us if they are not right for you. If you would like to initiate a return, please go to your account at the top right corner where it says your name. Click "Create Return" next to the order you would like to return and follow the prompts. If you checked out as a guest, please contact customer service at customerservice@Shopify.com. In the event you need change the pickup time you will need to liaise directly with Shopify's preferred courier.

    For orders placed after 23 February 2021, returns are free. Should you wish to return your product, all taxes and duties will be refunded and no return fee will be incurred. However, any original shipping charges (if applicable) will not be refunded.

    For orders placed before 23 February 2021, taxes and duties will not be refunded and these orders will be subject to a return fee of $currency 25.

    Returns must arrive at our location within 14 days from the date the parcel is received using the label provided by us. Items received after this period are accepted only at the discretion of Shopify. Please note that orders can only be cancelled within the first 24 hours of making a purchase provided that the item/s have not shipped. Any cancellations initiated after the 24 hour period has expired will incur a $currency 25 cancellation fee and any order which contains items that have been shipped may not be cancelled.
    """
        returnText.numberOfLines = 0
        returnText.font = .systemFont(ofSize: 16)
        returnText.sizeToFit()
        scrollView.addSubview(returnText)

        let refundsTitle = UILabel(frame: CGRect(x: kPublicMargin, y: CGRectGetMaxY(returnText.frame) + 30, width: kScreenWidth - kPublicMargin * 2, height: 50))
        refundsTitle.text = "Refunds"
        refundsTitle.font = .boldSystemFont(ofSize: 16)
        scrollView.addSubview(refundsTitle)

        let refundsText = UILabel(frame: CGRect(x: kPublicMargin, y: CGRectGetMaxY(refundsTitle.frame), width: kScreenWidth - kPublicMargin * 2, height: 0))
        refundsText.text = """
    Once we receive the item, we will refund you to your original payment method. Please note that refunds may take up to 10 working days to process due to varying processing times between payment providers.
    """
        refundsText.numberOfLines = 0
        refundsText.font = .systemFont(ofSize: 16)
        refundsText.sizeToFit()
        scrollView.addSubview(refundsText)

    }
}
