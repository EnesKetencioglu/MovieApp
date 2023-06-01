//
//  DetailRouter.swift
//  PinsoftMovie
//
//  Created by Enes Ketencioglu on 31.05.2023.
//  
//

import Foundation
import UIKit

class DetailRouter: PresenterToRouterDetailProtocol {
    
    static func createModule() -> UIViewController {
        
        let viewController = DetailViewController()
        
        let presenter: ViewToPresenterDetailProtocol & InteractorToPresenterDetailProtocol = DetailPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = DetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = DetailInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
