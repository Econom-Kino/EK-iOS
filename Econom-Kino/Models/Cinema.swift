//
//  Cinema.swift
//  Econom-Kino
//
//  Created by Slavik on 15.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import Foundation


struct Cinema: Identifiable, Decodable, Hashable {
    var id: Int?
    var name: String?
    var address: String?
    var rating: Float?
    let place_id: String?
    let longitude: Float?
    let latitude: Float?
    var website_link: String?
    var phone: String?
    
    init() {
        self.id = nil
        self.name = nil
        self.address = nil
        self.rating = nil
        self.place_id = nil
        self.longitude = nil
        self.latitude = nil
        self.website_link = nil
        self.phone = nil
    }
}
