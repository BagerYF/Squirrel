//
//  Loading.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/9.
//

import Foundation
import ProgressHUD

class Loading {
    static let shareInstance = Loading()

    private init() {
        ProgressHUD.colorHUD = .white
        ProgressHUD.colorBackground = .clear
        ProgressHUD.colorAnimation = .black
        ProgressHUD.animationType = .circleStrokeSpin
    }

    func show() {
        ProgressHUD.animate(nil, interaction: false)
    }

    func dismiss() {
        ProgressHUD.dismiss()
    }

    class func show() {
        Loading.shareInstance.show()
    }

    class func dismiss() {
        Loading.shareInstance.dismiss()
    }
}
