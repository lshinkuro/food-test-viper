//
//  FoodInteractor.swift
//  FoodApp
//
//  Created by Macbook on 25/02/23.
//

import Foundation
import RxSwift

class FoodInteractor: BaseInteractor {
    
    func fetchFood() -> Observable<MoviePopular> {
        api.requestAPI(endpoint: .fetchFood)
    }
}
