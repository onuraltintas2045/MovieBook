//
//  MovieImage.swift
//  MovieBook
//
//  Created by Onur Altintas on 21.03.2024.
//

import SwiftUI

struct MovieImage: View {
    var url: String
    @ObservedObject var viewModel = MovieViewModel()
    init(url: String){
        self.url = url
        viewModel.getMovieImage(imgUrl: url)
    }
    
    var body: some View {
        viewModel.movieImage
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 150, height: 250)
        
    }
}

