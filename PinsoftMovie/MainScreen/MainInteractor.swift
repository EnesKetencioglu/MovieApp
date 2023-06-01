//
//  MainInteractor.swift
//  PinsoftMovie
//
//  Created by Enes Ketencioglu on 31.05.2023.
//  
//

import Foundation

class MainInteractor: PresenterToInteractorMainProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterMainProtocol?
    var apiService:ApiService?
    
    func getMovie(movie: String, completion: @escaping (Result<Movie, Error>) -> Void) {
         apiService?.getMovie(movieTitle: movie) { result in
             switch result {
             case .success(let movie):
                 completion(.success(movie))
             case .failure(let error):
                 completion(.failure(error))
             }
         }
     }
}
