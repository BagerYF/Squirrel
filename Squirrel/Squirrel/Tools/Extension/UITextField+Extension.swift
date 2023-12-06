//
//  UITextField+Extension.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/29.
//

import Foundation

extension UITextField {
    func addBottomBorder(){
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: self.frame.size.height - 1, width: self.frame.size.width, height: 1)
        bottomLine.backgroundColor = AppColor.grey_eeeeee.cgColor
        borderStyle = .none
        layer.addSublayer(bottomLine)
    }
}
