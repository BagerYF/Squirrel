//
//  OrderListViewController.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/28.
//

import UIKit
import SnapKit

class OrderListViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    var data: [AppSchema.CustomerQuery.Data.Customer.Orders.Edge] = []

    lazy var empty: UILabel = {
        let empty = UILabel()
        empty.text = "Your order list is currently empty"
        empty.textAlignment = .center
        empty.font = .systemFont(ofSize: 16)
        return empty
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "My Orders"

        initData()
    }

    func initData()  {
        LoginViewController.shareInstance.queryCustomer(showLoading: true) { [weak self] in

            self!.data = []

            self!.data = LoginViewController.shareInstance.customer?.orders.edges ?? []

            if self!.data.count == 0 {
                self!.initEmptyView()
            } else {
                self!.initView()
            }
        }
    }

    func initEmptyView() {
        self.view.addSubview(empty)
        empty.snp.makeConstraints { (make) -> Void in
            make.width.equalTo(260)
            make.height.equalTo(50)
            make.center.equalTo(self.view)
        }
    }

    func initView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - UIDevice.navigationFullHeight() - UIDevice.safeDistanceBottom()), style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(OrderListCell.self, forCellReuseIdentifier: "OrderListCell")
        self.view.addSubview(tableView)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = data[indexPath.row]
        let cell = OrderListCell(style: .default, reuseIdentifier: "OrderListCell")
        cell.setValue(item: item)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136
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

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = data[indexPath.row]
        var detail = OrderDetailViewController()
        detail.data = item
        self.navigationController?.pushViewController(detail, animated: true)
    }
}
