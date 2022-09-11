//
//  WebService.swift
//  Movies-Programmaticly-MVVM
//
//  Created by Ali Demirtaş on 11.09.2022.
//

import Foundation

class WebService {

    func LoadMovies(url: URL, completion: @escaping(MoviesData?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let e = error {
                print(e)
                completion(nil)
            }else if let safeData = data {
                
            let mL = try? JSONDecoder().decode(MoviesData.self, from: safeData)
                if let movieList = mL {
                    completion(movieList)
                }
            }
            
        }.resume()
}
}
