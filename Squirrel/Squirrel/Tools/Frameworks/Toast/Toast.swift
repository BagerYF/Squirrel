//
//  Toast.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/31.
//

import Foundation
import SwiftMessages

class Toast {
    class func show(_ msg: String) {
        let titleLabel = UILabel(frame: .zero)
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.text = msg
        titleLabel.textColor = .white
        let messageView = BaseView(frame: .zero)
        messageView.layoutMargins = .zero
        messageView.backgroundHeight = 40
        do {
            let backgroundView = CornerRoundingView()
            backgroundView.cornerRadius = 4
            backgroundView.backgroundColor = .black
            backgroundView.layer.masksToBounds = true
            messageView.installBackgroundView(backgroundView)
            messageView.installContentView(titleLabel, insets: UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10))
            messageView.layoutMarginAdditions = UIEdgeInsets(top: 10, left: 15, bottom: 10, right: 15)
            messageView.tapHandler = { e in
                SwiftMessages.hide()
            }
        }
//        messageView.configureDropShadow()
        var config = SwiftMessages.defaultConfig
        config.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        SwiftMessages.show(config: config, view: messageView)
    }
}
