//
//  MovieViewModel.swift
//  MovieBook
//
//  Created by Onur Altintas on 6.03.2024.
//

import Foundation
import SwiftUI


class MovieViewModel: ObservableObject {
    
    @Published var movieResult: [Film] = []
    @Published var movieImage: Image = Image("wonderwoman")
    let network = Network()
    
    func getSearchByTitle(title: String){
        network.getMovieSearchResults(search: title) { sonuc in
            switch sonuc {
            case .success(let movies):
                DispatchQueue.main.async{
                    self.movieResult = movies
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    func getMovieImage(imgUrl: String){
        network.getMovieImage(imageURL: imgUrl) { Image in
            DispatchQueue.main.async{
                self.movieImage = Image
            }
        }
    }
    
    
}
