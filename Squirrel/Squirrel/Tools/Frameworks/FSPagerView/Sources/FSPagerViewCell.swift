    //
    //  FSPagerViewCell.swift
    //  FSPagerView
    //
    //  Created by Wenchao Ding on 17/12/2016.
    //  Copyright © 2016 Wenchao Ding. All rights reserved.
    //

import UIKit

open class FSPagerViewCell: UICollectionViewCell {
    
        /// Returns the label used for the main textual content of the pager view cell.
    @objc
    open var textLabel: UILabel? {
        if let _ = _textLabel {
            return _textLabel
        }
        
        let textLabel = UILabel(frame: .zero)
        textLabel.textColor = .black
        textLabel.font = .systemFont(ofSize: 14)
        textLabel.numberOfLines = 2
        self.contentView.addSubview(textLabel)
        
        textLabel.addObserver(self, forKeyPath: "font", options: [.old,.new], context: kvoContext)
        
        _textLabel = textLabel
        return textLabel
    }
    
        /// Returns the image view of the pager view cell. Default is nil.
    @objc
    open var imageView: UIImageView? {
        if let _ = _imageView {
            return _imageView
        }
        let imageView = UIImageView(frame: .zero)
        if isNormal {
            imageView.contentMode = .scaleAspectFill
        } else {
            imageView.contentMode = .scaleAspectFit
        }
        self.contentView.addSubview(imageView)
        _imageView = imageView
        return imageView
    }

    @objc
    open var bottomView: UIView? {
        if let _ = _bottomView {
            return _bottomView
        }
        let bottomView = UIView(frame: .zero)
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 66, height: 20))
        label.textColor = UIColor.black
        label.text = "Shop Now"
        label.font = .systemFont(ofSize: 14)
        bottomView.addSubview(label)

        let lineView = UIView(frame: CGRect(x: 0, y: 19, width: 66, height: 1))
        lineView.backgroundColor = UIColor.black
        bottomView.addSubview(lineView)

        self.contentView.addSubview(bottomView)
        _bottomView = bottomView
        return bottomView
    }

    fileprivate weak var _textLabel: UILabel?
    fileprivate weak var _imageView: UIImageView?
    fileprivate weak var _bottomView: UIView?
    
    fileprivate let kvoContext = UnsafeMutableRawPointer(bitPattern: 0)
    fileprivate let selectionColor = UIColor(white: 0.2, alpha: 0)
    
    fileprivate weak var _selectedForegroundView: UIView?
    fileprivate var selectedForegroundView: UIView? {
        guard _selectedForegroundView == nil else {
            return _selectedForegroundView
        }
        guard let imageView = _imageView else {
            return nil
        }
        let view = UIView(frame: imageView.bounds)
        imageView.addSubview(view)
        _selectedForegroundView = view
        return view
    }
    
    open override var isHighlighted: Bool {
        set {
            super.isHighlighted = newValue
            if newValue {
                self.selectedForegroundView?.layer.backgroundColor = self.selectionColor.cgColor
            } else if !super.isSelected {
                self.selectedForegroundView?.layer.backgroundColor = UIColor.clear.cgColor
            }
        }
        get {
            return super.isHighlighted
        }
    }
    
    open override var isSelected: Bool {
        set {
            super.isSelected = newValue
            self.selectedForegroundView?.layer.backgroundColor = newValue ? self.selectionColor.cgColor : UIColor.clear.cgColor
        }
        get {
            return super.isSelected
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    fileprivate func commonInit() {
        self.contentView.backgroundColor = UIColor.clear
        self.backgroundColor = UIColor.clear
            //        self.contentView.layer.shadowColor = UIColor.black.cgColor
            //        self.contentView.layer.shadowRadius = 5
            //        self.contentView.layer.shadowOpacity = 0.75
            //        self.contentView.layer.shadowOffset = .zero
    }
    
    deinit {
        if let textLabel = _textLabel {
            textLabel.removeObserver(self, forKeyPath: "font", context: kvoContext)
        }
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        if let imageView = _imageView {
            if isNormal {
                imageView.frame = self.contentView.bounds
            } else {
                imageView.frame = CGRect(x: 0, y: 0, width: 312, height: 383)
            }

        }
        if let textLabel = _textLabel {
            if isNormal {
                textLabel.superview!.frame = {
                    var rect = self.contentView.bounds
                    let height = textLabel.font.pointSize*1.5
                    rect.size.height = height
                    rect.origin.y = self.contentView.frame.height-height
                    return rect
                }()
                textLabel.frame = {
                    var rect = textLabel.superview!.bounds
                    rect = rect.insetBy(dx: 8, dy: 0)
                    rect.size.height -= 1
                    rect.origin.y += 1
                    return rect
                }()
            } else {
                textLabel.frame =  CGRect(x: 0, y: 383 + 16, width: 312, height: 40)
            }
        }
        if let bottomView = _bottomView {
            bottomView.frame = CGRect(x: 0, y: 383 + 16 + 40 + 16, width: 66, height: 20)
        }

        if let selectedForegroundView = _selectedForegroundView {
            selectedForegroundView.frame = self.contentView.bounds
        }
    }

    open override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if context == kvoContext {
            if keyPath == "font" {
                self.setNeedsLayout()
            }
        } else {
            super.observeValue(forKeyPath: keyPath, of: object, change: change, context: context)
        }
    }

    open var isNormal: Bool = false {
        didSet {
            //
        }
    }
}
