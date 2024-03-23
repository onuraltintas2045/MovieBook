//
//  DetailViewModel.swift
//  MovieBook
//
//  Created by Onur Altintas on 23.03.2024.
//

import Foundation


class DetailViewModel: ObservableObject {
    @Published var filmDetail: MovieDetailModel? = nil
    let network = Network()
    
    func getMovieDetails(imdbID: String){
        network.getMovieDetails(imdbId: imdbID) { sonuc in
            switch sonuc {
            case .success(let movieDetail):
                DispatchQueue.main.async{
                    self.filmDetail = movieDetail
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
