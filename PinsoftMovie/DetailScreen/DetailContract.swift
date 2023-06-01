//
//  DetailContract.swift
//  PinsoftMovie
//
//  Created by Enes Ketencioglu on 31.05.2023.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewDetailProtocol {
  
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterDetailProtocol {
    
    var view: PresenterToViewDetailProtocol? { get set }
    var interactor: PresenterToInteractorDetailProtocol? { get set }
    var router: PresenterToRouterDetailProtocol? { get set }
    func pageLoaded(movieTitle:String)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorDetailProtocol {
    
    var presenter: InteractorToPresenterDetailProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterDetailProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterDetailProtocol {
    
}
