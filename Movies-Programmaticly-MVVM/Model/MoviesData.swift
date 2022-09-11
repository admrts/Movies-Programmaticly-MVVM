//
//  MoviesData.swift
//  Movies-Programmaticly-MVVM
//
//  Created by Ali Demirtaş on 11.09.2022.
//

import Foundation

struct MoviesData: Codable {
    let results: [Results]
}

struct Results: Codable {
    
    let title: String
    let overview: String
    let poster_path: String
}
