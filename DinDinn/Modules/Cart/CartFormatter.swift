//
//  CartFormatter.swift
//  DinDinn
//
//  Created by test on 08/07/21.
//

import Foundation
import RxSwift
import RxCocoa

final class CartFormatter {
}

extension CartFormatter: CartFormatterInterface {

    func format(for input: Cart.FormatterInput) -> Cart.FormatterOutput {
        return Cart.FormatterOutput()
    }

}
