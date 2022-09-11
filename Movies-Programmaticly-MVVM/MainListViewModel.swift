//
//  MainViewModel.swift
//  Movies-Programmaticly-MVVM
//
//  Created by Ali Demirtaş on 11.09.2022.
//

import Foundation

struct MainListViewModel {
    var moviesList: MoviesData
    
    func numberOfRowsInSection() -> Int {
        return moviesList.results.count
    }
    
    func movieAtIndex(index: Int) -> MainViewModel {
        let movie = moviesList.results
        return MainViewModel(movie: movie)
    }
}

struct MainViewModel {
    let movie : [Results]
    
    func title(index: Int) -> String {
        return movie[index].title
    }
    func overview(index: Int) -> String {
        return movie[index].overview
    }
    func imageView(index: Int) -> String {
        return movie[index].poster_path
    }
}
