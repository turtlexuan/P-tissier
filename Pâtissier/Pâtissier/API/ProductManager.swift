//
//  ProductManager.swift
//  Pâtissier
//
//  Created by 劉仲軒 on 2017/6/17.
//  Copyright © 2017年 劉仲軒. All rights reserved.
//

import Foundation
import Alamofire

class ProductManager {
    
    static let shared = ProductManager()
    var productArray: [Product] = []
    var productPageParam: String? = ""
    
    typealias SignInResult = (_ token_type: String?, _ token: String?, _ error: Error?) -> Void
    
    func signInWithFacebook(accessToken: String, completionHandler: @escaping SignInResult) {
        
        guard let url = URL(string: "\(Constants.URLString.server)\(Constants.URLString.login)") else { return }
        
        print(accessToken)
        
        let param = ["access_token" : accessToken]
        let headers = ["Content-Type": "application/json"]
        
        Alamofire.request(url, method: .post, parameters: param, encoding: JSONEncoding.prettyPrinted, headers: headers).responseJSON { (response) in
            
            if let error = response.error {
                print(error)
                
                completionHandler(nil, nil, error)
                
                return
            }
            
            guard
                let jsonData = response.result.value as? [String: Any],
                let data = jsonData["data"] as? [String: Any],
                let tokenType = data["token_type"] as? String,
                let token = data["token"] as? String else { return }
            
            UserDefaults.standard.set(tokenType, forKey: Constants.URLReturnData.tokenType)
            UserDefaults.standard.set(token, forKey: Constants.URLReturnData.token)
            
            completionHandler(tokenType, token, nil)
        }
    }
    
    typealias GetProductResult = (_ products: [Product]?, _ error: Error?) -> Void
    
    func getProducts(completionHandler: @escaping GetProductResult) {
        
        guard let url = URL(string: "\(Constants.URLString.server)\(Constants.URLString.product)") else { return }
        guard let token = UserDefaults.standard.value(forKey: Constants.URLReturnData.token) as? String else { return }
        
        let authString = "Bearer \(token)"
        let headers = ["Authorization": authString]
        
        Alamofire.request(url, method: .get, parameters: [:], headers: headers).responseJSON { (response) in
           
            if let error = response.error {
                print(error)
                
                completionHandler(nil, error)
                
                return
            }
 
            guard
                let jsonData = response.result.value as? [String: Any],
                let data = jsonData["data"] as? [[String: Any]] else { return }
            
            if let paging = jsonData["paging"] as? [String: Any] {
                
                if let nextPage = paging["next"] as? String {
                    
                    self.productPageParam = nextPage
                    
                } else {
                    
                    self.productPageParam = nil
                }
                
            }
            
            for item in data {
                
                guard let name = item["name"] as? String, let id = item["id"] as? String, let price = item["price"] as? Double else { return }
                
                let product = Product(name: name, id: id, price: price)
                
                self.productArray.append(product)
                
            }

            completionHandler(self.productArray, nil)
            
        }
        
    }
    
    func getProductDetail() {
        
        
        
        
    }
    
}
