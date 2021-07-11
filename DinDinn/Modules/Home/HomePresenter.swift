//
//  HomePresenter.swift
//  DinDinn
//
//  Created by test on 06/07/21.
//

import Foundation
import RxSwift
import RxCocoa

final class HomePresenter {

    private unowned let view: HomeViewInterface
    private let formatter: HomeFormatterInterface
    private let interactor: HomeInteractorInterface
    private let wireframe: HomeWireframeInterface

    init(view: HomeViewInterface, formatter: HomeFormatterInterface, interactor: HomeInteractorInterface, wireframe: HomeWireframeInterface) {
        self.view = view
        self.formatter = formatter
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension HomePresenter: HomePresenterInterface {

    func configure(with output: Home.ViewOutput) -> Home.ViewInput {

        let formatterInput = Home.FormatterInput()

        let formatterOutput = formatter.format(for: formatterInput)
        
        _ = output.openCartTapped
            .subscribe(onNext: { [weak self] in
                self?.handleOpenCartTap()
            })
        
        _ = output.addToCartTapped
            .subscribe(onNext: { [weak self] dish in
                self?.handleAddToCart(dish: dish)
            })
        
        return Home.ViewInput(models: formatterOutput,
                              categories: getCategories(),
                              cartItemsCount: getCartItemsCount())
    }
    
    func handleAddToCart(dish: Dish) {
        print("DEBUG: handleAddToCart \(dish.id)")
        interactor.addToCart(dish: dish)
    }
    
    func handleRemoveFromCart(dish: Dish) {
        interactor.removeFromCart(dish: dish)
    }
    
    func getCartItemsCount () -> Driver<String> {
        return interactor.getCartItems()
                .map { "\($0.count)" }
                .asDriver(onErrorDriveWith: .never())

    }
    
    func handleOpenCartTap() {
        wireframe.navigate(to: .cart)
    }
    
    func getCategories () -> Driver<[Category]> {
        return interactor.getMenu().asObservable()
            .map { $0.categories ?? [] }
            .observeOn(MainScheduler.instance)
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .asDriver(onErrorDriveWith: .never())
    }

}
