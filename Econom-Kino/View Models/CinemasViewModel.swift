//
//  CinemasViewModel.swift
//  Econom-Kino
//
//  Created by Slavik on 15.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import Foundation


class CinemasViewModel: ObservableObject {
    static let shared = CinemasViewModel()
    
    @Published var cinemas: [Cinema] = []
    @Published var cinemaImages: [CinemaImage] = []
    
    
    private init() {}
    
    
    func fetchCinemas() {
        let apiUrl = "https://ekinoback.herokuapp.com/cinemas"
        cinemas.removeAll()
        
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
                        self.cinemas = try JSONDecoder().decode([Cinema].self, from: data)
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
    
    
    func fetchCinemaImages() {
        let apiUrl = "https://ekinoback.herokuapp.com/cinema-images"
        cinemaImages.removeAll()
        
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
                        self.cinemaImages = try JSONDecoder().decode([CinemaImage].self, from: data)
                        print(self.cinemaImages)
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
    
    
    func getCinemaNameByPlaceID (_ placeID: String) -> Cinema {
        for cinema in cinemas {
            if cinema.place_id == placeID {
                return cinema
            }
        }
        
        return Cinema(id: nil, name: nil, address: nil, rating: nil, place_id: nil, longitude: nil, latitude: nil, website_link: nil, phone: nil)
    }
}
