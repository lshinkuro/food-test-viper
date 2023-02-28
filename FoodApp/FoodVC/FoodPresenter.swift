//
//  FoodPresenter.swift
//  FoodApp
//
//  Created by Macbook on 25/02/23.
//

import Foundation
import RxSwift

class FoodPresenter {
    let interactor: FoodInteractor
    let router = FoodRouter()
    
    init(interactor: FoodInteractor) {
        self.interactor = interactor
    }
}

extension FoodPresenter {
    func fetchFood() -> Observable<MoviePopular> {
        return interactor.fetchFood()
    }
}
