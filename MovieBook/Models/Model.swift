//
//  Model.swift
//  MovieBook
//
//  Created by Onur Altintas on 6.03.2024.
//

import Foundation


enum ApiError: String, Error {
    case urlError = "URL Hatali"
    case getDataError = "Veri alinamadi"
    case dataHandleError = "Veriler Donusturulemedi"
}




struct Film : Codable {
    let title : String
    let year : String
    let imdbID : String
    let type : String
    let poster : String

    enum CodingKeys: String, CodingKey {

        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }


}

struct GelenFilm : Codable {
    let filmler : [Film]
    let totalResults : String
    let response : String

    enum CodingKeys: String, CodingKey {

        case filmler = "Search"
        case totalResults = "totalResults"
        case response = "Response"
    }

}



struct MovieDetailModel: Codable {
    let title: String
    let year: String
    let rated: String
    let released: String
    let runtime: String
    let genre: String
    let director: String
    let writer: String
    let actors: String
    let plot: String
    let language: String
    let country: String
    let awards: String
    let poster: String
    let ratings: [RatingStatus]
    let metaScore: String
    let imdbRating : String
    let imdbVotes: String
    let imdbID: String
    let type: String
    let dvd: String
    let boxOffice: String
    let production: String
    let website: String
    let response: String
    
    private enum CodingKeys: String, CodingKey{
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metaScore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbVotes = "imdbVotes"
        case imdbID = "imdbID"
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
        
    }
    
    struct RatingStatus: Codable{
        let source: String
        let value: String
        
        private enum CodingKeys: String, CodingKey{
            case source = "Source"
            case value = "Value"
        }
    }
    
}


