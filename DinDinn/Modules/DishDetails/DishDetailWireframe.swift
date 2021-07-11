//
//  DishDetailWireframe.swift
//  DinDinn
//
//  Created by test on 07/07/21.
//

import UIKit
import RxSwift
import RxCocoa

final class DishDetailWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "DishDetail", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: DishDetailViewController.self)
        super.init(viewController: moduleViewController)

        let formatter = DishDetailFormatter()
        let interactor = DishDetailInteractor()
        let presenter = DishDetailPresenter(view: moduleViewController, formatter: formatter, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension DishDetailWireframe: DishDetailWireframeInterface {
}
