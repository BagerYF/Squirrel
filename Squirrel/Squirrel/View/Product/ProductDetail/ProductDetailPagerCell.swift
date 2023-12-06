//
//  ProductDetailCell.swift
//  shopifytestios
//
//  Created by Bager on 2023/3/10.
//

import UIKit

class ProductDetailPagerCell: UITableViewCell, FSPagerViewDelegate, FSPagerViewDataSource {

    var pageControl: FSPageControl!
    var pagerView: FSPagerView!
    var data:[String] = []

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        initView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initView() {
        pagerView = FSPagerView(frame: .zero)
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.isNormal = true
            //        pagerView.automaticSlidingInterval = 10
        pagerView.itemSize = CGSize(width: kScreenWidth, height: 330)
        pagerView.interitemSpacing = 0
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "HomePageViewPagerCell")
        self.contentView.addSubview(pagerView)
            // Create a page control
        pageControl = FSPageControl(frame: .zero)
        pageControl.numberOfPages = data.count
        pageControl.contentHorizontalAlignment = .center
        pageControl.itemSpacing = 7
        pageControl.interitemSpacing = 14
        pageControl.setFillColor(.hex(0xe0e0e0), for: .normal)
        pageControl.setFillColor(.hex(0x424242), for: .selected)
        self.contentView.addSubview(pageControl)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
            // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

            // Configure the view for the selected state
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        pagerView.frame = CGRect(x: 0, y: 0, width: self.contentView.bounds.width, height: 330)
        pageControl.frame = CGRect(x: 0, y: 340, width: self.contentView.bounds.width, height: 10)
    }

    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return data.count
    }

    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let item = data[index]
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "HomePageViewPagerCell", at: index)
        cell.isNormal = true
        cell.imageView?.kf.setImage(with: URL(string: item))
        return cell
    }

    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        self.pageControl.currentPage = targetIndex
    }

    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        self.pageControl.currentPage = pagerView.currentIndex
    }

    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }

    func setValue(product:AppSchema.GetProductByIdQuery.Data.Product?) {
        for item in (product?.images.edges ?? []) {
            data.append(item.node.url)
        }
        pageControl.numberOfPages = data.count
        pagerView.reloadData()
    }
}
