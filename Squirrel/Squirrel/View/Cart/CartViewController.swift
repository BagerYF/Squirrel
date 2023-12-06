    //
    //  CartViewController.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/3/20.
    //

import UIKit
import SnapKit
import MMKV
import FittedSheets

class CartViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    static let shareInstance = CartViewController()
    var cart: AppSchema.CartCommon?

    var tableView: UITableView!
    var appleBtn: UIButton!
    var checkoutBtn: UIButton!
    var subTotalLabel: UILabel!
    var tipLabel: UILabel!
    var bottomView: UIView!
    var qtyVC = SinglePickController()
    var variantId = ""

    lazy var empty: UILabel = {
        let empty = UILabel()
        empty.text = "Your shopping bag is currently empty"
        empty.textAlignment = .center
        empty.font = .systemFont(ofSize: 16)
        return empty
    }()

    override func viewDidLoad() {
        navLeftType = .Close
        super.viewDidLoad()

        title = "Shopping Bag"

        qtyVC.callBack = {[weak self] index in
            let qty = self!.qtyVC.data[index as! Int] as String
            self!.updateProductQuantityInCart(quantity: Int(qty)!)
        }
    }

    func initData() {
        initView()

        guard let mmkv = MMKV.default() else {
            return
        }
        let cartId: String = (mmkv.string(forKey: "MMKVCartId") ?? "")
        if cartId.count > 0 {
            queryCart(cartId: cartId)
        } else {
            updateView()
        }
    }

    func queryCart(cartId: String) {
        Network.shared.apollo.fetch(query: AppSchema.QueryCartQuery(id: cartId)) { [weak self] result in
            switch result {
            case .success(let response):
                self!.cart = response.data?.cart?.fragments.cartCommon
                self!.updateView()
                if (self!.cart == nil) {
                    guard let mmkv = MMKV.default() else {
                        return
                    }
                    mmkv.removeValue(forKey: "MMKVCartId")
                }

            case .failure(let error):
                print("error===\(error)")
            }
        }
    }

    func addProductsToCart(variantId: String) {
        if (cart != nil) {
            addProductsToExistCart(variantId: variantId)
        } else {
            createCart(variantId: variantId)
        }
    }

    func createCart(variantId: String) {
        let lines: [AppSchema.CartLineInput] = [AppSchema.CartLineInput(attributes: [AppSchema.AttributeInput(key: "cart_attribute", value: "This is a cart attribute")], quantity: 1, merchandiseId: variantId)]
        Network.shared.apollo.perform(mutation: AppSchema.CreateCartMutation(input: AppSchema.CartInput(lines: .some(lines)))) {[weak self] result in
            switch result {
            case .success(let response):
                self!.cart = response.data?.cartCreate?.cart?.fragments.cartCommon
                self!.updateView()
                guard let mmkv = MMKV.default() else {
                    return
                }
                mmkv.set(self!.cart?.id ?? "", forKey: "MMKVCartId")
                Toast.show("Already added to bag")
            case .failure(let error):
                print("error===\(error)")
            }
        }
    }

    func addProductsToExistCart(variantId: String) {
        let lines: [AppSchema.CartLineInput] = [AppSchema.CartLineInput(attributes: [AppSchema.AttributeInput(key: "cart_attribute", value: "This is a cart attribute")], quantity: 1, merchandiseId: variantId)]
        Loading.show()
        Network.shared.apollo.perform(mutation: AppSchema.AddProductsToCartMutation(cartId: cart!.id, lines: lines)) {[weak self] result in
            switch result {
            case .success(let response):
                self!.cart = response.data?.cartLinesAdd?.cart?.fragments.cartCommon
                self!.updateView()
                Loading.dismiss()
                Toast.show("Already added to bag")
            case .failure(let error):
                print("error===\(error)")
                Loading.dismiss()
            }
        }
    }

    func initView() {
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - UIDevice.navigationFullHeight() - UIDevice.safeDistanceBottom() - 120), style: UITableView.Style.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.separatorStyle = .none
        tableView.register(CartItemCell.self, forCellReuseIdentifier: "CartItemCell")
        tableView.register(CartReviewsAndReturnsCell.self, forCellReuseIdentifier: "CartReviewsAndReturnsCell")

        bottomView = UIView(frame: CGRect(x: 0, y: CGRectGetHeight(tableView.frame), width: kScreenWidth, height: 120))

        let line = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 1))
        line.backgroundColor = AppColor.grey_eeeeee
        bottomView.addSubview(line)

        subTotalLabel = UILabel(frame: CGRect(x: kPublicMargin, y: 10, width: kScreenWidth - kPublicMargin * 2, height: 20))
        subTotalLabel.font = .systemFont(ofSize: 14)
        subTotalLabel.text = "Subtotal"
        bottomView.addSubview(subTotalLabel)

        tipLabel = UILabel(frame: CGRect(x: kPublicMargin, y: CGRectGetMaxY(subTotalLabel.frame), width: kScreenWidth - kPublicMargin * 2, height: 20))
        tipLabel.font = .systemFont(ofSize: 12)
        tipLabel.text = "Shipping and taxes calculated at checkout"
        bottomView.addSubview(tipLabel)

        appleBtn = UIButton(frame: CGRect(x: kPublicMargin, y: CGRectGetMaxY(tipLabel.frame) + 16, width: (kScreenWidth - kPublicMargin * 3) / 2.0, height: 40))
        appleBtn.setImage(UIImage(named: "product_detail_apple_pay"), for: .normal)
        appleBtn.setTitleColor(.white, for: .normal)
        appleBtn.backgroundColor = .white
        appleBtn.layer.borderColor = UIColor.black.cgColor
        appleBtn.layer.borderWidth = 1
        appleBtn.layer.cornerRadius = 2
        appleBtn.titleLabel?.font = .systemFont(ofSize: 16)
        appleBtn.addTarget(self, action: #selector(appleClick), for: .touchUpInside)
        bottomView.addSubview(appleBtn)

        checkoutBtn = UIButton(frame: CGRect(x: CGRectGetMaxX(appleBtn.frame) + kPublicMargin, y: CGRectGetMaxY(tipLabel.frame) + 16, width: (kScreenWidth - kPublicMargin * 3) / 2.0, height: 40))
        checkoutBtn.setTitle("Checkout", for: .normal)
        checkoutBtn.setTitleColor(.white, for: .normal)
        checkoutBtn.backgroundColor = .black
        checkoutBtn.layer.cornerRadius = 2
        checkoutBtn.titleLabel?.font = .systemFont(ofSize: 16)
        checkoutBtn.addTarget(self, action: #selector(checkoutClick), for: .touchUpInside)
        bottomView.addSubview(checkoutBtn)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (cart?.lines.edges.count ?? 0) + 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == (cart?.lines.edges.count ?? 0) {
            let cell = CartReviewsAndReturnsCell(style: .default, reuseIdentifier: "CartReviewsAndReturnsCell")
            return cell
        }
        let item = cart?.lines.edges[indexPath.row]
        let cell = CartItemCell(style: .default, reuseIdentifier: "CartItemCell")
        cell.setValue(item: item)
        cell.deleteCallBack = { [weak self] in
            self!.removeProductFromCart(variantId: item?.node.id ?? "")
        }
        cell.qtyCallBack = { [weak self] in
            self!.qtyPick(index: indexPath.row)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == (cart?.lines.edges.count ?? 0) {
            return 250
        }
        return 230
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

    @objc func checkoutClick() {
        let checkout = CheckoutViewController()
        self.navigationController?.pushViewController(checkout, animated: true)
    }

    @objc func appleClick() {
        let checkout = CheckoutViewController()
        self.navigationController?.pushViewController(checkout, animated: true)
    }

    func updateProductQuantityInCart(quantity: Int) {
        let lines: [AppSchema.CartLineUpdateInput] = [AppSchema.CartLineUpdateInput(id: variantId, quantity: .some(quantity))]
        Loading.show()
        Network.shared.apollo.perform(mutation: AppSchema.UpdateProductQuantityInCartMutation(cartId: cart!.id, lines: lines)) {[weak self] result in
            switch result {
            case .success(let response):
                self!.cart = response.data?.cartLinesUpdate?.cart?.fragments.cartCommon
                self!.updateView()
                Loading.dismiss()
            case .failure(let error):
                print("error===\(error)")
                Loading.dismiss()
            }
        }
    }

    func removeProductFromCart(variantId: String) {
        let lines: [String] = [variantId]
        Loading.show()
        Network.shared.apollo.perform(mutation: AppSchema.RemoveProductFromCartMutation(cartId: cart!.id, lineIds: lines)) {[weak self] result in
            switch result {
            case .success(let response):
                self!.cart = response.data?.cartLinesRemove?.cart?.fragments.cartCommon
                self!.updateView()
                Loading.dismiss()
            case .failure(let error):
                print("error===\(error)")
                Loading.dismiss()
            }
        }
    }

    func updateView() {
        if cart?.lines.edges.count ?? 0 > 0 {
            self.view.addSubview(tableView)
            self.view.addSubview(bottomView)
            subTotalLabel.text = "Subtotal \((cart?.cost.totalAmount.currencyCode ?? .case(.usd)).rawValue) \(cart?.cost.totalAmount.amount ?? "")"
            tableView.reloadData()
        } else {
            tableView.removeFromSuperview()
            bottomView.removeFromSuperview()
            self.view.addSubview(empty)
            empty.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(280)
                make.height.equalTo(50)
                make.center.equalTo(self.view)
            }
        }
        NotificationCenter.default.post(name: .init("NotificationUpdateCartQty"), object: nil)
    }

    func qtyPick(index: Int) {
        let item = cart?.lines.edges[index]
        variantId = item?.node.id ?? ""
        var data: [String] = []
        if item?.node.merchandise.asProductVariant?.quantityAvailable ?? 0 > 0 {
            for i in 1...(item?.node.merchandise.asProductVariant?.quantityAvailable)! {
                if i > 5 {
                    break
                }
                data.append("\(i)")
            }
        }
        if data.count == 0 {
            return
        }
        let sheetController = SheetViewController(controller: qtyVC, sizes: [.fixed(310 + UIDevice.safeDistanceBottom())], options: SheetOptions(useInlineMode: true))
        qtyVC.initData(titles: "Please select a quantity", sheetControllers: sheetController, datas: data)
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

    func getCartQty() -> String {
        var text = ""
        let total = cart?.totalQuantity ?? 0
        if total == 0 {
            text = ""
        } else if total > 99 {
            text = "+99";
        } else {
            text = "\(total)"
        }
        return text
    }
}
