//
//  CinemaPosterView.swift
//  Econom-Kino
//
//  Created by Slavik on 30.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct CinemaPosterView: View {
    @ObservedObject var cinemasVM = CinemasViewModel.shared
    var cinema: Cinema
    
    var body: some View {
        ZStack (alignment: .leading) {
                
            // Backgroun Image
            WebImage(url: URL(string: cinemasVM.getCinemaRandomImage(placeId: cinema.place_id!)))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 115, alignment: .center)
                .clipped()
                .cornerRadius(30)
                .shadow(color: Color.mainBlack.opacity(0.2), radius: 10, x: 5, y: 5)
                .blur(radius: 8)
                .clipShape(RoundedRectangle(cornerRadius: 30))

            RoundedRectangle(cornerRadius: 30)
                .fill(Color.mainBlack)
                .frame(height: 115)
                .opacity(0.3)
        }
    }
}

struct CinemaPosterView_Previews: PreviewProvider {
    static var previews: some View {
        CinemaPosterView(cinema: Cinema())
    }
}
