    //
    //  DesignersViewController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/1/17.
    //

import UIKit
import SwiftMessages

class DesignersViewController: BaseViewController,UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!

    override func viewDidLoad() {
        navLeftType = .None
        super.viewDidLoad()
        setRightNav()
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - UIDevice.navigationFullHeight() - UIDevice.tabBarFullHeight()), style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1: kDesigersMaps.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "CELL"
        let cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        cell.textLabel?.text = indexPath.section == 0 ? "Designers A–Z" : kDesigersMaps[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell.accessoryView = UIImageView(image: UIImage(named: "arrow"))
        let line = UIView(frame: CGRect(x: 0, y: 47, width: self.view.bounds.width, height: 1))
        line.backgroundColor = .hex(0xeeeeee)
        cell.addSubview(line)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 10 : 48
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let viewBg = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 50) )
            let label:UILabel = UILabel.init(frame: CGRect(x: 16, y: 20, width: 150, height: 30))
            label.text = "Feature Designers"
            label.font = UIFont.boldSystemFont(ofSize: 14)
            label.textAlignment = NSTextAlignment.left
            viewBg.addSubview(label)
            return viewBg
        } else {
            return nil
        }
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            goToDesignersList()
        }
    }

    func goToDesignersList() {
        let designersList = DesignersListViewController()
        designersList.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(designersList, animated: true)
    }
}
