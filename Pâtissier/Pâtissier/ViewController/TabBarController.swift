//
//  TabBarController.swift
//  Pâtissier
//
//  Created by 劉仲軒 on 2017/6/19.
//  Copyright © 2017年 劉仲軒. All rights reserved.
//

import UIKit

class TabBarController: BaseTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.tabBar.tintColor = UIColor(red: 53/255.0, green: 184/255.0, blue: 208/255.0, alpha: 1)
        self.tabBar.unselectedItemTintColor = UIColor(red: 165/255.0, green: 170/255.0, blue: 178/255.0, alpha: 1)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let productVC = ProductCollectionViewController(collectionViewLayout: ProductCollectionViewController.configLayout())
        
        let storeTab = ProductCollectionViewNavigationController(rootViewController: productVC)
        let storeIcon = UITabBarItem(title: "Store", image: #imageLiteral(resourceName: "icon-store").withRenderingMode(.alwaysTemplate), selectedImage: nil)
        storeTab.tabBarItem = storeIcon
        
        self.viewControllers = [storeTab]
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
