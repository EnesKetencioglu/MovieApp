//
//  ApiService.swift
//  PinsoftMovie
//
//  Created by Enes Ketencioglu on 31.05.2023.
//

import Foundation
import Alamofire

class ApiService {
    enum ApiError :Error {
        case badNetwork,apiNotResponse,parseError
    }
    func getMovie(movieTitle: String, completion: @escaping (Result<Movie, Error>) -> Void) {
        let apiKey = "afab0e87"
        let title = movieTitle.replacingOccurrences(of: " ", with: "+")
        
        let urlString = "https://www.omdbapi.com/?t=\(title)&apikey=\(apiKey)"
        
        AF.request(urlString).responseDecodable(of: Movie.self) { response in
            switch response.result {
            case .success(let movie):
                completion(.success(movie))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
