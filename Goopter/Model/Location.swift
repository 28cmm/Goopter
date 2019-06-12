//
//  Location.swift
//  Goopter
//
//  Created by Yilei Huang on 2019-06-07.
//  Copyright © 2019 Joshua Fang. All rights reserved.
//

import Foundation

struct Location{
    var name:String?
    
    init(dictionary:[String:Any]) {
        self.name = dictionary["name"] as? String
    }
}
