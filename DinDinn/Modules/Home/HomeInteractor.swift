//
//  HomeInteractor.swift
//  DinDinn
//
//  Created by test on 06/07/21.
//

import Foundation
import RxSwift

final class HomeInteractor {
    private let menuRepositoty: MenuRepositoryInterface
    private let cartRepositoty: CartRepositoryInterface

    init(menuRepository: MenuRepositoryInterface, cartRepositoty: CartRepositoryInterface) {
        self.menuRepositoty = menuRepository
        self.cartRepositoty = cartRepositoty
    }
}

// MARK: - Extensions -

extension HomeInteractor: HomeInteractorInterface {

    func getMenu() -> Single<Menu> {
        return menuRepositoty.getMenu(restaurentId: "qwerty")
    }
    
    func addToCart(dish: Dish) {
        return cartRepositoty.add(dish: dish)
    }
    
    func removeFromCart(dish: Dish) {
        return cartRepositoty.remove(dish: dish)
    }
    
    func getCartItems() -> Observable<[Dish]> {
        return cartRepositoty.getItems().asObservable()
    }
    
}
