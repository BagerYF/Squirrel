//
//  CategoryTableViewController.swift
//  shopifytestios
//
//  Created by Bager on 2023/1/28.
//

import UIKit
import MMKV

class SearchTableViewController: BaseTableViewController {

    var data:[String] = []
    var navigation:UINavigationController!
    var type:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        self.tableView.bounces = false
    }

    func initData() {
        let mmkv = MMKV.default()
        let result = mmkv?.object(of: NSArray.self, forKey: "MMKVSearchHistory")
        if result == nil {
            type = "Suggested"
            data = kSuggestedMaps
        } else {
            type = "Search History"
            data = result as! [String]
        }
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 48
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let viewBg = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 40) )
            viewBg.backgroundColor = .white
            let label:UILabel = UILabel.init(frame: CGRect(x: 16, y: 0, width: 150, height: 40))
            label.text = type
            label.font = UIFont.boldSystemFont(ofSize: 14)
            label.textAlignment = NSTextAlignment.left
            viewBg.addSubview(label)
            return viewBg
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "CELL"
        let cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        if cell.textLabel?.text == "Sale" {
            cell.textLabel?.textColor = .red
        } else {
            cell.textLabel?.textColor = .black
        }
        if type == "Suggested" {
            cell.accessoryView = UIImageView(image: UIImage(named: "arrow"))
        }
        let line = UIView(frame: CGRect(x: 0, y: 47, width: self.view.bounds.width, height: 1))
        line.backgroundColor = .hex(0xeeeeee)
        cell.addSubview(line)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
