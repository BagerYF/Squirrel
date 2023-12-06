//
//  Home.swift
//  shopifytestios
//
//  Created by Bager on 2023/1/16.
//

import UIKit

import Kingfisher

class HomeViewController: BaseViewController,UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    var data:[HomeModel] = []

    override func viewDidLoad() {
        navLeftType = .None
        super.viewDidLoad()
        setRightNav()

        for item in kHomeMaps {
            data.append(HomeModel.deserialize(from: item)!)
        }

        initView()

        initAppData()
    }

    func initAppData() {
        CartViewController.shareInstance.initData()
        LoginViewController.shareInstance.initData()
    }

    func initView() {
        tableView = UITableView(frame: self.view.frame, style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(HomePageViewCell.self, forCellReuseIdentifier: "HomePageViewCell")
        tableView.register(HomePageViewWithTitleCell.self, forCellReuseIdentifier: "HomePageViewWithTitleCell")
        tableView.register(HomePageViewWithButtonCell.self, forCellReuseIdentifier: "HomePageViewWithButtonCell")
        tableView.register(HomeBasicCell.self, forCellReuseIdentifier: "HomeBasicCell")
        self.view.addSubview(tableView)

        let value = UIView.AutoresizingMask.flexibleHeight.rawValue | UIView.AutoresizingMask.flexibleWidth.rawValue
        tableView.autoresizingMask = UIView.AutoresizingMask.init(rawValue: value)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let item = data[section]
        if item.name == "FirstSection" || item.name == "NewArrivalSection" || item.name == "NewSeasonSection" || item.name == "ContemporarySection" {
            return 1
        }
        if item.name == "PrimarySection" || item.name == "PopularSection" {
            return item.items.count
        }
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = data[indexPath.section]
        if item.name == "FirstSection" {
            let cell: HomePageViewCell = tableView.dequeueReusableCell(withIdentifier: "HomePageViewCell") as! HomePageViewCell
            cell.setValue(datas: item.items)
            return cell
        }
        if item.name == "NewArrivalSection" {
            let cell: HomePageViewWithTitleCell = tableView.dequeueReusableCell(withIdentifier: "HomePageViewWithTitleCell") as! HomePageViewWithTitleCell
            cell.setValue(datas: item)
            return cell
        }
        if item.name == "NewSeasonSection" || item.name == "ContemporarySection" {
            let cell: HomePageViewWithButtonCell = tableView.dequeueReusableCell(withIdentifier: "HomePageViewWithButtonCell") as! HomePageViewWithButtonCell
            cell.setValue(datas: item)
            return cell
        }
        if item.name == "PrimarySection" || item.name == "PopularSection" {
            let cell: HomeBasicCell = tableView.dequeueReusableCell(withIdentifier: "HomeBasicCell") as! HomeBasicCell
            let subItem = item.items[indexPath.row]
            cell.setValue(item: subItem)
            return cell
        }
        let cell = UITableViewCell(style: .default, reuseIdentifier: "CELL")
        cell.backgroundColor = .cyan
        cell.textLabel?.text = item.name!
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = data[indexPath.section]
        if item.name == "FirstSection" {
            return 565
        }
        if item.name == "NewArrivalSection" {
            return 651
        }
        if item.name == "NewSeasonSection" || item.name == "ContemporarySection" {
            return 731
        }
        if item.name == "PrimarySection" || item.name == "PopularSection" {
            return 434
        }
        return 40
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let item = data[section]
        if item.name == "PrimarySection" || item.name == "PopularSection" {
            return 40
        }
        return 0.01
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = data[indexPath.section]
        if item.name == "PrimarySection" || item.name == "PopularSection" {
            let vc = ProductListViewController()
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
