//
//  BaseNavigationController.swift
//  Pâtissier
//
//  Created by 劉仲軒 on 2017/6/18.
//  Copyright © 2017年 劉仲軒. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.navigationBar.bounds.height + 20)
        gradientLayer.colors = [UIColor(red: 3/255.0, green: 63/255.0, blue: 122/255.0, alpha: 1).cgColor, UIColor(red: 4/255.0, green: 107/255.0, blue: 149/255.0, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        self.navigationBar.setBackgroundImage(image, for: .default)
        
        self.navigationBar.layer.shadowColor = UIColor(red: 53/255.0, green: 184/255.0, blue: 208/255.0, alpha: 0.85).cgColor
        self.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.navigationBar.layer.shadowRadius = 4
        self.navigationBar.layer.shadowOpacity = 1
        
        let shadow = NSShadow()
        shadow.shadowOffset = CGSize(width: 0, height: 1)
        shadow.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        shadow.shadowBlurRadius = 2
        
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.shadow: shadow, NSAttributedStringKey.font: UIFont(name: "Georgia-Bold", size: 18) ?? ""]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
