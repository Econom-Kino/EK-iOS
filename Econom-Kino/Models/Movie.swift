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
    var name: String
    var poster_link: String
    var age: Bool?
    var rating: Float?
    var duration: Int?
}

struct MovieDetail: Identifiable, Decodable {
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
}

struct Genre: Decodable {
    var id: Int
    var name: String
    var pseudo_id: Int
}

struct Actor: Decodable {
    var id: Int
    var name: String
}

struct Studio: Decodable {
    var id: Int
    var name: String
}
