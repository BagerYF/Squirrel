    //
    //  AddressListViewController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/3/27.
    //


import UIKit
import SnapKit
import MMKV

class AddressListViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView!
    var addBtn: UIButton!
    var data: [AppSchema.CustomerQuery.Data.Customer.Addresses.Edge] = []
    var countryList: [CountryModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Address"

        initData()
    }

    func initData()  {
        LoginViewController.shareInstance.queryCustomer(showLoading: true) { [weak self] in

            self!.data = []

            self!.data = LoginViewController.shareInstance.customer?.addresses.edges ?? []

            if self!.tableView != nil {
                self!.tableView.reloadData()
            } else {
                self!.initView()
            }
        }

        if countryList.count == 0 {
            do {
                if let path = Bundle.main.path(forResource: "CountryData", ofType: "json") {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                    if let jsonResult = jsonResult as? [Dictionary<String, AnyObject>] {
                        for item in jsonResult {
                            countryList.append(CountryModel.init(fromDictionary: item))
                        }
                    }
                }
            } catch {
                print("error")
            }
        }
    }

    func initView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - UIDevice.navigationFullHeight() - UIDevice.safeDistanceBottom() - 60), style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
            //        tableView.separatorStyle = .none
        tableView.register(AddressListCell.self, forCellReuseIdentifier: "AddressListCell")
        self.view.addSubview(tableView)

        addBtn = UIButton(frame: CGRect(x: kPublicMargin, y: CGRectGetMaxY(tableView.frame) + 10, width: kScreenWidth - kPublicMargin * 2, height: 40))
        addBtn.setTitle("Add address", for: .normal)
        addBtn.setTitleColor(.white, for: .normal)
        addBtn.backgroundColor = .black
        addBtn.layer.cornerRadius = 2
        addBtn.titleLabel?.font = .systemFont(ofSize: 16)
        addBtn.addTarget(self, action: #selector(addClick), for: .touchUpInside)
        self.view.addSubview(addBtn)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = data[indexPath.row]
        let cell = AddressListCell(style: .default, reuseIdentifier: "AddressListCell")
        cell.setValue(item: item)
        cell.editCallBack = {
            self.editAddress(index: indexPath.row)
        }
        cell.deleteCallBack = {
            self.deleteAddress(index: indexPath.row)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
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

    @objc func addClick() {
        let detail = AddressDetailViewController()
        detail.countryList = countryList
        detail.callBack = {
            self.initData()
        }
        self.navigationController?.pushViewController(detail, animated: true)
    }

    func editAddress(index: Int) {
        let item = data[index]
        let detail = AddressDetailViewController()
        detail.countryList = countryList
        detail.data = item
        detail.callBack = {
            self.initData()
        }
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
    func deleteAddress(index: Int) {
        let item = data[index]
        Loading.show()
        Network.shared.apollo.perform(mutation: AppSchema.CustomerAddressDeleteMutation(customerAccessToken: LoginViewController.shareInstance.token!, id: item.node.id)) { [weak self] result in
            switch result {
            case .success(_):
                self?.data.remove(at: index)
                self?.tableView.reloadData()
                LoginViewController.shareInstance.queryCustomer()
                Loading.dismiss()
            case .failure(let error):
                print("error===\(error)")
                Loading.dismiss()
            }
        }
    }
}

