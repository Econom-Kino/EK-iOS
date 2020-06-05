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
    @Published var chooseDateStr = ""
    
    
    func fetchMovies(day: String, month: String, year: String) {
        let apiUrl = "https://ekinoback.herokuapp.com/movies/date/\(year)/\(day)/\(month)"
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
    }
    
    func searchMoviesByName(search: String) {
        let apiUrl = "https://ekinoback.herokuapp.com/movies/search"
        let parameters = ["name": search]
        
        movies.removeAll()
        
        guard let url = URL(string: apiUrl) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { return }
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { (data, response, err) in
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
    }
    
    func makeCalendar() {
        let weekDayFormatter = DateFormatter()
        weekDayFormatter.dateFormat = "EE"
        weekDayFormatter.locale = Locale(identifier: "uk_UA")
        
        let fullWeekDayFormatter = DateFormatter()
        fullWeekDayFormatter.dateFormat = "EEEE"
        fullWeekDayFormatter.locale = Locale(identifier: "uk_UA")
        
        let fullMonthFormatter = DateFormatter()
        fullMonthFormatter.dateFormat = "MMMM"
        fullMonthFormatter.locale = Locale(identifier: "uk_UA")


        for i in 0..<7 {
            let date = Calendar.current.date(byAdding: .day, value: i, to: Date())!
            let dateComponents = Calendar.current.dateComponents([.day, .year, .month], from: date)
            
            self.week.append(Dates(id: i,
                                   weekDay: weekDayFormatter.string(from: date).capitalizingFirstLetter(),
                                   fullWeekDay: fullWeekDayFormatter.string(from: date).capitalizingFirstLetter(),
                                   day: String(format: "%02d", dateComponents.day!),
                                   month: String(format: "%02d", dateComponents.month!),
                                   fullMonth: fullMonthFormatter.string(from: date),
                                   year: String(dateComponents.year!)))
        }
    }
    
    func updateChoosenDateStr() {
        self.chooseDateStr = "\(self.week[self.chosenDate].fullWeekDay) \(self.week[self.chosenDate].day) \(self.week[self.chosenDate].fullMonth)"
    }
}
