    //
    //  ProductDetailRecommendedCell.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/3/13.
    //

import UIKit

class ProductDetailRecommendedCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {

    var data:[AppSchema.ProductRecommendationsQuery.Data.ProductRecommendation] = []
    var titleLabel: UILabel!

    lazy var collectView: UICollectionView = {
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: kScreenWidth / 2 , height: 335)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.headerReferenceSize = CGSize.init(width: 1, height: 50)
        layout.scrollDirection = .horizontal
        let collectView = UICollectionView.init(frame: CGRect(x: 0, y: 50, width: kScreenWidth, height: 380), collectionViewLayout: layout)
        collectView.backgroundColor = .white
        collectView.delegate = self
        collectView.dataSource = self
        collectView.register(ProductListCell.self, forCellWithReuseIdentifier: "SwiftCollectionViewCell")
        collectView.showsHorizontalScrollIndicator = false
        collectView.isPagingEnabled = true

//        let value = UIView.AutoresizingMask.flexibleHeight.rawValue | UIView.AutoresizingMask.flexibleWidth.rawValue
//        collectView.autoresizingMask = UIView.AutoresizingMask.init(rawValue: value)

        return collectView
    }()

    lazy var pageControl: UIPageControl = {
        var pageControl = UIPageControl(frame: .zero)
        pageControl.backgroundColor = UIColor.clear
        pageControl.numberOfPages = 5
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = .hex(0xe0e0e0)
        pageControl.currentPageIndicatorTintColor = .hex(0x424242)
        pageControl.sizeToFit()
        pageControl.center = CGPointMake(kScreenWidth / 2.0 - 30, 400)
        pageControl.addTarget(self, action: #selector(pageChanged(_:)),
                              for: UIControl.Event.valueChanged)
        return pageControl
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        initView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func initView() {
        titleLabel = UILabel(frame: .zero)
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.text = "Recommended"
        self.contentView.addSubview(titleLabel)

        self.contentView.addSubview(collectView)
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
        titleLabel.frame = CGRect(x: kPublicMargin, y: 0, width: 200, height: 50)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ProductListCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SwiftCollectionViewCell", for: indexPath) as! ProductListCell
        cell.margin = 5
        let item = data[indexPath.item]
        cell.setRecommendedValues(item: item)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = data[indexPath.item]
        let detail = ProductDetailViewController()
        detail.id = item.id
        self.parentContainerViewController()?.navigationController?.pushViewController(detail, animated: true)
    }

    func setValue(value:[AppSchema.ProductRecommendationsQuery.Data.ProductRecommendation]) {
        data = value
        collectView.reloadData()
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / kScreenWidth
        pageControl.currentPage = Int(index)
    }

    @objc func pageChanged(_ sender:UIPageControl) {
        var frame = collectView.frame
        frame.origin.x = frame.size.width * CGFloat(sender.currentPage)
        frame.origin.y = 0
        collectView.scrollRectToVisible(frame, animated:true)
    }
}
