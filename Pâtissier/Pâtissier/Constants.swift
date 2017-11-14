//
//  Constants.swift
//  Pâtissier
//
//  Created by 劉仲軒 on 2017/6/15.
//  Copyright © 2017年 劉仲軒. All rights reserved.
//

import Foundation

struct Constants {
    
    struct FBLogin {
        static let publicProfile    = "public_profile"
        static let email            = "email"
        static let name             = "name"
        static let link             = "link"
        static let picture          = "picture"
        static let cover            = "cover"
        static let accessToken      = "fbAccessToken"
    }
    
    struct HTTPRequest {
        static let post             = "POST"
        static let get              = "GET"
    }
    
    struct URLString {
        static let server           = "http://52.198.40.72/patissier/api/v1"
        static let imageHost        = "http://52.198.40.72/patissier"
        static let login            = "/sign_in/facebook"
        static let product          = "/products"
        static let comment          = "/comments"
        static let jpg              = "/preview.jpg"
    }
    
    struct URLReturnData {
        static let signInReturn     = "signInWithFacebookData"
        static let tokenType        = "token_type"
        static let token            = "token"
    }
}
