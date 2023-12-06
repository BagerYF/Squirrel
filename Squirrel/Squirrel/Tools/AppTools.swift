    //
    //  Tools.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/1/18.
    //

import Foundation
import UIKit

func containsOnlyLetters(input: String) -> Bool {
    for chr in input {
        if (!(chr >= "a" && chr <= "z") && !(chr >= "A" && chr <= "Z") ) {
            return false
        }
    }
    return true
}

func getImageWithColor(color: UIColor) -> UIImage {
    let rect = CGRect(x: 0, y: 0, width: 1, height: 40)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    context!.setFillColor(color.cgColor)
    context!.fill(rect)
        //    context!.addPath(UIBezierPath(roundedRect: rect,
        //                                 byRoundingCorners: UIRectCorner.allCorners,
        //                                 cornerRadii: CGSize(width: 4, height: 4)).cgPath)
        //    context!.clip()
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
}

func getLableHeight(labelStr: String, font: UIFont, width: CGFloat) -> CGFloat {
    let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.byWordWrapping
    label.font = font
    label.text = labelStr
    label.sizeToFit()
    return label.frame.height
}

func versionCheck(){
//    let infoDictionary = Bundle.main.infoDictionary
//    let appDisplayName = infoDictionary!["CFBundleDisplayName"]
//    let majorVersion = infoDictionary!["CFBundleShortVersionString"]
//    let minorVersion = infoDictionary!["CFBundleVersion"]
//
//    let iosVersion = UIDevice.current.systemVersion
//    let identifierNumber = UIDevice.current.identifierForVendor
//    let systemName = UIDevice.current.systemName
//    let model = UIDevice.current.model
//    let localizedModel = UIDevice.current.localizedModel
}

func isValidEmail(emailStr:String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: emailStr)
}
