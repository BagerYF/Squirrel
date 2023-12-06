//
//  CategoryTableViewController.swift
//  shopifytestios
//
//  Created by Bager on 2023/1/28.
//

import UIKit

class CategoryTableViewController: BaseTableViewController {

    var data:[[String:Any]] = []
    var navigation:UINavigationController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        self.tableView.bounces = false
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

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "CELL"
        let cell = UITableViewCell(style: .default, reuseIdentifier: identifier)
        cell.textLabel?.text = data[indexPath.row]["name"] as? String
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        if cell.textLabel?.text == "Sale" {
            cell.textLabel?.textColor = .red
        } else {
            cell.textLabel?.textColor = .black
        }
        cell.accessoryView = UIImageView(image: UIImage(named: "arrow"))
        let line = UIView(frame: CGRect(x: 0, y: 47, width: self.view.bounds.width, height: 1))
        line.backgroundColor = .hex(0xeeeeee)
        cell.addSubview(line)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let subData = data[indexPath.row]
        if (subData["children"] as! [[String:Any]]).count > 0 {
            let categoryList = CategoryTableViewController()
            categoryList.hidesBottomBarWhenPushed = true
            categoryList.data = subData["children"] as! [[String:Any]]
            categoryList.title = subData["name"] as? String
            self.navigation?.pushViewController(categoryList, animated: true)
        }
    }

}
