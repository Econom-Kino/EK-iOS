//
//  MoviesViewModel.swift
//  Econom-Kino
//
//  Created by Slavik on 15.05.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import Foundation


class MoviesViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var movies: [Movie] = []
    @Published var week: [Dates] = []
    @Published var chosenDate: Int = 0
    
    
    func fetchMovies(day: String, month: String, year: String) {
        let apiUrl = "https://ekinoback.herokuapp.com/movies/date/\(year)/\(day)/\(month)"
        print(apiUrl)
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
    
    func makeCalendar() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE"
        dateFormatter.locale = Locale(identifier: "uk_UA")


        for i in 0..<7 {
            let date = Calendar.current.date(byAdding: .day, value: i, to: Date())!
            let dateComponents = Calendar.current.dateComponents([.day, .year, .month], from: date)
            
            self.week.append(Dates(id: i,
                              weekDay: dateFormatter.string(from: date).capitalizingFirstLetter(),
                              day: String(format: "%02d", dateComponents.day!),
                              month: String(format: "%02d", dateComponents.month!),
                              year: String(dateComponents.year!)))
        }
    }
}
