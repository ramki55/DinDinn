//
//  HomeWireFrame.swift
//  DinDinn
//
//  Created by test on 06/07/21.
//

import Foundation
import RxSwift
import RxCocoa

final class HomeWireframe: BaseWireframe {

    private let storyboard = UIStoryboard(name: "Home", bundle: nil)

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: HomeViewController.self)
        super.init(viewController: moduleViewController)

        let formatter = HomeFormatter()
        let interactor = HomeInteractor(menuRepository: StubMenuRepository(),
                                        cartRepositoty: MemCartRepository())
        let presenter = HomePresenter(view: moduleViewController, formatter: formatter, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

extension HomeWireframe: HomeWireframeInterface {
    func navigate(to screen: HomeNavigationOption) {
        let cartWireframe = CartWireframe()
//        cartWireframe.viewController.modalPresentationStyle = .popover
//        viewController.presentWireframe(cartWireframe, animated: true, completion: nil)
        let nav = UINavigationController(rootViewController: cartWireframe.viewController)
        nav.modalPresentationStyle = .fullScreen
        viewController.present(nav, animated: true)
    }
}
