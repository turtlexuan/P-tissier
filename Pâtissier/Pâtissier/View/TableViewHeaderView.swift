//
//  TableViewHeaderView.swift
//  Pâtissier
//
//  Created by 劉仲軒 on 2017/6/23.
//  Copyright © 2017年 劉仲軒. All rights reserved.
//

import UIKit

class TableViewHeaderView: UIView {
    
    var titleLabel = UILabel()
    var blackView = UIView()
    var whiteView = UIView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(blackView)
        self.addSubview(whiteView)
        self.addSubview(titleLabel)
        
        self.setUp()
        self.setConstraint()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp() {
        
        self.blackView.backgroundColor = UIColor(red: 82/255.0, green: 66/255.0, blue: 64/255.0, alpha: 1)
        
        self.whiteView.backgroundColor = .white
        self.whiteView.layer.shadowColor = UIColor(red: 82/255.0, green: 66/255.0, blue: 64/255.0, alpha: 1).cgColor
        self.whiteView.layer.shadowOffset = CGSize(width: 0, height: 0.5)
        self.whiteView.layer.shadowRadius = 0.5
        self.whiteView.layer.shadowOpacity = 1
        
        self.titleLabel.backgroundColor = .white
        self.titleLabel.textAlignment = .center
        self.titleLabel.font = UIFont(name: "Georgia", size: 16)
        self.titleLabel.textColor = UIColor(red: 82/255.0, green: 66/255.0, blue: 64/255.0, alpha: 1)
        
    }
    
    func setConstraint() {
        
        self.blackView.translatesAutoresizingMaskIntoConstraints = false
        self.whiteView.translatesAutoresizingMaskIntoConstraints = false
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let blackViewLeft = NSLayoutConstraint(item: self.blackView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 20)
        let blackViewRight = NSLayoutConstraint(item: self.blackView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -20)
        let blackViewBottom = NSLayoutConstraint(item: self.blackView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -5)
        let blackViewHeight = NSLayoutConstraint(item: self.blackView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 3)
        
        let whiteViewLeft = NSLayoutConstraint(item: self.whiteView, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 20)
        let whiteViewRight = NSLayoutConstraint(item: self.whiteView, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1, constant: -20)
        let whiteViewCenterY = NSLayoutConstraint(item: self.whiteView, attribute: .centerY, relatedBy: .equal, toItem: self.blackView, attribute: .centerY, multiplier: 1, constant: -0.2)
        let whiteViewHeight = NSLayoutConstraint(item: self.whiteView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 1)
        
        let titleLabelLeft = NSLayoutConstraint(item: self.titleLabel, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1, constant: 75)
        let titleLabelTop = NSLayoutConstraint(item: self.titleLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0)
        let titleLabelWidth = NSLayoutConstraint(item: self.titleLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 100)
        let titleLabelHeight = NSLayoutConstraint(item: self.titleLabel, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0)
        
        self.addConstraints([blackViewLeft, blackViewRight, blackViewBottom, blackViewHeight])
        self.addConstraints([whiteViewLeft, whiteViewRight, whiteViewHeight, whiteViewCenterY])
        self.addConstraints([titleLabelTop, titleLabelLeft, titleLabelWidth, titleLabelHeight])
        
    }
    
}
