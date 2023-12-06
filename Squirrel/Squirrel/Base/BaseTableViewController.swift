//
//  BaseTableViewController.swift
//  shopifytestios
//
//  Created by Bager on 2023/1/28.
//

import UIKit

class BaseTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
//        self.navigationController?.navigationBar.topItem?.title = ""
//        self.navigationController?.navigationBar.backItem?.title = ""
        let backButton = UIButton(type: .custom)

        backButton.setImage(UIImage(named: "backarrow"), for: .normal)

        backButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -12, bottom: 0, right: 0)

        backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)

//        backButton.backgroundColor = .cyan

        backButton.addTarget(self, action: #selector(back), for: .touchUpInside)

        let backView = UIBarButtonItem(customView: backButton)

        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)

        barButtonItem.width = -10

        navigationItem.leftBarButtonItems = [barButtonItem, backView]
    }

    @objc func back() {
        self.navigationController?.popViewController(animated: true)
    }


}
