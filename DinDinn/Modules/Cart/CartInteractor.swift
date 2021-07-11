//
//  CartInteractor.swift
//  DinDinn
//
//  Created by test on 08/07/21.
//

import Foundation
import RxSwift

final class CartInteractor {
    private let cartRepositoty: CartRepositoryInterface
    
    init(cartRepositoty: CartRepositoryInterface) {
        self.cartRepositoty = cartRepositoty
    }
}

extension CartInteractor: CartInteractorInterface {
    
    func getCartItems() -> Observable<[CartItem]> {
        return cartRepositoty.getItems().map { (dishes) -> [CartItem] in
            Dictionary(grouping: dishes) { $0.id }
                .map {  CartItem(dish: $1[0], count: $1.count) }
        }
    }
    
}
