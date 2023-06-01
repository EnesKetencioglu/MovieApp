//
//  MainPresenter.swift
//  PinsoftMovie
//
//  Created by Enes Ketencioglu on 31.05.2023.
//  
//

import Foundation

class MainPresenter: ViewToPresenterMainProtocol {
    // MARK: Properties
    var view: PresenterToViewMainProtocol?
    var interactor: PresenterToInteractorMainProtocol?
    var router: PresenterToRouterMainProtocol?
    
    
    
    func getMovie(movie: String) {
        interactor?.getMovie(movie: movie) { result in
            switch result {
            case .success(let movie):
                self.view?.loadMovie(movie: movie)
            case .failure(let error):
                self.view?.showAlert()
                print("Error: \(error)")
            }
        }

    }
 
}


extension MainPresenter: InteractorToPresenterMainProtocol {
    
}
