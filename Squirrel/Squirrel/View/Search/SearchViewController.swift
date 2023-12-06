    //
    //  SearchViewController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/1/20.
    //

import UIKit
import JXSegmentedView
import MMKV

class SearchViewController: BaseViewController,UISearchControllerDelegate, UISearchBarDelegate, JXSegmentedViewDelegate, UITextFieldDelegate {

    var searchC: UISearchController!
    var searchText = ""
    var segmentedDataSource: JXSegmentedTitleDataSource!
    var segmentedView: JXSegmentedView!
    var contentScrollView: UIScrollView!
    var listVCArray = [UIViewController]()
    var searchHeight = 100.0

    lazy var searchTable = SearchTableViewController()

    override func viewDidLoad() {
        navLeftType = .None
        super.viewDidLoad()
        setRightNav()

        initView()
    }

    func initView() {
        self.navigationController?.extendedLayoutIncludesOpaqueBars = true
        searchC = UISearchController.init(searchResultsController: nil)
        searchC.searchBar.placeholder = "Search"
        searchC.obscuresBackgroundDuringPresentation = false
        searchC.hidesNavigationBarDuringPresentation = true
        searchC.searchBar.tintColor = .black
        searchC.searchBar.setImage(UIImage(named: "search"), for: .search, state: .normal)
        searchC.searchBar.setSearchFieldBackgroundImage(getImageWithColor(color: .hex(0xEEEEEE)), for: .normal)
        searchC.searchBar.layer.borderColor = UIColor.white.cgColor
        searchC.searchBar.layer.borderWidth = 1
        searchC.searchBar.delegate = self
        view.addSubview(searchC.searchBar)

        let textLabel = UILabel(frame: CGRect(x: 16, y: 66, width: self.view.bounds.width, height: 30))
        textLabel.text = "Department"
        textLabel.font = .systemFont(ofSize: 12)
        view.addSubview(textLabel)

        segmentedView = JXSegmentedView()
        segmentedDataSource = JXSegmentedTitleDataSource()
        segmentedDataSource.isTitleColorGradientEnabled = true
        segmentedDataSource.isItemSpacingAverageEnabled = false
        segmentedDataSource.titleNormalColor = .hex(0x616161)
        segmentedDataSource.titleSelectedColor = .white
        segmentedDataSource.itemWidthIncrement = 12
        segmentedDataSource.itemSpacing = 30
        segmentedDataSource.isItemTransitionEnabled = false
        
        segmentedView.dataSource = segmentedDataSource

            //        let indicator = JXSegmentedIndicatorLineView()
            //        indicator.indicatorWidth = JXSegmentedViewAutomaticDimension
            //        indicator.lineStyle = .lengthen
            //        segmentedView.indicators = [indicator]

        let indicator = JXSegmentedIndicatorBackgroundView()
        indicator.indicatorHeight = 32
        indicator.indicatorColor = .black

        segmentedView.indicators = [indicator]

        segmentedView.delegate = self
        view.addSubview(segmentedView)

        contentScrollView = UIScrollView()
        contentScrollView.isPagingEnabled = true
        contentScrollView.showsVerticalScrollIndicator = false
        contentScrollView.showsHorizontalScrollIndicator = false
        contentScrollView.scrollsToTop = false
        contentScrollView.bounces = false

        contentScrollView.contentInsetAdjustmentBehavior = .never
        view.addSubview(contentScrollView)

        segmentedView.contentScrollView = contentScrollView

        DispatchQueue.main.async {
            self.reloadData()
        }
    }

    @objc func reloadData() {
        var titles:[String] = []
        for item in kCategoryMaps {
            titles.append(item["name"] as! String)
            let vc = CategoryTableViewController()
            vc.data = item["children"] as! [[String:Any]]
            vc.view.backgroundColor = .white
            vc.navigation = navigationController
            vc.tableView.reloadData()
            contentScrollView.addSubview(vc.view)
            listVCArray.append(vc)
        }
        segmentedDataSource.titles = titles
        segmentedView.defaultSelectedIndex = 0
        segmentedView.reloadData()
        view.setNeedsLayout()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        segmentedView.frame = CGRect(x: 0, y: searchHeight, width: view.bounds.size.width, height: 50)
        contentScrollView.frame = CGRect(x: 0, y: searchHeight + 50, width: view.bounds.size.width, height: view.bounds.size.height - (50 + searchHeight))
        contentScrollView.contentSize = CGSize(width: contentScrollView.bounds.size.width*CGFloat(segmentedDataSource.dataSource.count), height: contentScrollView.bounds.size.height)
        for (index, vc) in listVCArray.enumerated() {
            vc.view.frame = CGRect(x: contentScrollView.bounds.size.width*CGFloat(index), y: 0, width: contentScrollView.bounds.size.width, height: contentScrollView.bounds.size.height)
        }
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchTable.view.removeFromSuperview()
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        if searchTable.view.frame == CGRectZero {
            searchTable.view.frame = view.frame
        }
        view.addSubview(searchTable.view)
        searchTable.initData()
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if searchBar.text!.count == 0 {
            return
        }
        guard let mmkv = MMKV.default() else {
            return
        }
        var result:[String] = (mmkv.object(of: NSArray.self, forKey: "MMKVSearchHistory") ?? []) as! [String]
        for item in result {
            if item == searchBar.text! {
                result.remove(at: result.firstIndex(of: item)!)
                break
            }
        }
        result.insert(searchBar.text!, at: 0)
        if result.count == 6 {
            result.remove(at: 5)
        }
        mmkv.set(result as NSArray, forKey: "MMKVSearchHistory")
        searchTable.initData()
    }
}
