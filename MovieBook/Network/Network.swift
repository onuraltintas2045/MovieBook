//
//  Network.swift
//  MovieBook
//
//  Created by Onur Altintas on 4.03.2024.
//

import Foundation
import SwiftUI

class Network {
    var baseApi = "https://www.omdbapi.com/?apikey=9632758f&"

    func getMovieSearchResults(search : String, completion: @escaping (Result<[Film],ApiError>) -> Void) {
        guard let url = URL(string: "https://www.omdbapi.com/?apikey=9632758f&s=\(search)") else{
            return completion(.failure(ApiError.urlError))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else{
                return completion(.failure(ApiError.getDataError))
            }
            
            guard let moviesResponse = try? JSONDecoder().decode(GelenFilm.self, from: data) else{
                return completion(.failure(ApiError.dataHandleError))
            }
            
            return completion(.success(moviesResponse.filmler)) 
        }.resume()
        
        
        
        /*
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else{
                return completion(.failure(ApiError.getDataError))
            }
            
            guard let moviesResponse = try? JSONDecoder().decode(GelenFilm.self, from: data) else{
                return completion(.failure(ApiError.dataHandleError))
            }
            
            return completion(.success(moviesResponse))
        }.resume()
         */
        
    }
    
    func getMovieImage(imageURL: String, completion : @escaping(Image) -> Void) {
        
        guard let url = URL(string: imageURL) else{
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else{
                return completion(Image("wonderwoman"))
            }
            if let uiImage = UIImage(data: data){
                let image = Image(uiImage: uiImage)
                return completion(image)
            }
            else{
                return completion(Image("wonderwoman"))
            }
        }.resume()
        
    }
    
    func getMovieDetails(imdbId: String, completion : @escaping (Result<MovieDetailModel, ApiError>) -> Void){
        
        guard let url = URL(string: "https://www.omdbapi.com/?apikey=9632758f&i=\(imdbId)") else{
            return completion(.failure(ApiError.urlError))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else{
                return completion(.failure(ApiError.getDataError))
            }
            guard let detailResponse = try? JSONDecoder().decode(MovieDetailModel.self, from: data) else{
                return completion(.failure(ApiError.dataHandleError))
            }
            return completion(.success(detailResponse))
        }.resume()
        
    }
    
    
    
}

