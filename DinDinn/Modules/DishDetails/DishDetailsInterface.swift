//
//  DishDetailsInterface.swift
//  DinDinn
//
//  Created by test on 07/07/21.
//

import UIKit
import RxSwift
import RxCocoa

protocol DishDetailWireframeInterface: WireframeInterface {
}

protocol DishDetailViewInterface: ViewInterface {
}

protocol DishDetailPresenterInterface: PresenterInterface {
    func configure(with output: DishDetail.ViewOutput) -> DishDetail.ViewInput
}

protocol DishDetailFormatterInterface: FormatterInterface {
    func format(for input: DishDetail.FormatterInput) -> DishDetail.FormatterOutput
}

protocol DishDetailInteractorInterface: InteractorInterface {
}

enum DishDetail {

    struct ViewOutput {
    }

    struct ViewInput {
        let models: FormatterOutput
    }

    struct FormatterInput {
    }

    struct FormatterOutput {
    }

}
