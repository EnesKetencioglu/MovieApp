//
//  MainRouter.swift
//  PinsoftMovie
//
//  Created by Enes Ketencioglu on 31.05.2023.
//  
//

import Foundation
import UIKit

class MainRouter: PresenterToRouterMainProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {
       

        let viewController =  UIStoryboard(name: "MainScreenView", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        
        let presenter: ViewToPresenterMainProtocol & InteractorToPresenterMainProtocol = MainPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MainRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MainInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        viewController.presenter?.interactor?.apiService = ApiService()
        
        return viewController
    }
    
}
