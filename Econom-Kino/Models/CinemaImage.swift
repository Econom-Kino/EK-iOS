//
//  CinemaImage.swift
//  Econom-Kino
//
//  Created by Slavik on 30.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import Foundation

struct CinemaImage: Decodable, Hashable {
    let cinema: String
    let image_link: String
}
