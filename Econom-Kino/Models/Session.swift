//
//  Cinema.swift
//  Econom-Kino
//
//  Created by Slavik on 15.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import Foundation

struct Session: Identifiable, Decodable, Hashable {
    var id: Int
    var cinema: String?
    var movie: Int
    var price: Int?
    var start_time: String
    var ticket_link: String?
    var language: String?
    var technology: String?
    
}
