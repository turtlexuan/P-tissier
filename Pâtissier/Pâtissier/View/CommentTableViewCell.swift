//
//  CommentTableViewCell.swift
//  Pâtissier
//
//  Created by 劉仲軒 on 2017/6/20.
//  Copyright © 2017年 劉仲軒. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    var userImageView = UIImageView()
    var usernameLabel = UILabel()
    var commentsLabel = UILabel()
    var separationLine = UIView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(userImageView)
        self.contentView.addSubview(usernameLabel)
        self.contentView.addSubview(commentsLabel)
        self.contentView.addSubview(separationLine)
        
        self.setUp()
        self.setConstraints()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        

        
        print(self.contentView.frame.maxX)
        print(self.commentsLabel.frame.maxX)
        print(self.separationLine.frame.maxX)

    }

    func setUp() {
        
//        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
        self.userImageView.layer.cornerRadius = 20
        self.userImageView.backgroundColor = .red
        self.userImageView.layer.masksToBounds = true
        
        self.usernameLabel.textColor = UIColor(red: 82/255.0, green: 66/255.0, blue: 64/255.0, alpha: 1)
        self.usernameLabel.font = UIFont(name: ".SFUIText-Bold", size: 12)
        self.usernameLabel.numberOfLines = 1
        self.usernameLabel.text = "Carolyn Simmons"
        
        self.commentsLabel.textColor = UIColor(red: 82/255.0, green: 66/255.0, blue: 64/255.0, alpha: 1)
        self.commentsLabel.font = UIFont(name: ".SFUIText", size: 12)
        self.commentsLabel.numberOfLines = 0
        self.commentsLabel.text = "Nullam id dolor id nibh ultricies vehicula ut id elit. Maecenas sed diam eget risus varius blandit sit amet non magna. Praesent commodo cursus magna, vel scelerisque nisl."
        self.commentsLabel.lineBreakMode = .byWordWrapping

        self.separationLine.backgroundColor = UIColor(red: 165/255.0, green: 170/255.0, blue: 178/255.0, alpha: 1)
        
    }
    
    func setConstraints() {
        
        print(self.separationLine.superview)
        
        self.userImageView.translatesAutoresizingMaskIntoConstraints = false
        self.usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.commentsLabel.translatesAutoresizingMaskIntoConstraints = false
        self.separationLine.translatesAutoresizingMaskIntoConstraints = false
        
        let userImageViewTop = NSLayoutConstraint(item: self.userImageView, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 20)
        let userImageViewLeft = NSLayoutConstraint(item: self.userImageView, attribute: .left, relatedBy: .equal, toItem: self.contentView, attribute: .left, multiplier: 1, constant: 20)
        let userImageViewWidth = NSLayoutConstraint(item: self.userImageView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 40)
        let userImageViewHeight = NSLayoutConstraint(item: self.userImageView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 40)
        
        let usernameLabelTop = NSLayoutConstraint(item: self.usernameLabel, attribute: .top, relatedBy: .equal, toItem: self.contentView, attribute: .top, multiplier: 1, constant: 20)
        let usernameLabelLeft = NSLayoutConstraint(item: self.usernameLabel, attribute: .left, relatedBy: .equal, toItem: self.userImageView, attribute: .right, multiplier: 1, constant: 20)
        let usernameLabelHeight = NSLayoutConstraint(item: self.usernameLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 14)
        
        let commentsLabelTop = NSLayoutConstraint(item: self.commentsLabel, attribute: .top, relatedBy: .equal, toItem: self.usernameLabel, attribute: .bottom, multiplier: 1, constant: 8)
        let commentsLabelLeft = NSLayoutConstraint(item: self.commentsLabel, attribute: .left, relatedBy: .equal, toItem: self.userImageView, attribute: .right, multiplier: 1, constant: 20)
        let commentsLabelRight = NSLayoutConstraint(item: self.commentsLabel, attribute: .right, relatedBy: .equal, toItem: self.contentView, attribute: .right, multiplier: 1, constant: -20)
        
        let separationLineTop = NSLayoutConstraint(item: self.separationLine, attribute: .top, relatedBy: .equal, toItem: self.commentsLabel, attribute: .bottom, multiplier: 1, constant: 20)
        let separationLineBottom = NSLayoutConstraint(item: self.separationLine, attribute: .bottom, relatedBy: .equal, toItem: self.contentView, attribute: .bottom, multiplier: 1, constant: 0)
        let separationLineLeft = NSLayoutConstraint(item: self.separationLine, attribute: .left, relatedBy: .equal, toItem: self.contentView, attribute: .left, multiplier: 1, constant: 20)
        let separationLineRight = NSLayoutConstraint(item: self.separationLine, attribute: .right, relatedBy: .equal, toItem: self.contentView, attribute: .right, multiplier: 1, constant: -20)
        let separationLineHeight = NSLayoutConstraint(item: self.separationLine, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 1)
        
        self.contentView.addConstraints([userImageViewTop, userImageViewLeft, userImageViewWidth, userImageViewHeight])
        self.contentView.addConstraints([usernameLabelTop, usernameLabelLeft, usernameLabelHeight])
        self.contentView.addConstraints([commentsLabelTop, commentsLabelLeft, commentsLabelRight])
        self.contentView.addConstraints([separationLineTop, separationLineLeft, separationLineRight, separationLineBottom, separationLineHeight])
        
    }
    
    
}
