//
//  HomePageViewWithTitleCell.swift
//  shopifytestios
//
//  Created by Bager on 2023/1/31.
//

import UIKit

class HomePageViewWithTitleCell: UITableViewCell, FSPagerViewDelegate, FSPagerViewDataSource {

    var pageControl: FSPageControl!
    var pagerView: FSPagerView!
    var data:[Item] = []
    var titleLabel: UILabel!
    var subTitleLabel: UILabel!

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
            //        pagerView.automaticSlidingInterval = 10
        pagerView.itemSize = CGSize(width: 312, height: 435)
        pagerView.interitemSpacing = 16
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "HomePageViewWithTitlePagerCell")
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

        titleLabel = UILabel(frame: .zero)
        titleLabel.font = .systemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        self.contentView.addSubview(titleLabel)

        subTitleLabel = UILabel(frame: .zero)
        subTitleLabel.font = .systemFont(ofSize: 14)
        subTitleLabel.numberOfLines = 2
        subTitleLabel.textAlignment = .center
        subTitleLabel.lineBreakMode = .byWordWrapping
        self.contentView.addSubview(subTitleLabel)
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
        titleLabel.frame = CGRect(x: 0, y: 10, width: self.contentView.bounds.width, height: 30)
        subTitleLabel.frame = CGRect(x: 0, y: 56, width: self.contentView.bounds.width, height: 40)
        pagerView.frame = CGRect(x: 0, y: 136, width: self.contentView.bounds.width, height: 425)
        pageControl.frame = CGRect(x: 0, y: 611, width: self.contentView.bounds.width, height: 10)
    }

    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return data.count
    }

    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let item = data[index]
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "HomePageViewWithTitlePagerCell", at: index)
        cell.imageView?.kf.setImage(with: URL(string: "\(item.absoluteMobileImageUrl ?? "https://img2.baidu.com/it/u=2716494774,2819221109&fm=253&fmt=auto&app=138&f=JPEG?w=499&h=299")"))
        cell.imageView?.contentMode = .scaleToFill
        cell.textLabel?.text = "\(item.text ?? "")\n "
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.textLabel?.textAlignment = .center
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
        let vc = ProductListViewController()
        vc.hidesBottomBarWhenPushed = true
        self.parentContainerViewController()?.navigationController?.pushViewController(vc, animated: true)
    }

    func setValue(datas:HomeModel) {
        data = datas.items
        pageControl.numberOfPages = data.count
        pagerView.reloadData()
        titleLabel.text = datas.title
        subTitleLabel.text = datas.subTitle
    }
}
