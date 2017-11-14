//
//  ProductCollectionViewCell.swift
//  Pâtissier
//
//  Created by 劉仲軒 on 2017/6/14.
//  Copyright © 2017年 劉仲軒. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    var previewImageview = UIImageView()
    var productImageView = UIImageView()
    var productImageBackgroundView = UIView()
    var productBackground = UIView()
    var productTitleLabel = UILabel()
    var likeButton = UIButton()
    var dollarLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.contentView.addSubview(self.productBackground)
        self.contentView.addSubview(self.productImageBackgroundView)
        self.contentView.addSubview(self.previewImageview)
        self.contentView.addSubview(self.productImageView)
        self.productBackground.addSubview(self.productTitleLabel)
        self.productBackground.addSubview(self.likeButton)
        self.productBackground.addSubview(self.dollarLabel)
        
        self.setUp()
        self.addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setUp() {
        
        self.productImageBackgroundView.backgroundColor = .white
        self.productImageBackgroundView.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.26).cgColor
        self.productImageBackgroundView.layer.shadowOpacity = 1
        self.productImageBackgroundView.layer.shadowRadius = 1
        self.productImageBackgroundView.layer.shadowOffset = CGSize(width: 0, height: 1)
        
        self.previewImageview.image = UIImage(named: "icon-placeholder")?.withRenderingMode(.alwaysTemplate)
        self.previewImageview.tintColor = UIColor(red: 165/255.0, green: 170/255.0, blue: 178/255.0, alpha: 1)
        
        self.productImageView.layer.shadowPath = UIBezierPath(rect: self.productImageView.bounds).cgPath
        self.productImageView.clipsToBounds = false
        self.productImageView.layer.masksToBounds = false
        self.productImageView.layer.shadowColor = UIColor(red: 1, green: 0, blue: 0, alpha: 1).cgColor
        self.productImageView.layer.shadowOpacity = 1
        self.productImageView.layer.shadowRadius = 10
        self.productImageView.layer.shadowOffset = CGSize(width: 1, height: 1)
        
        self.productBackground.layer.cornerRadius = 1
        self.productBackground.layer.borderWidth = 0.5
        self.productBackground.layer.borderColor = UIColor(red: 74/255.0, green: 74/255.0, blue: 74/255.0, alpha: 1).cgColor
        
        self.productTitleLabel.textColor = UIColor(red: 82/255.0, green: 66/255.0, blue: 64/255.0, alpha: 1)
        self.productTitleLabel.font = UIFont(name: "Georgia", size: 14)
        self.productTitleLabel.numberOfLines = 1
        self.productTitleLabel.lineBreakMode = .byClipping
        self.productTitleLabel.text = "Restaurant Coffee C"
        
        self.likeButton.tintColor = UIColor(red: 165/255.0, green: 170/255.0, blue: 178/255.0, alpha: 1)
        self.likeButton.setImage(#imageLiteral(resourceName: "icon-heart").withRenderingMode(.alwaysTemplate), for: .normal)
        self.likeButton.layer.cornerRadius = 4
        self.likeButton.layer.borderWidth = 0.5
        self.likeButton.layer.borderColor = UIColor(red: 165/255.0, green: 170/255.0, blue: 178/255.0, alpha: 1).cgColor
        
        self.dollarLabel.textAlignment = .right
        self.dollarLabel.font = UIFont(name: "LuxiMono", size: 12)
        self.dollarLabel.textColor = UIColor(red: 82/255.0, green: 66/255.0, blue: 64/255.1, alpha: 1)
        self.dollarLabel.text = "$120"
        
    }
    
    func addConstraints() {
        
        self.productImageBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        self.previewImageview.translatesAutoresizingMaskIntoConstraints = false
        self.productImageView.translatesAutoresizingMaskIntoConstraints = false
        self.productBackground.translatesAutoresizingMaskIntoConstraints = false
        self.productTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.likeButton.translatesAutoresizingMaskIntoConstraints = false
        self.dollarLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let productImageViewTop = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: self.productImageView, attribute: .top, multiplier: 1, constant: 0)
        let productImageViewLeft = NSLayoutConstraint(item: self, attribute: .left, relatedBy: .equal, toItem: self.productImageView, attribute: .left, multiplier: 1, constant: 0)
        let productImageViewRight = NSLayoutConstraint(item: self, attribute: .right, relatedBy: .equal, toItem: self.productImageView, attribute: .right, multiplier: 1, constant: 0)
        let productImageViewHeight = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: self.productImageView, attribute: .height, multiplier: 1.6, constant: 0)
        
        let previewImageViewCenterX = NSLayoutConstraint(item: self.productImageView, attribute: .centerX, relatedBy: .equal, toItem: self.previewImageview, attribute: .centerX, multiplier: 1, constant: 0)
        let previewImageViewCenterY = NSLayoutConstraint(item: self.productImageView, attribute: .centerY, relatedBy: .equal, toItem: self.previewImageview, attribute: .centerY, multiplier: 1, constant: 0)
        let previewImageViewWidth = NSLayoutConstraint(item: self.previewImageview, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 20)
        let previewImageViewHeight = NSLayoutConstraint(item: self.previewImageview, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 20)
        
        let productImageBackgroundViewTop = NSLayoutConstraint(item: self.productImageBackgroundView, attribute: .top, relatedBy: .equal, toItem: self.productImageView, attribute: .top, multiplier: 1, constant: 0)
        let productImageBackgroundViewBottom = NSLayoutConstraint(item: self.productImageBackgroundView, attribute: .bottom, relatedBy: .equal, toItem: self.productImageView, attribute: .bottom, multiplier: 1, constant: 0)
        let productImageBackgroundViewLeft = NSLayoutConstraint(item: self.productImageBackgroundView, attribute: .left, relatedBy: .equal, toItem: self.productImageView, attribute: .left, multiplier: 1, constant: 0)
        let productImageBackgroundViewRight = NSLayoutConstraint(item: self.productImageBackgroundView, attribute: .right, relatedBy: .equal, toItem: self.productImageView, attribute: .right, multiplier: 1, constant: 0)
        
        let productBackgroundCenter = NSLayoutConstraint(item: self, attribute: .centerX, relatedBy: .equal, toItem: self.productBackground, attribute: .centerX, multiplier: 1, constant: 0)
        let productBackgroundTop = NSLayoutConstraint(item: self.productImageView, attribute: .bottom, relatedBy: .equal, toItem: self.productBackground, attribute: .top, multiplier: 1, constant: 10)
        let productBackgroundBottom = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: self.productBackground, attribute: .bottom, multiplier: 1, constant: 5)
        let productBackgroundWidth = NSLayoutConstraint(item: self, attribute: .width, relatedBy: .equal, toItem: self.productBackground, attribute: .width, multiplier: 1.1, constant: 0)
        
        let productTitleLabelTop = NSLayoutConstraint(item: self.productBackground, attribute: .top, relatedBy: .equal, toItem: self.productTitleLabel, attribute: .top, multiplier: 1, constant: -16)
        let productTitleLabelLeft = NSLayoutConstraint(item: self.productBackground, attribute: .left, relatedBy: .equal, toItem: self.productTitleLabel, attribute: .left, multiplier: 1, constant: -8)
        let productTitleLabelRight = NSLayoutConstraint(item: self.productBackground, attribute: .right, relatedBy: .equal, toItem: self.productTitleLabel, attribute: .right, multiplier: 1, constant: 8)
        
        let likeButtonBottom = NSLayoutConstraint(item: self.productBackground, attribute: .bottom, relatedBy: .equal, toItem: self.likeButton, attribute: .bottom, multiplier: 1, constant: 8)
        let likeButtonLeft = NSLayoutConstraint(item: self.productTitleLabel, attribute: .left, relatedBy: .equal, toItem: self.likeButton, attribute: .left, multiplier: 1, constant: 0)
        let likeButtonWidth = NSLayoutConstraint(item: self.likeButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 30)
        let likeButtonHeight = NSLayoutConstraint(item: self.likeButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 20)
        
        let dollarCenterY = NSLayoutConstraint(item: self.likeButton, attribute: .centerY, relatedBy: .equal, toItem: self.dollarLabel, attribute: .centerY, multiplier: 1, constant: 0)
        let dollarleft = NSLayoutConstraint(item: self.likeButton, attribute: .right, relatedBy: .equal, toItem: self.dollarLabel, attribute: .left, multiplier: 1, constant: -4)
        let dolleaRight = NSLayoutConstraint(item: self.dollarLabel, attribute: .right, relatedBy: .equal, toItem: self.productTitleLabel, attribute: .right, multiplier: 1, constant: 0)
        
        self.addConstraints([productImageViewTop, productImageViewLeft, productImageViewRight, productImageViewHeight, productBackgroundTop, productBackgroundWidth, productBackgroundBottom, productBackgroundCenter, productTitleLabelTop, productTitleLabelLeft, productTitleLabelRight, likeButtonBottom, likeButtonLeft, likeButtonWidth, likeButtonHeight, dollarleft, dolleaRight, dollarCenterY, previewImageViewWidth, previewImageViewHeight, previewImageViewCenterX, previewImageViewCenterY, productImageBackgroundViewTop, productImageBackgroundViewLeft, productImageBackgroundViewRight, productImageBackgroundViewBottom])
        
    }
}








