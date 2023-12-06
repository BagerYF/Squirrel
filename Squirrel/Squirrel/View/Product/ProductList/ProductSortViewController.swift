//
//  ProductFilterViewController.swift
//  shopifytestios
//
//  Created by Bager on 2023/2/8.
//

import UIKit
import FittedSheets

class ProductSortViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var data:[ProductSortModel] = []

    var sortCallBack: CallBack?

    var sheetController: SheetViewController?

    lazy var headerView = {
        let headerView = UIView(frame: CGRectMake(0, 0, kScreenWidth, 64))
        headerView.backgroundColor = .white

        var title = UILabel(frame: CGRectMake(16, 0, 50, 64))
        title.text = "Sort by"
        title.font = .systemFont(ofSize: 14)
        headerView.addSubview(title)

        let img = UIImageView(frame: CGRectMake(kScreenWidth - 16 - 14, 0, 14, 64))
        img.image = UIImage(named: "filter_del")
        img.contentMode = .scaleAspectFit
        headerView.addSubview(img)

        var tap = UITapGestureRecognizer(target: self, action: #selector(closeClick))
        img.isUserInteractionEnabled = true
        img.addGestureRecognizer(tap)

        return headerView
    }()

    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        initData()
        initView()
    }

    func initData() {
        for item in kProductSortMap {
            let m = ProductSortModel.init(fromDictionary: item)
            if m.sortKey == .relevance {
                m.selected = true
            }
            data.append(m)
        }
    }

    func initView() {
        self.view.addSubview(headerView)

        tableView = UITableView(frame: CGRectMake(0, 64, kScreenWidth, 240), style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.showsVerticalScrollIndicator = false
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
        let identifier = "CELL"
        let cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        cell.textLabel?.text = item.name
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell.selectionStyle = .none
        if item.selected {
            cell.imageView?.image = UIImage(named: "check_y")
        } else {
            cell.imageView?.image = UIImage(named: "check_n_")
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
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
        for item in data {
            item.selected = false
        }
        let item = data[indexPath.row]
        item.selected = true
        tableView.reloadData()

        if (sortCallBack != nil) {
            sortCallBack!(item)
            closeClick()
        }
    }

    @objc func closeClick() {
        if sheetController != nil {
            sheetController?.attemptDismiss(animated: true)
        }
    }
}
