//
//  ProductCollectionViewNavigationController.swift
//  Pâtissier
//
//  Created by 劉仲軒 on 2017/6/18.
//  Copyright © 2017年 劉仲軒. All rights reserved.
//

import UIKit

class ProductCollectionViewNavigationController: BaseNavigationController {

    init() {
        super.init(rootViewController: ProductCollectionViewController(collectionViewLayout: ProductCollectionViewController.configLayout()))
    }
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)

    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setUp() {
        let productVC = ProductCollectionViewController(collectionViewLayout: ProductCollectionViewController.configLayout())
        self.viewControllers = [productVC]
    }

}
