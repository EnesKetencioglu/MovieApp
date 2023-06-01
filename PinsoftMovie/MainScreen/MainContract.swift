//
//  MainContract.swift
//  PinsoftMovie
//
//  Created by Enes Ketencioglu on 31.05.2023.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewMainProtocol {

    func loadMovie(movie:Movie)
    func showAlert()
   
}


// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMainProtocol {
    
    var view: PresenterToViewMainProtocol? { get set }
    var interactor: PresenterToInteractorMainProtocol? { get set }
    var router: PresenterToRouterMainProtocol? { get set }
    

    func getMovie(movie:String)
}


// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMainProtocol {
    
    var presenter: InteractorToPresenterMainProtocol? { get set }
    var apiService:ApiService?{ get set }
    func getMovie(movie:String, completion: @escaping (Result<Movie, Error>) -> Void)
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterMainProtocol {
    
}


// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMainProtocol {
    
}
