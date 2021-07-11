//
//  Category+ObjectMapper.swift
//  DinDinn
//
//  Created by test on 06/07/21.
//

import ObjectMapper

extension Category: Mappable {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        id          <- map["id"]
        name        <- map["name"]
        image       <- map["image"]
        dishes      <- map["dishes"]
    }
}
