    //
    //  ProductFilterViewController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/2/24.
    //

import UIKit
import SwiftyJSON
import FittedSheets

class ProductFilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var allFilters: [AppSchema.CollectionQuery.Data.Collection.Products.Filter] = []
    var subFiltersName = ""
    var subFiltersIndex = 0
    var subFilters: [AppSchema.CollectionQuery.Data.Collection.Products.Filter.Value] = []
    var currentFilters:[AppSchema.JSON] = [];

    var filterCallBack: CallBacks?
    var sheetController: SheetViewController?

    lazy var headerView = {
        let headerView = UIView(frame: CGRectMake(0, 0, kScreenWidth, 64))
        headerView.backgroundColor = .white

        var title = UILabel(frame: CGRectMake(16, 0, 50, 64))
        title.text = "Filter"
        title.font = .systemFont(ofSize: 14)
        headerView.addSubview(title)

        var clearBtn = UIButton(frame: CGRectMake(kScreenWidth - 16 - 14 - 60, 0, 50, 64))
        clearBtn.titleLabel?.font = .systemFont(ofSize: 14)
        clearBtn.setTitleColor(UIColor.black, for: .normal)
        clearBtn.setTitle("Clear", for: .normal)
        clearBtn.addTarget(self, action: #selector(clearFilter), for: .touchUpInside)
        headerView.addSubview(clearBtn)

        let img = UIImageView(frame: CGRectMake(kScreenWidth - 16 - 14, 0, 14, 64))
        img.image = UIImage(named: "filter_del")
        img.contentMode = .scaleAspectFit
        headerView.addSubview(img)

        var tap = UITapGestureRecognizer(target: self, action: #selector(closeClick))
        img.isUserInteractionEnabled = true
        img.addGestureRecognizer(tap)

        return headerView
    }()

    lazy var leftTableView = {
        var tableView = UITableView(frame: CGRectMake(0, 64, kScreenWidth * 0.36, kScreenHeight - 64 - 50 - UIDevice.navigationFullHeight() - UIDevice.safeDistanceBottom()), style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.bounces = false
            //        tableView.separatorStyle = .none
            //        tableView.isScrollEnabled = false
        tableView.showsVerticalScrollIndicator = false
        self.view.addSubview(tableView)
        return tableView
    }()

    lazy var rightTableView = {
        var tableView = UITableView(frame: CGRectMake(kScreenWidth * 0.36, 64, kScreenWidth * 0.64, kScreenHeight - 64 - 50 - UIDevice.navigationFullHeight() - UIDevice.safeDistanceBottom()), style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.bounces = false
            //        tableView.separatorStyle = .none
            //        tableView.isScrollEnabled = false
        tableView.showsVerticalScrollIndicator = false
        self.view.addSubview(tableView)
        return tableView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        initView()
    }

    func initView() {
        self.view.addSubview(leftTableView)
        self.view.addSubview(rightTableView)
        self.view.addSubview(headerView)

        let line = UIView(frame: CGRectMake(kScreenWidth * 0.36, 64, 1, kScreenHeight - 64 - 50 - UIDevice.navigationFullHeight() - UIDevice.safeDistanceBottom()))
        line.backgroundColor = AppColor.grey_bdbdbd
        self.view.addSubview(line)
    }

    func initFilters(tempFilters: [AppSchema.CollectionQuery.Data.Collection.Products.Filter]) {
        if (allFilters.count == 0) {
            allFilters = tempFilters
            if (allFilters.count > 0) {
                var tempSubFilters = allFilters.first
                subFiltersName = tempSubFilters?.label ?? ""
                tempSubFilters?.selected = true
                subFilters = tempSubFilters?.values ?? [];
                allFilters[0] = tempSubFilters!
            }
        }
        else {
            allFilters = []
            allFilters = tempFilters;
            if (allFilters.count > subFiltersIndex) {
                allFilters[subFiltersIndex].selected = true
                subFilters = []
                subFilters = allFilters[subFiltersIndex].values
                for var (i,s) in subFilters.enumerated() {
                    for c in currentFilters {
                        if s.input == c {
                            subFilters[i].selected = true
                        }
                    }
                }
            }
        }
        leftTableView.reloadData()
        rightTableView.reloadData()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableView == leftTableView ? allFilters.count : subFilters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == leftTableView {
            let item = allFilters[indexPath.row]
            let identifier = "CELLLEFT"
            let cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
            cell.textLabel?.text = item.label
            cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
            cell.selectionStyle = .none
            if item.selected {
                cell.textLabel?.textColor = AppColor.black
            } else {
                cell.textLabel?.textColor = .lightGray
            }
            return cell
        }
        let item = subFilters[indexPath.row]
        let identifier = "CELLRIGHT"
        let cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        cell.textLabel?.text = "\(item.label)(\(item.count))"
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell.selectionStyle = .none
        if item.selected {
            cell.textLabel?.textColor = AppColor.black
            cell.accessoryView = UIImageView(image: UIImage(named: "selected"))
        } else {
            cell.textLabel?.textColor = .lightGray
            cell.accessoryView = nil

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
        if tableView == leftTableView {
            for  (i,_) in allFilters.enumerated() {
                allFilters[i].selected = false
            }
            let e = allFilters[indexPath.row]
            subFiltersName = e.label
            subFilters = e.values
            for  (i,s) in subFilters.enumerated() {
                for c in currentFilters {
                    if s.input == c {
                        subFilters[i].selected = true
                    }
                }
            }
            subFiltersIndex = indexPath.row
            allFilters[indexPath.row].selected = true
            leftTableView.reloadData()
            rightTableView.reloadData()
        } else {
            subFilters[indexPath.row].selected = !subFilters[indexPath.row].selected
            let tempSubFilters = subFilters[indexPath.row]
            if (tempSubFilters.selected) {
                    //            let data = tempSubFilters.input.data(using: String.Encoding.utf8, allowLossyConversion: false) ?? Data()
                    //            guard let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) else {
                    //                 return
                    //            }
                currentFilters.append(tempSubFilters.input)
            } else {
                for element in currentFilters {
                    if (element == tempSubFilters.input) {
                        if let index = currentFilters.firstIndex(of: element) {
                            currentFilters.remove(at: index)
                        }
                        break;
                    }
                }
            }
            rightTableView.reloadData()
            if (filterCallBack != nil) {
                filterCallBack!()
            }
        }
    }

    @objc func clearFilter() {
        if (currentFilters.count > 0) {
            for element in allFilters {
                for var e in element.values {
                    e.selected = false;
                }
            }
            currentFilters = [];
            if (filterCallBack != nil) {
                filterCallBack!()
            }
        }
    }

    @objc func closeClick() {
        if sheetController != nil {
            sheetController?.attemptDismiss(animated: true)
        }
    }
}

