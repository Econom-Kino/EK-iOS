//
//  MoviesViewModel.swift
//  Econom-Kino
//
//  Created by Slavik on 15.05.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import Foundation

let apiUrl = "https://ekinoback.herokuapp.com/movies/today"


class MoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    func fetchMovies() {
        let startTime = CFAbsoluteTimeGetCurrent()
        movies.removeAll()
        
        guard let url = URL(string: apiUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            if let err = err {
                print(err.localizedDescription)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        self.movies = try JSONDecoder().decode([Movie].self, from: data)
                    } catch let err {
                        print("Error: \(err)")
                    }
                }
            }
            else {
                print("HTTPURLResponse code: \(response.statusCode)")
            }
        }.resume()
        print(CFAbsoluteTimeGetCurrent() - startTime)
    }
}
