//
//  String.swift
//  Econom-Kino
//
//  Created by Slavik on 03.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
