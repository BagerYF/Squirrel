    //
    //  WishListPageController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/1/20.
    //

import Foundation
import SnapKit
import MMKV

class WishListViewController: BaseViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    static let shareInstance = WishListViewController()

    var data:[WishlistModel] = []

    lazy var collectView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: (self.view.frame.size.width - 42) / 2 , height: 335)
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
//        layout.headerReferenceSize = CGSize.init(width: 1, height: 50)
        let collectView = UICollectionView.init(frame: self.view.frame, collectionViewLayout: layout)
        collectView.backgroundColor = .white
        collectView.delegate = self
        collectView.dataSource = self
        collectView.register(ProductListCell.self, forCellWithReuseIdentifier: "SwiftCollectionViewCell")
        collectView.showsHorizontalScrollIndicator = false
        collectView.isPagingEnabled = true

        let value = UIView.AutoresizingMask.flexibleHeight.rawValue | UIView.AutoresizingMask.flexibleWidth.rawValue
        collectView.autoresizingMask = UIView.AutoresizingMask.init(rawValue: value)

        return collectView
    }()

    lazy var empty: UILabel = {
        let empty = UILabel()
        empty.text = "Your wishlist is currently empty"
        empty.textAlignment = .center
        empty.font = .systemFont(ofSize: 16)
        return empty
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        initData()
    }

    override func viewDidLoad() {
        navLeftType = .None
        super.viewDidLoad()
        setRightNav()

        title = "Wishlist"

        initData()
    }

    func initData() {
        data = []
        guard let mmkv = MMKV.default() else {
            return
        }
        var result:[WishlistModel] = []
        let localResult:[[String:String]] = (mmkv.object(of: NSArray.self, forKey: "MMKVWishlist") ?? []) as! [[String:String]]
        for item in localResult {
            result.append(WishlistModel.deserialize(from: item)!)
        }

        if result.count == 0 {
            collectView.removeFromSuperview()
            self.view.addSubview(empty)
            empty.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(260)
                make.height.equalTo(50)
                make.center.equalTo(self.view)
            }
        } else {
            data = result
            empty.removeFromSuperview()
            self.view.addSubview(collectView)
            collectView.reloadData()
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ProductListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SwiftCollectionViewCell", for: indexPath) as! ProductListCell
        let item = data[indexPath.item]
        cell.setWishlistValues(item: item)
        cell.callBack = {
            self.removeWishlist(id: item.id)
            self.initData()
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = data[indexPath.item]
        let detail = ProductDetailViewController()
        detail.hidesBottomBarWhenPushed = true
        detail.id = item.id
        self.navigationController?.pushViewController(detail, animated: true)
    }

    func addWishlist(product: AppSchema.GetProductByIdQuery.Data.Product) {
        guard let mmkv = MMKV.default() else {
            return
        }
        var result:[WishlistModel] = []
        let localResult:[[String:String]] = (mmkv.object(of: NSArray.self, forKey: "MMKVWishlist") ?? []) as! [[String:String]]
        for item in localResult {
            result.append(WishlistModel.deserialize(from: item)!)
        }
        for (index, item) in result.enumerated() {
            if item.id == product.id {
                result.remove(at: index)
                break
            }
        }
        let tempDic = ["id": product.id, "image": product.images.edges[0].node.url, "title": product.title, "vendor": product.vendor, "price": product.variants.edges[0].node.price.amount]
        result.insert(WishlistModel(fromDictionary: tempDic), at: 0)
        mmkv.set(result.map({ e in
            e.toDictionary()
        }) as NSArray, forKey: "MMKVWishlist")
    }

    func removeWishlist(id: String) {
        guard let mmkv = MMKV.default() else {
            return
        }
        var result:[WishlistModel] = []
        let localResult:[[String:String]] = (mmkv.object(of: NSArray.self, forKey: "MMKVWishlist") ?? []) as! [[String:String]]
        for item in localResult {
            result.append(WishlistModel.deserialize(from: item)!)
        }
        for (index, item) in result.enumerated() {
            if item.id == id {
                result.remove(at: index)
                break
            }
        }
        mmkv.set(result.map({ e in
            e.toDictionary()
        }) as NSArray, forKey: "MMKVWishlist")
    }

    func isAddedWishlist(product: AppSchema.GetProductByIdQuery.Data.Product) -> Bool {
        var isAdded = false
        guard let mmkv = MMKV.default() else {
            return false
        }
        var result:[WishlistModel] = []
        let localResult:[[String:String]] = (mmkv.object(of: NSArray.self, forKey: "MMKVWishlist") ?? []) as! [[String:String]]
        for item in localResult {
            result.append(WishlistModel.deserialize(from: item)!)
        }
        for item in result {
            if item.id == product.id {
                isAdded = true
                break
            }
        }
        return isAdded
    }
}
