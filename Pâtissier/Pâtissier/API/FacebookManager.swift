//
//  FacebookManager.swift
//  Pâtissier
//
//  Created by 劉仲軒 on 2017/6/15.
//  Copyright © 2017年 劉仲軒. All rights reserved.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit

class FacebookManager {
    
    static let shared = FacebookManager()
    
    typealias fetchResultHandler = (Bool) -> Void
    
    func facebookLogin(from viewController: UIViewController, completionHandler: @escaping fetchResultHandler) {
        
        let loginManager = FBSDKLoginManager()
        
        loginManager.logIn(withReadPermissions: [Constants.FBLogin.publicProfile, Constants.FBLogin.email], from: viewController) { (result, error) in
            
            if error != nil {
                
                print("Error: \(String(describing: error))" )
                
                return
            }
            
            guard let token = result?.token.tokenString else { return }
            
            UserDefaults.standard.set(token, forKey: Constants.FBLogin.accessToken)
            
            self.fetchProfile(completionHandler: { (bool) in
                completionHandler(bool)
            })
            
        }
        
    }
    
    private func fetchProfile(completionHandler: @escaping fetchResultHandler) {
        let userDefault = UserDefaults.standard
        let parameter = ["fields": "name, picture.type(large), link, email, cover.type(large)"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameter).start { (_, result, error) in
            
            if error != nil {
                print(error ?? "")
                
                completionHandler(false)
                
                return
            }
            
            guard let results = result as? [String: Any] else {
                return
            }
            
            if let name = results["name"] as? String {
                print(name)
                userDefault.set(name, forKey: Constants.FBLogin.name)
            }
            
            if let link = results["link"] as? String {
                print(link)
                userDefault.set(link, forKey: Constants.FBLogin.link)
            }
            
            if let email = results["email"] as? String {
                print(email)
                userDefault.set(email, forKey: Constants.FBLogin.email)
            }
            
            if let picture = results["picture"] as? NSDictionary, let data = picture["data"] as? NSDictionary, let url = data["url"] as? String {
                print(url)
                userDefault.set(url, forKey: Constants.FBLogin.picture)
            }
            
            if let cover = results["cover"] as? NSDictionary, let source = cover["source"] as? String {
                print(source)
                userDefault.set(source, forKey: Constants.FBLogin.cover)
            }

            completionHandler(true)
            
        }
        
    }
    
    
    
    
}













