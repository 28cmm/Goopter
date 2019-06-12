//
//  Button.swift
//  Goopter
//
//  Created by Yilei Huang on 2019-06-07.
//  Copyright © 2019 Joshua Fang. All rights reserved.
//

import Foundation
import UIKit

struct Button {
    var name: String?
    var imgUrl : String?
    var cid : Int?
    var seq:Int?
    
    init(dictionary:[String:Any]) {
        self.name = dictionary["name"] as? String
        self.imgUrl = dictionary["img"] as? String
        self.cid = dictionary["cid"] as? Int
        self.seq = dictionary["seq"] as? Int
    }
}
