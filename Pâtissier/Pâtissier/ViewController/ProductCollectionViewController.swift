//
//  ProductCollectionViewController.swift
//  Pâtissier
//
//  Created by 劉仲軒 on 2017/6/17.
//  Copyright © 2017年 劉仲軒. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import Kingfisher

private let reuseIdentifier = "Cell"

class ProductCollectionViewController: BaseCollectionViewController {
    
    var products: [Product] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Pâtissier"
        
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: ProductCollectionViewController.configLayout())
        self.collectionView?.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
//        self.collectionView?.backgroundColor = UIColor(red: 250/255.0, green: 250/255.0, blue: 250/255.0, alpha: 1)

        ProductManager.shared.signInWithFacebook(accessToken: FBSDKAccessToken.current().tokenString) { (_, _, error) in

            if error != nil {
                return
            }
            
            ProductManager.shared.getProducts(completionHandler: { (products, error) in
                
                if error != nil {
                    
                    print(error ?? "")
                    
                    return
                    
                }
                
                self.products = products!
                
                print(products ?? "")
                print(error ?? "")
                
                self.collectionView?.reloadData()
                
            })
        }

    }
    
    static func configLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        layout.minimumLineSpacing = 20
        layout.itemSize.width = (UIScreen.main.bounds.width - 60) / 2
        layout.itemSize.height = layout.itemSize.width * (160 / 154)
        return layout
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.products.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductCollectionViewCell
        
        print(self.view.frame.width)
    
        cell.productTitleLabel.text = self.products[indexPath.row].name
        cell.dollarLabel.text = "$\(self.products[indexPath.row].price)"
        
        let imageUrlString = "\(Constants.URLString.imageHost)\(Constants.URLString.product)/\(self.products[indexPath.row].id)\(Constants.URLString.jpg)"
        let imageUrl = URL(string: imageUrlString)
        
        print(imageUrlString)
        
        cell.productImageView.kf.setImage(with: imageUrl)
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let productDetailVC = ProductDetailTableViewController()
        
        productDetailVC.productID = self.products[indexPath.row].id
        
        self.navigationController?.pushViewController(productDetailVC, animated: true)
        
    }
    
}
