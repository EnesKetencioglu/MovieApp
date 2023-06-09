//
//  SplashScreenContract.swift
//  PinsoftMovie
//
//  Created by Enes Ketencioglu on 31.05.2023.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewSplashScreenProtocol {
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterSplashScreenProtocol {
    
    var view: PresenterToViewSplashScreenProtocol? { get set }
    var interactor: PresenterToInteractorSplashScreenProtocol? { get set }
    var router: PresenterToRouterSplashScreenProtocol? { get set }
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorSplashScreenProtocol {
    
    var presenter: InteractorToPresenterSplashScreenProtocol? { get set }
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterSplashScreenProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterSplashScreenProtocol {
    
}
