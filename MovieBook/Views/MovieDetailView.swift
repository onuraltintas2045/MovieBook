//
//  MovieDetailView.swift
//  MovieBook
//
//  Created by Onur Altintas on 22.03.2024.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: DetailViewModel = DetailViewModel()
    var imdbID: String
    
    
    
    var body: some View {
        VStack(alignment: .leading){
            MovieImage(url: viewModel.filmDetail?.poster ?? "No URL")
                .padding(.leading,100)
            Text("Title : \(viewModel.filmDetail?.title ?? "Unknown")")
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.blue)
                .padding(10)
            
            Text("Year : \(viewModel.filmDetail?.year ?? "Unknown")")
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.white)
                .padding(10)
            Text("Imdb Score : \(viewModel.filmDetail?.imdbRating ?? "Unknown")")
                .font(.subheadline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.white)
                .padding(10)
            Text("Writers : \(viewModel.filmDetail?.writer ?? "Unknown")")
                .font(.subheadline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.white)
                .padding(10)
            Text("Actors : \(viewModel.filmDetail?.actors ?? "Unknown")")
                .font(.subheadline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.white)
                .padding(10)
            Text("Plot : \(viewModel.filmDetail?.plot ?? "Unknown")")
                .font(.subheadline)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundStyle(Color.white)
                .padding(10)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.7))
        .onAppear(perform: {
            viewModel.getMovieDetails(imdbID: imdbID)
            
        })
        
    }
        
    
    
}

#Preview {
    MovieDetailView(imdbID: "tt0145487")
}
