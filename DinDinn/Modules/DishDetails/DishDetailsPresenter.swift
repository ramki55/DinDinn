//
//  DishDetailsPresenter.swift
//  DinDinn
//
//  Created by test on 07/07/21.
//

import Foundation
import RxSwift
import RxCocoa

final class DishDetailPresenter {

    private unowned let view: DishDetailViewInterface
    private let formatter: DishDetailFormatterInterface
    private let interactor: DishDetailInteractorInterface
    private let wireframe: DishDetailWireframeInterface

    init(view: DishDetailViewInterface, formatter: DishDetailFormatterInterface, interactor: DishDetailInteractorInterface, wireframe: DishDetailWireframeInterface) {
        self.view = view
        self.formatter = formatter
        self.interactor = interactor
        self.wireframe = wireframe
    }
}

extension DishDetailPresenter: DishDetailPresenterInterface {

    func configure(with output: DishDetail.ViewOutput) -> DishDetail.ViewInput {

        let formatterInput = DishDetail.FormatterInput()

        let formatterOutput = formatter.format(for: formatterInput)

        return DishDetail.ViewInput(models: formatterOutput)
    }

}
