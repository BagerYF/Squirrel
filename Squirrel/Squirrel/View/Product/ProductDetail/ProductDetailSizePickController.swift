    //
    //  ProductDetailSizePickController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/3/17.
    //

import UIKit
import FittedSheets

class ProductDetailSizePickController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var sheetController: SheetViewController?
    var pickview: UIPickerView!
    var button: UIButton!
    var callBack: CallBack?
    var variant: AppSchema.GetProductByIdQuery.Data.Product.Variants.Edge?
    var product: AppSchema.GetProductByIdQuery.Data.Product?

    override func viewDidLoad() {
        super.viewDidLoad()

        if product?.variants.edges.count ?? 0 > 0 {
            variant = product?.variants.edges.first
        }

        self.initView()
    }

    func initView() {
        let title = UILabel(frame: CGRect(x: kPublicMargin, y: 0, width: 150, height: 64))
        title.text = "Please select your size"
        title.font = .systemFont(ofSize: 14)
        self.view.addSubview(title)

        let closeBtn = UIButton(frame: CGRect(x: kScreenWidth - 24 - 14, y: 0, width: 14, height: 64))
        closeBtn.setImage(UIImage(named: "filter_del"), for: .normal)
        closeBtn.addTarget(self, action: #selector(closeClick), for: .touchUpInside)
        self.view.addSubview(closeBtn)

        pickview = UIPickerView(frame: CGRect(x: 0, y: 64, width: kScreenWidth, height: 240))
        pickview.delegate = self
        pickview.dataSource = self
        self.view.addSubview(pickview)

        button = UIButton(frame: CGRect(x: kPublicMargin, y: CGRectGetMaxY(pickview.frame) + 10, width: kScreenWidth - kPublicMargin * 2, height: 40))
        button.setTitleColor(.white, for: .normal)
        if variant?.node.quantityAvailable == 0 {
            button.backgroundColor = AppColor.grey_bdbdbd
            button.setTitle("Out of stock", for: .normal)

        } else {
            button.backgroundColor = .black
            button.setTitle("Select", for: .normal)

        }
        button.layer.cornerRadius = 2
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        self.view.addSubview(button)
    }


    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return kScreenWidth
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 40.0
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        variant = product?.variants.edges[row]
        if variant?.node.quantityAvailable == 0 {
            button.backgroundColor = AppColor.grey_bdbdbd
            button.setTitle("Out of stock", for: .normal)

        } else {
            button.backgroundColor = .black
            button.setTitle("Select", for: .normal)

        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ""
    }

    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {

        if pickview.subviews.count > 1 {
            pickview.subviews[1].backgroundColor = .clear
            pickview.subviews[1].layer.borderWidth = 1
            pickview.subviews[1].layer.borderColor = AppColor.grey_bdbdbd.cgColor
            pickview.subviews[1].layer.cornerRadius = 0
            pickview.subviews[1].frame = CGRect(x: -1, y: CGRectGetMinY(pickview.subviews[1].frame), width: kScreenWidth + 2, height: CGRectGetHeight(pickview.subviews[1].frame))
        }

        let v = product?.variants.edges[row]

        let bgView = UIView.init()
        bgView.frame = CGRect.init(x: kPublicMargin, y: 0, width: kScreenWidth - kPublicMargin * 2, height: 40)

        let titleLable = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth - kPublicMargin * 2 - 100.0, height: 40))
        titleLable.font = .systemFont(ofSize: 14)
        titleLable.text = v?.node.title
        titleLable.textColor = UIColor.black
        bgView.addSubview(titleLable)

        let subTitleLable = UILabel.init(frame: CGRect.init(x: CGRectGetWidth(bgView.frame) - 100, y: 0, width: 100, height: 40))
        subTitleLable.textAlignment = .right
        subTitleLable.font = .systemFont(ofSize: 14)
        if v!.node.quantityAvailable == 0 {
            subTitleLable.text = "Out of stock"
        } else if v!.node.quantityAvailable! < 5 {
            subTitleLable.text = "Low stock"
        }
        subTitleLable.textColor = AppColor.grey_bdbdbd
        bgView.addSubview(subTitleLable)
        return bgView
    }

        //    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        //        let attributedString = NSAttributedString.init(string:(sourceData[row]), attributes: [NSAttributedString.Key.font:UIFont.boldSystemFont(ofSize: 18),NSAttributedString.Key.foregroundColor:UIColor.red])
        //        return  attributedString
        //    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return product?.variants.edges.count ?? 0
    }

    @objc func closeClick() {
        if sheetController != nil {
            sheetController?.attemptDismiss(animated: true)
        }
    }

    @objc func buttonClick() {
        if variant?.node.quantityAvailable ?? 0 > 0 {
            if callBack != nil {
                callBack!(variant!)
            }
            closeClick()
        }
    }
}
