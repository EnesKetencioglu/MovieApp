//
//  SplashScreenRouter.swift
//  PinsoftMovie
//
//  Created by Enes Ketencioglu on 31.05.2023.
//  
//

import Foundation
import UIKit

class SplashScreenRouter: PresenterToRouterSplashScreenProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
        
        
        let viewController = SplashScreenViewController()
        
        let presenter: ViewToPresenterSplashScreenProtocol & InteractorToPresenterSplashScreenProtocol = SplashScreenPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = SplashScreenRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = SplashScreenInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
