//
//  ContentView.swift
//  MovieBook
//
//  Created by Onur Altintas on 4.03.2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var filmViewModel: MovieViewModel
    @State var searchMovie: String = ""
    @State var getMovie: String = ""
    
    var filteredMovies: [Film] {
        guard !searchMovie.isEmpty else{ return filmViewModel.movieResult}
        
        return filmViewModel.movieResult.filter{$0.title.localizedCaseInsensitiveContains(searchMovie)}
    }
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    TextField("Get Movies", text: $getMovie, onCommit: { replaceAndSearchMovie(title: getMovie)})
                        .frame(width: 250,height: 20)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    Button {
                        replaceAndSearchMovie(title: getMovie)
                    } label: {
                        Text("Verileri Getir")
                    }
                    Spacer()
                }
                
                
                List(filteredMovies, id: \.imdbID) { film in
                    
                    NavigationLink( destination:
                        MovieDetailView(imdbID: film.imdbID),
                     label: {
                        HStack {
                            HStack(alignment: .center){
                                MovieImage(url: film.poster)
                                VStack(alignment : .leading){
                                    Text(film.title)
                                        .font(.title2)
                                        .foregroundColor(Color.blue)
                                        .padding(.bottom)
                                    Text(film.year)
                                        .font(.title3)
                                        .foregroundColor(Color.black)
                                }
                                .padding(.leading)
                                
                            }
                            Spacer()
                        }
                        .listRowBackground(Color.black.opacity(0.1))
                    })

                    
                }
                .navigationTitle("Movie Book")
                .searchable(text: $searchMovie, prompt: "Search Movie")
            }
        }
        
    }
    
    func replaceAndSearchMovie(title: String) -> Void{
        filmViewModel.getSearchByTitle(title: getMovie.trimmingCharacters(in: .whitespacesAndNewlines)
            .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? getMovie)
    }
}



#Preview {
    ContentView(filmViewModel: MovieViewModel())
}
