//
//  MenuRepositoryInterface.swift
//  DinDinn
//
//  Created by test on 06/07/21.
//

import RxSwift

protocol MenuRepositoryInterface {
    func getMenu(restaurentId: String) -> Single<Menu>
}
