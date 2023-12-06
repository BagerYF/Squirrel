//
//  Color.swift
//  shopifytestios
//
//  Created by Bager on 2023/1/17.
//

import UIKit

class AppColor {
    static var black = UIColor.hex(0x212121)
    static var grey_9e9e9e = UIColor.hex(0x9e9e9e)
    static var grey_bdbdbd = UIColor.hex(0xbdbdbd)
    static var grey_757575 = UIColor.hex(0x757575)
    static var grey_eeeeee = UIColor.hex(0xeeeeee)
    static var grey_e5e5e5 = UIColor.hex(0xe5e5e5)
    static var grey_616161 = UIColor.hex(0x616161)
}

extension UIColor {
    static func hex(_ val: UInt) -> UIColor {
        var r: UInt = 0, g: UInt = 0, b: UInt = 0;
        var a: UInt = 0xFF
        var rgb = val

        if (val & 0xFFFF0000) == 0 {
            a = 0xF

            if val & 0xF000 > 0 {
                a = val & 0xF
                rgb = val >> 4
            }

            r = (rgb & 0xF00) >> 8
            r = (r << 4) | r

            g = (rgb & 0xF0) >> 4
            g = (g << 4) | g

            b = rgb & 0xF
            b = (b << 4) | b

            a = (a << 4) | a

        } else {
            if val & 0xFF000000 > 0 {
                a = val & 0xFF
                rgb = val >> 8
            }

            r = (rgb & 0xFF0000) >> 16
            g = (rgb & 0xFF00) >> 8
            b = rgb & 0xFF
        }

        //NSLog("r:%X g:%X b:%X a:%X", r, g, b, a)

        return UIColor(red: CGFloat(r) / 255.0,
                       green: CGFloat(g) / 255.0,
                       blue: CGFloat(b) / 255.0,
                       alpha: CGFloat(a) / 255.0)
    }
}
