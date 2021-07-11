//
//  DishDetailFormattter.swift
//  DinDinn
//
//  Created by test on 07/07/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

final class DishDetailFormatter {
}

extension DishDetailFormatter: DishDetailFormatterInterface {

    func format(for input: DishDetail.FormatterInput) -> DishDetail.FormatterOutput {
        return DishDetail.FormatterOutput()
    }

}

final class DishDetailInteractor {
}

extension DishDetailInteractor: DishDetailInteractorInterface {
}
