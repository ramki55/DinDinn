//
//  HomeInterface.swift
//  DinDinn
//
//  Created by test on 06/07/21.
//

import RxSwift
import RxCocoa

enum HomeNavigationOption {
    case cart
}

protocol HomeWireframeInterface: WireframeInterface {
    func navigate(to screen: HomeNavigationOption)
}

protocol HomeViewInterface: ViewInterface {
}

protocol HomePresenterInterface: PresenterInterface {
    func configure(with output: Home.ViewOutput) -> Home.ViewInput
}

protocol HomeFormatterInterface: FormatterInterface {
    func format(for input: Home.FormatterInput) -> Home.FormatterOutput
}

protocol HomeInteractorInterface: InteractorInterface {
    func getMenu() -> Single<Menu>
    func addToCart(dish: Dish)
    func removeFromCart(dish: Dish)
    func getCartItems () -> Observable<[Dish]>
}

enum Home {

    struct ViewOutput {
        let openCartTapped: Observable<Void>
        let addToCartTapped: PublishSubject<Dish>
    }

    struct ViewInput {
        let models: FormatterOutput
        let categories: Driver<[Category]>
        let cartItemsCount: Driver<String>
    }

    struct FormatterInput {
    }

    struct FormatterOutput {
    }

}
