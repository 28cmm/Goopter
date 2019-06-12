//
//  Product.swift
//  Goopter
//
//  Created by Yilei Huang on 2019-06-07.
//  Copyright © 2019 Joshua Fang. All rights reserved.
//

import Foundation
import UIKit

struct Product {
    var name: String?
    var rating:Int?
    var city:String?
    var location:String?
    var width:Int?
    
    init(dictionary:[String:Any]) {
        self.name = dictionary["name"] as? String
        self.rating = dictionary["rating"] as? Int  
        self.city = dictionary["city"] as? String
        self.location = dictionary["address"] as? String
        self.width = dictionary["width"] as? Int
    }
}
