//
//  Movie.swift
//  Econom-Kino
//
//  Created by Slavik on 22.04.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import Foundation

struct Movie: Identifiable, Decodable {
    var id: Int
    var genre_names: [Genre]?
    var actors_names: [Actor]?
    var studio_names: [Studio]?
    var name: String
    var trailer_link: String?
    var poster_link: String
    var age: Bool?
    var rating: Float?
    var duration: Int?
    var release_date: String?
    var country_production: String?
    var director: String?
    var description: String?
    
    init() {
        self.id = -1
        self.name = "Test"
        self.poster_link = "https://image.tmdb.org/t/p/w600_and_h900_bestv2/w0TeZ0oGijYVubQYAakm7eo41Gn.jpg"
    }
}

struct Genre: Decodable {
    var id: Int
    var name: String
    var pseudo_id: Int
}

struct Actor: Decodable, Hashable {
    var id: Int
    var name: String
}

struct Studio: Decodable, Hashable{
    var id: Int
    var name: String
}
