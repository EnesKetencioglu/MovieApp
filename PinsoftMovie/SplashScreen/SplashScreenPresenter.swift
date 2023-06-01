//
//  SplashScreenPresenter.swift
//  PinsoftMovie
//
//  Created by Enes Ketencioglu on 31.05.2023.
//  
//

import Foundation

class SplashScreenPresenter: ViewToPresenterSplashScreenProtocol {

    // MARK: Properties
    var view: PresenterToViewSplashScreenProtocol?
    var interactor: PresenterToInteractorSplashScreenProtocol?
    var router: PresenterToRouterSplashScreenProtocol?
}

extension SplashScreenPresenter: InteractorToPresenterSplashScreenProtocol {
    
}
