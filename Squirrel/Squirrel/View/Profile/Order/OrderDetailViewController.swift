//
//  OrderDetailViewController.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/28.
//

import UIKit

class OrderDetailViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    var data: AppSchema.CustomerQuery.Data.Customer.Orders.Edge?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "#\(data?.node.orderNumber ?? 0)"

        initView()
    }

    func initView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - UIDevice.navigationFullHeight() - UIDevice.safeDistanceBottom()), style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(OrderDetailBasicInfoCell.self, forCellReuseIdentifier: "OrderDetailBasicInfoCell")
        tableView.register(OrderDetailProductCell.self, forCellReuseIdentifier: "OrderDetailProductCell")
        tableView.register(OrderDetailContactCell.self, forCellReuseIdentifier: "OrderDetailContactCell")
        self.view.addSubview(tableView)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (data?.node.lineItems.edges.count ?? 0) + 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = OrderDetailBasicInfoCell(style: .default, reuseIdentifier: "OrderDetailBasicInfoCell")
            cell.setValue(item: data)
            return cell
        } else if indexPath.row == ((data?.node.lineItems.edges.count ?? 0) + 1) {
            let cell = OrderDetailContactCell(style: .default, reuseIdentifier: "OrderDetailContactCell")
            return cell
        } else {
            let item = data?.node.lineItems.edges[indexPath.row - 1]
            let cell = OrderDetailProductCell(style: .default, reuseIdentifier: "OrderDetailProductCell")
            cell.setValue(item: item)
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 355
        } else if indexPath.row == ((data?.node.lineItems.edges.count ?? 0) + 1) {
            return 370
        } else {
            return 200
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
}
