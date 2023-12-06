    //
    //  ProductListHeaderView.swift
    //  shopifytestios
    //
    //  Created by Bager on 2023/2/7.
    //

import Foundation
import UIKit
import SnapKit
import Then

class ProductListHeaderView: UICollectionReusableView {

    var filterCallBack: CallBacks?
    var sortCallBack: CallBacks?

    lazy var filterView: UIView = {
        let bgView = UIView(frame: .zero)
        self.addSubview(bgView)

        let img = UIImageView(frame: CGRectMake(0, 0, 14, 50))
        img.image = UIImage(named: "product_refine")
        img.contentMode = .scaleAspectFit
        bgView.addSubview(img)

        let title = UILabel(frame: CGRect(x: 20, y: 0, width: 50, height: 50))
        title.text = "Filter"
        title.font = .systemFont(ofSize: 14)
        bgView.addSubview(title)

        return bgView
    }()

    lazy var sortTitle: UILabel = {
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 50))
        title.textAlignment = .right
        title.font = .systemFont(ofSize: 14)
        return title
    }()

    lazy var sortView: UIView = {
        let bgView = UIView(frame: .zero)
        self.addSubview(bgView)

        let img = UIImageView(frame: CGRectMake(126, 0, 14, 50))
        img.image = UIImage(named: "product_down_arrow")
        img.contentMode = .scaleAspectFit
        bgView.addSubview(img)


        bgView.addSubview(sortTitle)

        return bgView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        let filterTapGesture = UITapGestureRecognizer(target: self, action: #selector(filterTapAction(gesture:)))
        filterView.addGestureRecognizer(filterTapGesture)

        let sortTapGesture = UITapGestureRecognizer(target: self, action: #selector(sortTapAction(gesture:)))
        sortView.addGestureRecognizer(sortTapGesture)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        filterView.frame = CGRect(x: kPublicMargin, y: 0, width: 60, height: 50)
        sortView.snp.makeConstraints { make in
            make.width.equalTo(140)
            make.height.equalTo(50)
            make.right.equalTo(self).offset(-16)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    @objc func filterTapAction(gesture: UIGestureRecognizer) {
        if (filterCallBack != nil) {
            filterCallBack!()
        }
    }

    @objc func sortTapAction(gesture: UIGestureRecognizer) {
        if (sortCallBack != nil) {
            sortCallBack!()
        }
    }
}
