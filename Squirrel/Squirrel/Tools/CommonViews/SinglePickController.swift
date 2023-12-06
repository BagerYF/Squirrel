    //
    //  SinglePickController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/3/21.
    //

import UIKit
import FittedSheets

class SinglePickController: BaseViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var sheetController: SheetViewController?
    var pickview: UIPickerView!
    var button: UIButton!
    var callBack: CallBack?
    var index: Int = 0
    var data: [String] = []
    var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.initView()
    }

    func initData(titles: String, sheetControllers: SheetViewController, datas: [String]) {
        index = 0
        data = datas
        pickview.reloadAllComponents()
        titleLabel.text = titles
        sheetController = sheetControllers
    }

    func initView() {
        titleLabel = UILabel(frame: CGRect(x: kPublicMargin, y: 0, width: 240, height: 64))
//        titleLabel.text = "Please select your size"
        titleLabel.font = .systemFont(ofSize: 14)
        self.view.addSubview(titleLabel)

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
        button.backgroundColor = .black
        button.setTitle("Select", for: .normal)
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
        index = row
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

        let v = data[row]

        let bgView = UIView.init()
        bgView.frame = CGRect.init(x: kPublicMargin, y: 0, width: kScreenWidth - kPublicMargin * 2, height: 40)

        let titleLable = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth - kPublicMargin * 2, height: 40))
        titleLable.font = .systemFont(ofSize: 14)
        titleLable.text = v
        titleLable.textAlignment = .center
        titleLable.textColor = UIColor.black
        bgView.addSubview(titleLable)
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
        return data.count
    }

    @objc func closeClick() {
        if sheetController != nil {
            sheetController?.attemptDismiss(animated: true)
        }
    }

    @objc func buttonClick() {
        if callBack != nil {
            callBack!(index)
        }
        closeClick()
    }
}
