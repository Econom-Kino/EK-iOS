//
//  CinemaDetailView.swift
//  Econom-Kino
//
//  Created by Slavik on 03.07.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI


struct CinemaDetailView: View {
    @ObservedObject var cinemaVM = CinemasViewModel.shared
    var cinema: Cinema
    var imageIndex = 0
    
    var body: some View {
        ZStack (alignment: .leading) {
            Color.mainGray.edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack (alignment: .leading) {
                    
                    GeometryReader { geometry in
                        ImageCarouselView(numberOfImages: self.cinemaVM.cinemaImages["\(self.cinema.place_id!)"]!.count) {
                            ForEach(self.cinemaVM.cinemaImages["\(self.cinema.place_id!)"]!, id: \.self) { i in
                                WebImage(url: URL(string: i))
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: geometry.size.width, height: geometry.size.height)
                                    .clipped()
                            }
                        }
                    }
                    .frame(height: 300, alignment: .center)
                    
                    
                    Text("\(cinema.name ?? "Test")")
                        .font(.title)
                        .fontWeight(.medium)
                        .padding(.leading)
                    
                    
                    
                }
                
            }.edgesIgnoringSafeArea(.all)
            .foregroundColor(.mainBlack)
        }
    }
}

struct CinemaDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CinemaDetailView(cinema: Cinema())
    }
}


