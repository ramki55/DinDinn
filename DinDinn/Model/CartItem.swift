//
//  CartItem.swift
//  DinDinn
//
//  Created by test on 06/07/21.
//

import Foundation

struct CartItem {
    
    var id : String {
        return dish.id
    }
    
    var dish: Dish!
    
    var count: Int!
    
}
