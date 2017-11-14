//
//  Product.swift
//  Pâtissier
//
//  Created by 劉仲軒 on 2017/6/17.
//  Copyright © 2017年 劉仲軒. All rights reserved.
//

import Foundation

struct Product {
    
    let name: String
    let id: String
    let price: Double
    
    init(name: String, id: String, price: Double) {
        
        self.name = name
        self.id = id
        self.price = price
        
    }
    
}
