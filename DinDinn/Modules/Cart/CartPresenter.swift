//
//  CartPresenter.swift
//  DinDinn
//
//  Created by test on 08/07/21.
//

import Foundation
import RxSwift
import RxCocoa

final class CartPresenter {

    private unowned let view: CartViewInterface
    private let formatter: CartFormatterInterface
    private let interactor: CartInteractorInterface
    private let wireframe: CartWireframeInterface


    init(view: CartViewInterface, formatter: CartFormatterInterface, interactor: CartInteractorInterface, wireframe: CartWireframeInterface) {
        self.view = view
        self.formatter = formatter
        self.interactor = interactor
        self.wireframe = wireframe
    }
}


extension CartPresenter: CartPresenterInterface {

    func configure(with output: Cart.ViewOutput) -> Cart.ViewInput {

        let formatterInput = Cart.FormatterInput()

        let formatterOutput = formatter.format(for: formatterInput)

        _ = output.checkoutTapped
            .subscribe(onNext: {
                print("DEBUG: checkoutTapped")
            })
        _ = output.deleteCartItemTapped
            .subscribe(onNext: { item in
                print("DEBUG: deleteCartItemTapped with item \(item.id)")
            })
//        _ = output.incrementCartItemTapped
//            .subscribe(onNext: { item in
//                print("DEBUG: incrementCartItemTapped with item \(item.id)")
//            })
//        _ = output.decrementCartItemTapped
//            .subscribe(onNext: { item in
//                print("DEBUG: decrementCartItemTapped with item \(item.id)")
//            })
        
        return Cart.ViewInput(models: formatterOutput, cartItems: interactor.getCartItems().asDriver(onErrorJustReturn: []))
    }

}
