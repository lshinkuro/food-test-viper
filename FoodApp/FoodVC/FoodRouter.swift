//
//  FoodRouter.swift
//  FoodApp
//
//  Created by Macbook on 25/02/23.
//

import Foundation

class FoodRouter {
    
    func showView() -> FoodViewController {
        let interactor = FoodInteractor()
        let presenter = FoodPresenter(interactor: interactor)
        let view = FoodViewController(nibName: String(describing: FoodViewController.self), bundle: nil)
        view.presenter = presenter
        
        return view
    }
}
