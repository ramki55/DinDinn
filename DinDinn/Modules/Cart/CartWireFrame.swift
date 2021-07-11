//
//  CartWireFrame.swift
//  DinDinn
//
//  Created by test on 08/07/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class CartWireframe: BaseWireframe {

    private let storyboard = UIStoryboard(name: "Cart", bundle: nil)


    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: CartViewController.self)
        super.init(viewController: moduleViewController)

        let formatter = CartFormatter()
        let interactor = CartInteractor(cartRepositoty: MemCartRepository())
        let presenter = CartPresenter(view: moduleViewController, formatter: formatter, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

extension CartWireframe: CartWireframeInterface {
}
