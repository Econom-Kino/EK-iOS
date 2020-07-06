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
    @Published var cinemaImages: [String : [String]] = [:]
    
    
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
                        
                        print("Init Fetching Cinema Images")
                        for cinema in self.cinemas {
                            self.fetchCinemaImages(placeId: cinema.place_id!)
                        }
                        
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
    
    
    func fetchCinemaImages(placeId: String) {
        let apiUrl = "https://ekinoback.herokuapp.com/cinemas/\(placeId)/cinema-images"
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
                        let cinamaImg = try JSONDecoder().decode([CinemaImage].self, from: data)
                        self.cinemaImages[placeId] = cinamaImg.map({ $0.image_link })

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
        
        return Cinema()
    }
    
    
    func getCinemaRandomImage(placeId: String) -> String {
        return cinemaImages["\(placeId)"]?.randomElement() ?? "https://cdn-1.appleosophy.com/wp-content/uploads/2020/06/macOSBigSur-696x428.png"
    }
}
