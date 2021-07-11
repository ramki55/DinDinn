//
//  DishDetailViewController.swift
//  DinDinn
//
//  Created by test on 07/07/21.
//

import UIKit
import RxSwift
import RxCocoa

final class DishDetailViewController: UIViewController {

    var presenter: DishDetailPresenterInterface!

    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

}

extension DishDetailViewController: DishDetailViewInterface {
}

private extension DishDetailViewController {

    func setupView() {
        let output = DishDetail.ViewOutput()

        let input = presenter.configure(with: output)
    }

}
