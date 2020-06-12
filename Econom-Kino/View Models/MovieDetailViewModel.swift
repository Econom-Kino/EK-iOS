//
//  MovieDetailViewModel.swift
//  Econom-Kino
//
//  Created by Slavik on 12.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    func movieGenresToString(genres: [Genre]) -> String {
        var genresArray: [String] = []
        
        for genere in genres {
            genresArray.append(genere.name)
        }
        
        return genresArray.joined(separator: ", ")
    }
}
