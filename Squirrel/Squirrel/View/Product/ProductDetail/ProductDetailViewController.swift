    //
    //  ProductDetailViewController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/1/31.
    //

import UIKit
import FittedSheets

class ProductDetailViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    var id: String = ""
    var product: AppSchema.GetProductByIdQuery.Data.Product?
    var tableView: UITableView!
    var button: UIButton!
    let sizeVC = ProductDetailSizePickController()
    var rowHeight:[CGFloat] = [380, 140, 125, 120, 300, 430]
    var reuseIdentifier:[String] = ["ProductDetailPagerCell", "ProductDetailBasicInfoCell", "ProductDetailSizeCell", "ProductDetailDescriptionCell", "ProductDetailShippingAndReturnCell", "ProductDetailRecommendedCell"]
    var variant: AppSchema.GetProductByIdQuery.Data.Product.Variants.Edge?
    var recommendedData : [AppSchema.ProductRecommendationsQuery.Data.ProductRecommendation] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setRightNav()

        getData()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
    }

    func getData() {
        Loading.show()
        Network.shared.apollo.fetch(query: AppSchema.GetProductByIdQuery(id: id), cachePolicy: .fetchIgnoringCacheData) { [self] result in
            switch result {
            case .success(let response):
                self.product = response.data?.product
                self.initData()
            case .failure(let error):
                print("error===\(error)")
            }
            Loading.dismiss()
        }
    }

    func getRecommendedData() {
        Network.shared.apollo.fetch(query: AppSchema.ProductRecommendationsQuery(productId: product?.id ?? ""), cachePolicy: .fetchIgnoringCacheData) { [self] result in
            switch result {
            case .success(let response):
                self.recommendedData = response.data?.productRecommendations ?? []
                self.tableView.reloadRows(at: [IndexPath(row: 5, section: 0)], with: .fade)
            case .failure(let error):
                print("error===\(error)")
            }
        }
    }

    func initData() {
        rowHeight[3] = ProductDetailDescriptionCell().getCellHeight(product: product)
        for item in product?.variants.edges ?? [] {
            if item.node.quantityAvailable ?? 0 > 0 {
                variant = item
                break
            }
        }
        initView()
        getRecommendedData()
        sizeVC.product = product
        sizeVC.callBack = { e in
            self.variant = e as? AppSchema.GetProductByIdQuery.Data.Product.Variants.Edge
            self.tableView.reloadRows(at: [IndexPath(row: 2, section: 0)], with: .fade)
        }
    }

    func initView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: self.view.bounds.height - UIDevice.safeDistanceBottom() - 60), style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(ProductDetailPagerCell.self, forCellReuseIdentifier: reuseIdentifier[0])
        tableView.register(ProductDetailBasicInfoCell.self, forCellReuseIdentifier: reuseIdentifier[1])
        tableView.register(ProductDetailSizeCell.self, forCellReuseIdentifier: reuseIdentifier[2])
        tableView.register(ProductDetailDescriptionCell.self, forCellReuseIdentifier: reuseIdentifier[3])
        tableView.register(ProductDetailShippingAndReturnCell.self, forCellReuseIdentifier: reuseIdentifier[4])
        tableView.register(ProductDetailRecommendedCell.self, forCellReuseIdentifier: reuseIdentifier[5])
        self.view.addSubview(tableView)

        button = UIButton(frame: CGRect(x: kPublicMargin, y: CGRectGetMaxY(tableView.frame) + 10, width: kScreenWidth - kPublicMargin * 2, height: 40))
        button.setTitle("Add to bag", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 2
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        self.view.addSubview(button)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowHeight.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = ProductDetailPagerCell(style: .default, reuseIdentifier: reuseIdentifier[indexPath.row])
            cell.setValue(product: product)
            return cell
        } else if indexPath.row == 1 {
            let cell = ProductDetailBasicInfoCell(style: .default, reuseIdentifier: reuseIdentifier[indexPath.row])
            cell.setValue(product: product)
            return cell
        } else if indexPath.row == 2 {
            let cell = ProductDetailSizeCell(style: .default, reuseIdentifier: reuseIdentifier[indexPath.row])
            cell.setValue(variant: variant)
            cell.callBack = {
                self.sizeClick()
            }
            return cell
        } else if indexPath.row == 3 {
            let cell = ProductDetailDescriptionCell(style: .default, reuseIdentifier: reuseIdentifier[indexPath.row])
            cell.setValue(product: product)
            return cell
        } else if indexPath.row == 4 {
            let cell = ProductDetailShippingAndReturnCell(style: .default, reuseIdentifier: reuseIdentifier[indexPath.row])
            return cell
        } else if indexPath.row == 5 {
            let cell = ProductDetailRecommendedCell(style: .default, reuseIdentifier: reuseIdentifier[indexPath.row])
            cell.setValue(value: recommendedData)
            return cell
        }
        let cell = UITableViewCell(style: .default, reuseIdentifier: "identifier")
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight[indexPath.row]
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

    @objc func buttonClick() {
        CartViewController.shareInstance.addProductsToCart(variantId: variant?.node.id ?? "")
    }

    func sizeClick() {
        let sheetController = SheetViewController(controller: sizeVC, sizes: [.fixed(310 + UIDevice.safeDistanceBottom())], options: SheetOptions(useInlineMode: true))
        sizeVC.sheetController = sheetController
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
