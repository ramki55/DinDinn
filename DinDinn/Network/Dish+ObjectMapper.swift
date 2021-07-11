//
//  Dish+ObjectMapper.swift
//  DinDinn
//
//  Created by test on 06/07/21.
//

import ObjectMapper

extension Dish: Mappable {
    init?(map: Map) {
        self.init()
    }
    
    mutating func mapping(map: Map) {
        id              <- map["id"]
        name            <- map["name"]
        image           <- map["image"]
        price           <- map["price"]
        description     <- map["description"]
    }
}
