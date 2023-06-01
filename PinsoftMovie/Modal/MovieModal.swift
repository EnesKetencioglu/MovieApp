//
//  MovieModal.swift
//  PinsoftMovie
//
//  Created by Enes Ketencioglu on 31.05.2023.
//

import Foundation

struct Movie: Decodable {
    let title: String
    let year: String
    let plot: String
    let imdbRating: String
    let poster: String
    let director: String
    let writer: String
    let released: String
    let runtime: String
    let genre: String
    
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case plot = "Plot"
        case imdbRating = "imdbRating"
        case poster = "Poster"
        case director = "Director"
        case writer = "Writer"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
    }
}
