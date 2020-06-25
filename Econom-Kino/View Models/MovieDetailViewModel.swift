//
//  MovieDetailViewModel.swift
//  Econom-Kino
//
//  Created by Slavik on 12.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import Foundation

enum Sortings {
    case time
    case cheaper
    case expensive
    case cinemaRating
}

class MovieDetailViewModel: ObservableObject {
    static let shared = MovieDetailViewModel()
    
    @Published var sessions: [Session] = []
    @Published var choosenTechnologies: [String] = ["2D", "3D", "4DX", "LUX"]
    
    
    private init() {}
    
    
    func fetchSessions(day: String, month: String, year: String, movie: Int) {
        let apiUrl = "https://ekinoback.herokuapp.com/movies/\(movie)/date/\(year)/\(day)/\(month)/sessions"
        sessions.removeAll()
        print(apiUrl)
        
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
                        self.sessions = try JSONDecoder().decode([Session].self, from: data)
                    } catch let err {
                        print("Error: \(err)")
                    }
                }
            }
            else {
                print("HTTPURLResponse code: \(response.statusCode)")
            }
        }.resume()
    }
    
    func sortSessions(_ sortType: Sortings) {
        switch sortType {
            case .cheaper:
                self.sessions.sort(by: {$0.price! < $1.price!})
            
            case .expensive:
                self.sessions.sort(by: {$0.price! > $1.price!})
            
            case .time:
                let formatter = ISO8601DateFormatter()
                self.sessions.sort(by: {
                    formatter.date(from: $0.start_time)! < formatter.date(from: $1.start_time)!
                
                })
            
            case .cinemaRating:
                self.sessions.sort(by: {
                    CinemasViewModel.shared.getCinemaNameByPlaceID($0.cinema!) > CinemasViewModel.shared.getCinemaNameByPlaceID($1.cinema!)
                })
        }
    }
}
