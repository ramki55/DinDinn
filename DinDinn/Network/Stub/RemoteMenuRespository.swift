//
//  RemoteMenuRespository.swift
//  DinDinn
//
//  Created by test on 06/07/21.
//

import Foundation
import RxSwift
import Moya
import Moya_ObjectMapper

struct RemoteMenuRepository : MenuRepositoryInterface {
    private let provider = MoyaProvider<RestaurentMenuService>()

    func getMenu(restaurentId: String) -> Single<Menu> {
        return provider.rx.request(.getMenu(restaurentId: restaurentId))
            .mapObject(Menu.self)
            .map{ $0 }
    }
}


