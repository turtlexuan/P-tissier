//
//  LoginViewController.swift
//  Pâtissier
//
//  Created by 劉仲軒 on 2017/6/15.
//  Copyright © 2017年 劉仲軒. All rights reserved.
//

import UIKit
import FBSDKCoreKit

class LoginViewController: UIViewController {
    
    var titleLabel = UILabel()
    var loginButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.setUpView()
        self.setConstraints()
        
        self.loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        
        print(titleLabel)
    }
    
    func setUpView() {
        
        let backgroundImageView = UIImageView()
        backgroundImageView.frame = self.view.frame
        backgroundImageView.image = #imageLiteral(resourceName: "image-landing")
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.frame
        gradientLayer.colors = [UIColor(red: 3/255.0, green: 63/255.0, blue: 122/255.0, alpha: 0.8).cgColor, UIColor(red: 4/255.0, green: 107/255.0, blue: 149/255.0, alpha: 0.8).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        backgroundImageView.layer.insertSublayer(gradientLayer, at: 0)
        self.view.addSubview(backgroundImageView)
        
        self.titleLabel.frame.size = CGSize(width: 220, height: 160)
        self.titleLabel.text = "Pâtissier"
        self.titleLabel.textColor = .white
        self.titleLabel.font = UIFont(name: "Georgia-Bold", size: 50)
        self.titleLabel.textAlignment = .center
        self.titleLabel.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.titleLabel.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5).cgColor
        self.titleLabel.layer.shadowRadius = 2
        self.titleLabel.layer.shadowOpacity = 1
        
        self.view.addSubview(self.titleLabel)
        
        self.loginButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.loginButton.backgroundColor = UIColor(red: 1, green: 53/255.0, blue: 71/255.0, alpha: 1)
        self.loginButton.setTitle("Sign In with Facebook", for: .normal)
        self.loginButton.titleLabel?.textAlignment = .center
        self.loginButton.titleLabel?.font = UIFont(name: ".SFUIText-Semibold", size: 16)
        self.loginButton.layer.cornerRadius = 2
        self.loginButton.layer.shadowOpacity = 1
        self.loginButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.loginButton.layer.shadowRadius = 10
        self.loginButton.layer.shadowColor = UIColor(red: 3/255.0, green: 63/255.0, blue: 122/255.0, alpha: 1).cgColor
        
        self.view.addSubview(self.loginButton)
    }

    func setConstraints() {
        
        self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        let titleLabelCenterX = NSLayoutConstraint(item: self.titleLabel, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0)
        let titleLabelTop = NSLayoutConstraint(item: self.titleLabel, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1, constant: 110)
        let titleLabelWidth = NSLayoutConstraint(item: self.titleLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1, constant: 300)
        
        let loginButtonLeft = NSLayoutConstraint(item: self.loginButton, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 86)
        let loginButtonRight = NSLayoutConstraint(item: self.loginButton, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: -86)
        let loginButtonHeight = NSLayoutConstraint(item: self.loginButton, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 44)
        let loginButtonBottom = NSLayoutConstraint(item: self.loginButton, attribute: .bottom, relatedBy: .equal, toItem: self.view, attribute: .bottom, multiplier: 1, constant: -100)
        
        self.view.addConstraints([titleLabelCenterX, titleLabelTop, titleLabelWidth])
        self.view.addConstraints([loginButtonLeft, loginButtonRight, loginButtonHeight, loginButtonBottom])
    }

    @objc func loginAction() {
        
        FacebookManager.shared.facebookLogin(from: self) { (bool) in
            
            if bool == true {
                
                self.nextVC()
                
            }
            
        }
        
    }
    
    func nextVC() {
        
        let tabbarController = TabBarController()
        
        UIApplication.shared.keyWindow?.rootViewController = tabbarController
        
    }
    
}
