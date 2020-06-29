//
//  CinemaFilterView.swift
//  Econom-Kino
//
//  Created by Slavik on 29.06.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI

struct CinemaFilterView: View {
    @State var expand: Bool = false
    
    
    var body: some View {
        VStack {
            HStack {
                Text("Обрати\nкінотеатри")
                    .font(.system(size: 16))
                
                Spacer()
                
                Image(systemName: expand ? "chevron.up" : "chevron.down")
                
            }.frame(width: (UIScreen.width - 50) * 0.82, height: 65)
             .onTapGesture {
                withAnimation {
                    self.expand.toggle()
                }
                
            }
            
            if self.expand {
                HStack {
                    CinemaButtonView(cinema: "ChIJl3xz8QnnOkcReSOln9d6RqY")
                    Spacer()
                    CinemaButtonView(cinema: "ChIJ4dGDScndOkcRK6iYsuY5rCk")
                }
                HStack {
                    CinemaButtonView(cinema: "ChIJG3CADybmOkcRkBn2_jOgbyA")
                    Spacer()
                    CinemaButtonView(cinema: "ChIJif8CqgvdOkcRxDok8ta8w7Y")
                }
                HStack {
                    CinemaButtonView(cinema: "ChIJjW4PlXLdOkcRH4w0juRF9Ww")
                    Spacer()
                    CinemaButtonView(cinema: "ChIJ3X6gOm3oOkcRirf_eSmxXSI")
                }
            }
            
        }.padding(.horizontal, 15)
         .padding(.bottom, self.expand ? 10 : 0)
         .background(DefaultBackgroundView())

    }
}

struct CinemaButtonView: View {
    @ObservedObject var movieDetailVM = MovieDetailViewModel.shared
    @ObservedObject var cinemasVM = CinemasViewModel.shared
    let cinema: String
    
    var body: some View {
        Button(action: {
            withAnimation {
                
                if self.movieDetailVM.chooenCinemas.contains(self.cinema) {
                    self.movieDetailVM.chooenCinemas = self.movieDetailVM.chooenCinemas.filter({
                        $0 != self.cinema
                    })
                } else {
                    self.movieDetailVM.chooenCinemas.append(self.cinema)
                }
            }
            
            print("Choosen technologies: \(self.movieDetailVM.chooenCinemas)")
            
        }) {
            
            ZStack {
                if self.movieDetailVM.chooenCinemas.contains(cinema) {
                    RoundedRectangle(cornerRadius: 10)
                    .fill(Color.mainGray)
                    .frame(width: 130, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.mainGray, lineWidth: 4)
                            .shadow(color: Color.mainBlack.opacity(0.2), radius: 3, x: 5, y: 5)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .shadow(color: Color.white, radius: 2, x: -2, y: -2)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    )
                } else {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.mainGray)
                        .frame(width: 120, height: 50)
                        .shadow(color: Color.mainBlack.opacity(0.1), radius: 7, x: 5, y: 5)
                        .shadow(color: Color.white.opacity(0.7), radius: 7, x: -5, y: -5)
                }
                
                Text("\(cinemasVM.getCinemaNameByPlaceID(cinema).name ?? "")")
                    .font(.system(size: 16))
                    .frame(width: 120, alignment: .center)
            }
        }
    }
}

struct CinemaFilterView_Previews: PreviewProvider {
    static var previews: some View {
        CinemaFilterView()
    }
}
