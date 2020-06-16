//
//  SessionsView.swift
//  Econom-Kino
//
//  Created by Slavik on 12.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct SessionListView: View {
    @ObservedObject var cinemasVM = CinemasViewModel.shared
    
    var body: some View {
        Text("\(cinemasVM.cinemas[0].name ?? " ")").padding()
    }
}

struct SessionListView_Previews: PreviewProvider {
    static var previews: some View {
        SessionListView()
    }
}
