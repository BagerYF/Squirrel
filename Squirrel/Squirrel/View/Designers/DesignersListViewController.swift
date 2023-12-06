    //
    //  DesignersListViewController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/1/17.
    //

import UIKit

class DesignersListViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource, UISearchControllerDelegate, UISearchResultsUpdating {

    var tableView: UITableView!
    var searchC: UISearchController!
    var searchText = ""

    var allList:[DesignersModel] = []
    var showData:[String:[DesignersModel]] = [:]
    var group:[String] = [];

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Designers A to Z"
        initView()
        initData()
    }

    func initData() {
        for k in kDesignersAllMaps.keys.sorted() {
            let m = DesignersModel(names: k)
            allList.append(m)
        }

        searchData()
    }

    func searchData() {
        showData = [:];
        for designer in allList {
            if showData.keys.contains(designer.firstCharacter) {
                var tempList = showData[designer.firstCharacter]!
                if searchText.count > 0 {
                    if designer.name.lowercased().contains(searchText.lowercased()) {
                        tempList.append(designer)
                    }
                } else {
                    tempList.append(designer)
                }
                showData.updateValue(tempList, forKey: designer.firstCharacter)
            } else {
                if designer.isCharacter {
                    var tempList:[DesignersModel] = [];
                    if searchText.count > 0 {
                        if designer.name.lowercased().contains(searchText.lowercased()) {
                            tempList.append(designer)
                            showData[designer.firstCharacter] = tempList
                        }
                    } else {
                        tempList.append(designer)
                        showData[designer.firstCharacter] = tempList
                    }
                } else {
                    if showData.keys.contains("#") {
                        var tempList = showData["#"]!
                        if searchText.count > 0 {
                            if designer.name.lowercased().contains(searchText.lowercased()) {
                                tempList.append(designer)
                            }
                        } else {
                            tempList.append(designer)
                        }
                        showData.updateValue(tempList, forKey: "#")
                    } else {
                        var tempList:[DesignersModel] = [];
                        if searchText.count > 0 {
                            if designer.name.lowercased().contains(searchText.lowercased()) {
                                tempList.append(designer)
                                showData["#"] = tempList
                            }
                        } else {
                            tempList.append(designer)
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
        let tempDesigners = showData[tempGroup]!
        let identifier = "CELL"
        let cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        cell.textLabel?.text = tempDesigners[indexPath.row].name
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell.accessoryView = UIImageView(image: UIImage(named: "arrow"))
        let line = UIView(frame: CGRect(x: 0, y: 47, width: self.view.bounds.width - 16, height: 1))
        line.backgroundColor = .hex(0xeeeeee)
        cell.addSubview(line)
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
