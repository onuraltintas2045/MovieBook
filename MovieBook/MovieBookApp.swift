//
//  MovieBookApp.swift
//  MovieBook
//
//  Created by Onur Altintas on 4.03.2024.
//

import SwiftUI

@main
struct MovieBookApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(filmViewModel: MovieViewModel())
            //MovieDetailView(viewModel: DetailViewModel())
        }
    }
}
