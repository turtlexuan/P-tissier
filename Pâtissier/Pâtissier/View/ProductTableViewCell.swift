//
//  ProductTableViewCell.swift
//  Pâtissier
//
//  Created by 劉仲軒 on 2017/6/20.
//  Copyright © 2017年 劉仲軒. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    var productImageView = UIImageView()
    var productNameLabel = UILabel()
    var productPriceLabel = UILabel()
    var addToCartButton = UIButton()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(productImageView)
        self.contentView.addSubview(productNameLabel)
        self.contentView.addSubview(productPriceLabel)
        self.contentView.addSubview(addToCartButton)
        
        self.setUp()
        self.setConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
    }
    
    func setUp() {
        
        self.productImageView.layer.borderWidth = 0.1
        self.productImageView.layer.borderColor = UIColor(red: 151/255.0, green: 151/255.0, blue: 151/255.0, alpha: 1).cgColor
        self.productImageView.backgroundColor = .red
        
        self.productNameLabel.textColor = UIColor(red: 82/255.0, green: 66/255.0, blue: 64/255.0, alpha: 1)
        self.productNameLabel.font = UIFont(name: "Georgia", size: 14)
        self.productNameLabel.numberOfLines = 1
        self.productNameLabel.text = "Red Velvet Cupcake"

        self.productPriceLabel.textColor = UIColor(red: 82/255.0, green: 66/255.0, blue: 64/255.0, alpha: 1)
        self.productPriceLabel.font = UIFont(name: "LuxiMono", size: 12)
        self.productPriceLabel.numberOfLines = 1
        self.productPriceLabel.text = "$120"
        
        self.addToCartButton.backgroundColor = UIColor(red: 4/255.0, green: 107/255.0, blue: 149/255.0, alpha: 1)
        self.addToCartButton.layer.cornerRadius = 2
        self.addToCartButton.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3).cgColor
        self.addToCartButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.addToCartButton.layer.shadowRadius = 2
        self.addToCartButton.setTitleColor(.white, for: .normal)
        self.addToCartButton.setTitle("Add to Cart", for: .normal)
        self.addToCartButton.titleLabel?.font = UIFont(name: ".SFUIText-Semibold", size: 16)

    }
    
    func setConstraints() {
        
        self.productImageView.translatesAutoresizingMaskIntoConstraints = false
        self.productNameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.productPriceLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addToCartButton.translatesAutoresizingMaskIntoConstraints = false
        
        let productImageViewTop = NSLayoutConstraint(item: self.productImageView, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 20)
        let productImageViewLeft = NSLayoutConstraint(item: self.productImageView, attribute: .left, relatedBy: .equal, toItem: self.contentView, attribute: .left, multiplier: 1, constant: 20)
        let productImageViewWidth = NSLayoutConstraint(item: self.productImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 80)
        let productImageViewHeight = NSLayoutConstraint(item: self.productImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 68)
        
        let productNameLabelTop = NSLayoutConstraint(item: self.productNameLabel, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 20)
        let productNameLabelLeft = NSLayoutConstraint(item: self.productNameLabel, attribute: .left, relatedBy: .equal, toItem: self.productImageView, attribute: .right, multiplier: 1, constant: 10)
        
        let productPriceLabelLeft = NSLayoutConstraint(item: self.productPriceLabel, attribute: .left, relatedBy: .equal, toItem: self.productImageView, attribute: .right, multiplier: 1, constant: 10)
        let productPriceLabelBottom = NSLayoutConstraint(item: self.productPriceLabel, attribute: .bottom, relatedBy: .equal, toItem: self.productImageView, attribute: .bottom, multiplier: 1, constant: 0)
        
        let addToCartButtonWidth = NSLayoutConstraint(item: self.addToCartButton, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 115)
        let addToCartButtonHeight = NSLayoutConstraint(item: self.addToCartButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 30)
        let addToCartButtonRight = NSLayoutConstraint(item: self.addToCartButton, attribute: .right, relatedBy: .equal, toItem: self.contentView, attribute: .right, multiplier: 1, constant: -20)
        let addToCartButtonBottom = NSLayoutConstraint(item: self.addToCartButton, attribute: .bottom, relatedBy: .equal, toItem: self.productImageView, attribute: .bottom, multiplier: 1, constant: 0)
        
        self.contentView.addConstraints([productImageViewTop, productImageViewLeft, productImageViewWidth, productImageViewHeight])
        self.contentView.addConstraints([productNameLabelTop, productNameLabelLeft])
        self.contentView.addConstraints([productPriceLabelLeft, productPriceLabelBottom])
        self.contentView.addConstraints([addToCartButtonRight, addToCartButtonWidth, addToCartButtonBottom, addToCartButtonHeight])
        
    }

}
