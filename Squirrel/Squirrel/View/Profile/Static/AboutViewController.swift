    //
    //  AboutViewController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/3/23.
    //

import UIKit

class AboutViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "About"

        initView()
    }

    func initView() {
        let scrollView = UIScrollView(frame: self.view.frame)
        scrollView.contentSize = CGSizeMake(kScreenWidth, 1020)
        scrollView.showsVerticalScrollIndicator = false
        self.view.addSubview(scrollView)

        let title = UILabel(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 64))
        title.text = "The Best of Luxury Fashion"
        title.textAlignment = NSTextAlignment.center
        title.font = UIFont.systemFont(ofSize: 20)
        scrollView.addSubview(title)

        let img = UIImageView(frame: CGRect(x: 0, y: CGRectGetMaxY(title.frame), width: kScreenWidth, height: 470))
        img.image = UIImage(named: "about")
//        img.contentMode = .scaleAspectFit
        scrollView.addSubview(img)

        let text = UILabel(frame: CGRect(x: kPublicMargin, y: CGRectGetMaxY(img.frame) + 20, width: kScreenWidth - kPublicMargin * 2, height: 0))
        let str = """
Shopify brings to you the best of luxury fashion. Featuring an extensive range of over 500 brands, including womenswear, menswear and kidswear from iconic fashion houses, such as Prada, Gucci, Saint Laurent, Balenciaga and Valentino.

Every aspect of the user experience is optimized, starting with a curated selection of world-renowned brands delivered with best-in-class technology. Payment is easy and secure, with free express shipping to over X countries and free returns on all orders so you can shop with confidence.
"""
        let attributedString = NSMutableAttributedString(string: str)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 7
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle,value: paragraphStyle,range: NSMakeRange(0,str.count))
        text.attributedText = attributedString
        text.numberOfLines = 0
        text.font = UIFont.systemFont(ofSize: 16)
        text.sizeToFit()
        scrollView.addSubview(text)
    }
}
