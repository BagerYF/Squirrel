//
//  CountryViewController.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/28.
//

import Foundation
import Kingfisher

class CountryViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate, UISearchResultsUpdating {

    var tableView: UITableView!
    var searchC: UISearchController!
    var searchText = ""

    var allList:[CountryModel] = []
    var showData:[String:[CountryModel]] = [:]
    var group:[String] = [];
    var callBack: CallBack?
    var selectCode = ""

    override func viewDidLoad() {
        navLeftType = .Close
        super.viewDidLoad()
        title = "Select your region"
        initView()
        initData()
    }

    func initData() {
        searchData()
    }

    func searchData() {
        showData = [:];
        for item in allList {
            if showData.keys.contains(item.firstCharacter) {
                var tempList = showData[item.firstCharacter]!
                if searchText.count > 0 {
                    if item.name.lowercased().contains(searchText.lowercased()) {
                        tempList.append(item)
                    }
                } else {
                    tempList.append(item)
                }
                showData.updateValue(tempList, forKey: item.firstCharacter)
            } else {
                if item.isCharacter {
                    var tempList:[CountryModel] = [];
                    if searchText.count > 0 {
                        if item.name.lowercased().contains(searchText.lowercased()) {
                            tempList.append(item)
                            showData[item.firstCharacter] = tempList
                        }
                    } else {
                        tempList.append(item)
                        showData[item.firstCharacter] = tempList
                    }
                } else {
                    if showData.keys.contains("#") {
                        var tempList = showData["#"]!
                        if searchText.count > 0 {
                            if item.name.lowercased().contains(searchText.lowercased()) {
                                tempList.append(item)
                            }
                        } else {
                            tempList.append(item)
                        }
                        showData.updateValue(tempList, forKey: "#")
                    } else {
                        var tempList:[CountryModel] = [];
                        if searchText.count > 0 {
                            if item.name.lowercased().contains(searchText.lowercased()) {
                                tempList.append(item)
                                showData["#"] = tempList
                            }
                        } else {
                            tempList.append(item)
                            showData["#"] = tempList
                        }
                    }
                }
            }
        }

        group = []
        for key in showData.keys {
            group.append(key)
            group = group.sorted()
        }

        tableView.reloadData()
    }

    func initView() {

        searchC = UISearchController.init(searchResultsController: nil)
        searchC.searchResultsUpdater = self
        searchC.searchBar.placeholder = "Search"
        searchC.obscuresBackgroundDuringPresentation = false
        searchC.hidesNavigationBarDuringPresentation = false
        searchC.searchBar.tintColor = .black
        searchC.searchBar.setImage(UIImage(named: "search"), for: .search, state: .normal)
        searchC.searchBar.setSearchFieldBackgroundImage(getImageWithColor(color: .hex(0xEEEEEE)), for: .normal)
//        searchC.searchBar.setPositionAdjustment(UIOffset(horizontal: 0, vertical: 10), for: .search)
        searchC.searchBar.layer.borderColor = UIColor.white.cgColor
        searchC.searchBar.layer.borderWidth = 1
        self.view.addSubview(searchC.searchBar)

        tableView = UITableView(frame: CGRect(x: 0, y: 60, width: self.view.bounds.width, height: self.view.bounds.height - 60 - UIDevice.navigationFullHeight()), style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.sectionIndexColor = .black
        tableView.register(CountryCell.self, forCellReuseIdentifier: "CountryCell")
        self.view.addSubview(tableView)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return group.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let tempGroup = group[section]
        return showData[tempGroup]!.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tempGroup = group[indexPath.section]
        let tempCountry = showData[tempGroup]!
        let cell = CountryCell(style: .default, reuseIdentifier: "CountryCell")
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        if tempCountry[indexPath.row].flagPath != nil {
        cell.textLabel?.text = "      \(tempCountry[indexPath.row].name as String)"
            let imgUrl = "https://d1mp1ehq6zpjr9.cloudfront.net/static/images/flags/\(tempCountry[indexPath.row].code ?? "").png"
            cell.leftImgView?.kf.setImage(with: URL(string: "\(imgUrl)"))
        } else {
            cell.leftImgView?.image = nil
            cell.textLabel?.text = "\(tempCountry[indexPath.row].name as String)"
        }
        if tempCountry[indexPath.row].code == selectCode {
            cell.rightImgView.image = UIImage(named: "selected")
        } else {
            cell.rightImgView.image = nil
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let tempGroup = group[section]
        let viewBg = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 48) )
        let label:UILabel = UILabel.init(frame: CGRect(x: 16, y: 0, width: 150, height: 48))
        label.text = tempGroup
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = NSTextAlignment.left
        viewBg.addSubview(label)
        return viewBg
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let tempGroup = group[indexPath.section]
        let tempCountry = showData[tempGroup]!
        let item = tempCountry[indexPath.row]
        if callBack != nil {
            callBack!(item)
        }
        self.dismiss(animated: true)
    }

    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return group
    }

    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }

    func updateSearchResults(for searchController: UISearchController) {
        if searchText != searchController.searchBar.text {
            searchText = searchController.searchBar.text ?? ""
            searchData()
        }
    }
}
