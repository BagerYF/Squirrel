    //
    //  ProfileViewController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/3/22.
    //

import UIKit
import MMKV

class ProfileViewController: BaseViewController,UITableViewDelegate, UITableViewDataSource {

    static let shareInstance = ProfileViewController()

    var tableView: UITableView!

    var isLogin = false

    override func viewDidLoad() {
        navLeftType = .None
        super.viewDidLoad()
        setRightNav()
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - UIDevice.navigationFullHeight() - UIDevice.tabBarFullHeight()), style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.register(ProfileLoginCell.self, forCellReuseIdentifier: "ProfileLoginCell")
        tableView.register(ProfileInfoCell.self, forCellReuseIdentifier: "ProfileInfoCell")
        tableView.register(ProfileLogoutCell.self, forCellReuseIdentifier: "ProfileLogoutCell")
        tableView.separatorStyle = .none
        self.view.addSubview(tableView)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 7
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return isLogin ? 0 : 1
        } else if section == 1 {
            return isLogin ? 1 : 0
        } else if section == 2 {
            return isLogin ? 2 : 0
        } else if section == 3 {
            return 2
        } else if section == 4 {
            return 4
        } else if section == 5 {
            return isLogin ? 1 : 0
        } else if section == 6 {
            return 3
        }
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = ProfileLoginCell(style: .default, reuseIdentifier: "ProfileLoginCell")
            cell.loginCallBack = { [weak self] in
                self?.loginClick()
            }
            cell.registerCallBack = { [weak self] in
                self?.registerClick()
            }
            return cell
        } else if indexPath.section == 1 {
            let cell = ProfileInfoCell(style: .default, reuseIdentifier: "ProfileInfoCell")
            cell.logoutCallBack = { [weak self] in
                self?.logoutClick()
            }
            cell.setValue(item: LoginViewController.shareInstance.customer)
            return cell
        } else if indexPath.section == 5 {
            let cell = ProfileLogoutCell(style: .default, reuseIdentifier: "ProfileLogoutCell")
            cell.logoutCallBack = { [weak self] in
                self?.logoutClick()
            }

            return cell
        }

        let cell = UITableViewCell(style: .default, reuseIdentifier:  indexPath.section == 6 ? "identifiers" : "identifier")
        cell.textLabel?.textColor = AppColor.black
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16)
        cell.selectionStyle = .default
        if indexPath.section == 2 {
            let titles = ["My Orders", "Address"]
            cell.textLabel?.text = titles[indexPath.row]
        } else if indexPath.section == 3 {
            let titles = ["Region", "Notifications"]
            cell.textLabel?.text = titles[indexPath.row]
        } else if indexPath.section == 4 {
            let titles = ["About", "Help and Contact", "FAQ", "Returns and Refunds"]
            cell.textLabel?.text = titles[indexPath.row]
        } else if indexPath.section == 6 {
            cell.textLabel?.font = UIFont.systemFont(ofSize: 14)
            cell.selectionStyle = .none
            if indexPath.row == 2 {
                let infoDictionary = Bundle.main.infoDictionary
                let majorVersion = infoDictionary!["CFBundleShortVersionString"] as! String
                let minorVersion = infoDictionary!["CFBundleVersion"] as! String
                cell.textLabel?.text = "App Version \(String(describing: majorVersion)) (\(String(describing: minorVersion)))"
                cell.textLabel?.textColor = AppColor.grey_9e9e9e
            } else {
                let titles = ["Terms and Conditions", "Privacy Policy"]
                cell.textLabel?.text = titles[indexPath.row]
            }
        } else {
            cell.textLabel?.text = "Title"
        }
        if indexPath.section != 6 {
            cell.accessoryView = UIImageView(image: UIImage(named: "arrow"))
            let line = UIView(frame: CGRect(x: 0, y: 47, width: self.view.bounds.width, height: 1))
            line.backgroundColor = .hex(0xeeeeee)
            cell.addSubview(line)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 170
        } else if indexPath.section == 1 {
            return 74
        } else if indexPath.section == 5 {
            return 104
        }else if indexPath.section == 6 {
            return 28
        }
        return 48
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 3 || section == 4 {
            return 28
        } else if section == 6 {
            return 20
        }
        return 0.01
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 2 {
            return 40
        } else if section == 3 {
            return 20
        } else if section == 6 {
            return 48
        }
        return 0.01
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 3 || section == 4 {
            let viewBg = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 28) )
            let label:UILabel = UILabel.init(frame: CGRect(x: 16, y: 0, width: 200, height: 20))
            label.text = section == 3 ? "Settings" : "Support"
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
        if indexPath.section == 2 {
            if indexPath.row == 0 {
                let order = OrderListViewController()
                order.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(order, animated: true)
            } else if indexPath.row == 1 {
                let address = AddressListViewController()
                address.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(address, animated: true)
            }
        } else if indexPath.section == 3 {
            if indexPath.row == 0 {
                let region = RegionViewController()
                region.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(region, animated: true)
            } else if indexPath.row == 1 {
                let notifications = NotificationsViewController()
                notifications.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(notifications, animated: true)
            }
        } else if indexPath.section == 4 {
            if indexPath.row == 0 {
                let about = AboutViewController()
                about.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(about, animated: true)
            } else if indexPath.row == 1 {
                let hac = HelpAndContactViewController()
                hac.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(hac, animated: true)
            } else if indexPath.row == 2 {
                let faq = FAQViewController()
                faq.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(faq, animated: true)
            } else if indexPath.row == 3 {
                let returnAndRefunds = ReturnAndRefundsViewController()
                returnAndRefunds.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(returnAndRefunds, animated: true)
            }
        } else if indexPath.section == 6 {
            if indexPath.row == 0 {
                let termsAndConditions = TermsAndConditionsViewController()
                termsAndConditions.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(termsAndConditions, animated: true)
            } else if indexPath.row == 1 {
                let privacyPolicy = PrivacyPolicyViewController()
                privacyPolicy.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(privacyPolicy, animated: true)
            }
        }
    }

    func loginClick() {
        let nav = BaseNavigationController(rootViewController: LoginViewController.shareInstance)
        nav.navigationBar.backgroundColor = .white
        nav.modalPresentationStyle = .custom
        self.present(nav, animated: true)
    }

    func registerClick() {
        let nav = BaseNavigationController(rootViewController: LoginViewController.shareInstance)
        nav.modalPresentationStyle = .custom
        nav.navigationBar.backgroundColor = .white
        self.present(nav, animated: true)
    }

    func logoutClick() {
        isLogin = false
        tableView.reloadData()
        guard let mmkv = MMKV.default() else {
            return
        }
        mmkv.removeValue(forKey: "MMKVToken")
    }
}
