    //
    //  ProductListViewController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/1/31.
    //

import UIKit
import Apollo
import ESPullToRefresh
import Then
import SkeletonView
import FittedSheets
import ProgressHUD
import Foundation

class ProductListViewController: BaseViewController, UICollectionViewDelegate, SkeletonCollectionViewDataSource {

    var data:[AppSchema.CollectionQuery.Data.Collection.Products.Edge] = []

    var endCursor:String? = nil

    var sortModel = ProductSortModel(fromDictionary: ["name": "Most Relevant", "reverse": false, "sortKey": AppSchema.ProductCollectionSortKeys.relevance])

    var footer: ESRefreshFooterAnimator {
        get {
            let f = ESRefreshFooterAnimator.init(frame: CGRect.zero)
            f.loadingMoreDescription = ""
            f.noMoreDataDescription = "no more data"
            f.loadingDescription = ""
            return f
        }
    }

    let filterVC = ProductFilterViewController()
    let sortVC = ProductSortViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setRightNav()

        title = "Product"
            //        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4) {
            ////            self.collectView.hideSkeleton()
            //        }

        view.addSubview(collectView)

        sortVC.sortCallBack = { result in
            self.sortModel = result as! ProductSortModel
            self.initData()
        }

        filterVC.filterCallBack = {
                // get data
            self.initData()
            Loading.show()
        }

        initData()
    }

    func showSkeleton() {
        let animation = GradientDirection.topLeftBottomRight.slidingAnimation()
        self.collectView.showAnimatedGradientSkeleton(animation: animation)
    }

    func initData() {
        showSkeleton()
        self.data = []
        collectView.reloadData()
        self.collectView.es.resetNoMoreData()

        getData()
    }

    func getData() {
        var tempfilters: [AppSchema.ProductFilter] = []
        for e in filterVC.currentFilters {
            if let data = e.data(using: .utf8) {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String : Any]
                    for (key, value) in json {
                        if key == "variantOption" {
                            let v = value as! [String:String]
                            let f = AppSchema.ProductFilter.init(variantOption: .some(AppSchema.VariantOptionFilter(name: v["name"] ?? "", value: v["value"] ?? "")))
                            tempfilters.append(f)
                        } else if key == "productVendor" {
                            let f = AppSchema.ProductFilter.init(productVendor: .some(value as! String))
                            tempfilters.append(f)
                        } else if key == "productType" {
                            let f = AppSchema.ProductFilter.init(productType: .some(value as! String))
                            tempfilters.append(f)
                        }
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        Network.shared.apollo.fetch(query: AppSchema.CollectionQuery(id: AppConstants.collectionGid, first: 30, after: endCursor != nil ? .some(endCursor!):nil, sortKey: .some(.case(sortModel.sortKey)), filters: .some(tempfilters), reverse: .some(sortModel.reverse)), cachePolicy: .fetchIgnoringCacheData) { result in
            switch result {
            case .success(let response):
                let tempData = response.data?.collection?.products.edges

                self.data.append(contentsOf: tempData!)

                self.collectView.reloadData()

                self.collectView.es.stopLoadingMore()

                if (response.data?.collection?.products.pageInfo.hasNextPage == false) {
                    self.collectView.es.noticeNoMoreData()
                } else {
                    self.collectView.es.resetNoMoreData()
                }
                self.endCursor = response.data?.collection?.products.pageInfo.endCursor

                self.filterVC.initFilters(tempFilters: response.data?.collection?.products.filters ?? [])

            case .failure(let error):
                print("error===\(error)")
            }
            self.collectView.hideSkeleton()
            Loading.dismiss()
        }
    }

    lazy var collectView:UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: (self.view.frame.size.width - 42) / 2 , height: 335)
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.headerReferenceSize = CGSize.init(width: 1, height: 50)
        let collectView = UICollectionView.init(frame: self.view.frame, collectionViewLayout: layout)
        collectView.backgroundColor = .white
        collectView.delegate = self
        collectView.dataSource = self
        collectView.register(ProductListCell.self, forCellWithReuseIdentifier: "SwiftCollectionViewCell")
        collectView.register(ProductListHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SwiftCollectionViewHeader")
        collectView.register(ProductListCell.self, forCellWithReuseIdentifier: "SkeletonCell")
        collectView.showsVerticalScrollIndicator = true
        collectView.isSkeletonable = true
//        collectView.isPagingEnabled = true

        let value = UIView.AutoresizingMask.flexibleHeight.rawValue | UIView.AutoresizingMask.flexibleWidth.rawValue
        collectView.autoresizingMask = UIView.AutoresizingMask.init(rawValue: value)

        collectView.es.addInfiniteScrolling(animator: footer) {
            self.getData()
        }

        return collectView
    }()

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ProductListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SwiftCollectionViewCell", for: indexPath) as! ProductListCell
        let item = data[indexPath.item].node
        cell.setValue(item: item)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader  {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SwiftCollectionViewHeader", for: indexPath) as! ProductListHeaderView
            header.filterCallBack = {
                self.filterClick()
            }
            header.sortCallBack = {
                self.sortClick()
            }
            header.sortTitle.text = sortModel.name
            return header
        } else {
            return UICollectionReusableView()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = data[indexPath.item].node
        let detail = ProductDetailViewController()
        detail.id = item.id
        self.navigationController?.pushViewController(detail, animated: true)
    }

    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "SkeletonCell"
    }

    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionSkeletonView(_ skeletonView: UICollectionView, skeletonCellForItemAt indexPath: IndexPath) -> UICollectionViewCell? {
        let cell:ProductListCell = skeletonView.dequeueReusableCell(withReuseIdentifier: "SkeletonCell", for: indexPath) as! ProductListCell
        cell.isSkeletonable = true
        return cell
    }

    func collectionSkeletonView(_ skeletonView: UICollectionView, prepareCellForSkeleton cell: UICollectionViewCell, at indexPath: IndexPath) {
        let cell = cell as? ProductListCell
        cell?.isSkeletonable = true
    }

    func filterClick() {
        let sheetController = SheetViewController(controller: filterVC, sizes: [.marginFromTop(50)], options: SheetOptions(useInlineMode: true))
        filterVC.sheetController = sheetController
        sheetController.allowGestureThroughOverlay = false
        sheetController.gripSize = .zero
        sheetController.cornerRadius = 0

        sheetController.willMove(toParent: self)
        self.addChild(sheetController)
        view.addSubview(sheetController.view)
        sheetController.didMove(toParent: self)

        sheetController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sheetController.view.topAnchor.constraint(equalTo: view.topAnchor),
            sheetController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sheetController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sheetController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        sheetController.animateIn()
    }

    func sortClick() {
        let sheetController = SheetViewController(controller: sortVC, sizes: [.fixed(304 + UIDevice.safeDistanceBottom())], options: SheetOptions(useInlineMode: true))
        sortVC.sheetController = sheetController
        sheetController.allowGestureThroughOverlay = false
        sheetController.gripSize = .zero
        sheetController.cornerRadius = 0

        sheetController.willMove(toParent: self)
        self.addChild(sheetController)
        view.addSubview(sheetController.view)
        sheetController.didMove(toParent: self)

        sheetController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sheetController.view.topAnchor.constraint(equalTo: view.topAnchor),
            sheetController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sheetController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sheetController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        sheetController.animateIn()
    }
}
