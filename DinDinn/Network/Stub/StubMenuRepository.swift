//
//  StubMenuRepository.swift
//  DinDinn
//
//  Created by test on 06/07/21.
//

import Foundation
import RxSwift
import Moya
import Moya_ObjectMapper

struct StubMenuRepository : MenuRepositoryInterface {
    private let provider = MoyaProvider<RestaurentMenuService>(stubClosure: MoyaProvider.immediatelyStub)

    func getMenu(restaurentId: String) -> Single<Menu> {
        return provider.rx.request(.getMenu(restaurentId: restaurentId))
            .mapObject(Menu.self)
            .map{ $0 }
    }
}


