//
//  CardRepositoryInterface.swift
//  DinDinn
//
//  Created by test on 06/07/21.
//

import RxSwift
import RxRelay

protocol CartRepositoryInterface {
    func add(dish: Dish)
    func remove(dish: Dish)
    func getItems() -> BehaviorRelay<[Dish]>
}
