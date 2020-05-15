//
//  PosterView.swift
//  Econom-Kino
//
//  Created by Slavik on 20.03.2020.
//  Copyright © 2020 Econom Kino. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct PosterView: View {
    var movie: Movie
    
    var body: some View {
        
        // Posrer
        ZStack (alignment: .leading) {
            // Backgroun Image
            WebImage(url: URL(string: movie.poster_link))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 220.0, alignment: .center)
                .clipped()
                .cornerRadius(25)
                .shadow(color: Color.mainBlack.opacity(0.2), radius: 10, x: 5, y: 5)
            
            // Blur background image
            BlurView(.systemThinMaterialDark)
                .frame(height: 220.0)
                .cornerRadius(50, corners: [.topLeft, .bottomLeft])
                .cornerRadius(25, corners: [.topRight, .bottomRight])
            
        
            HStack (alignment: .top, spacing: 5) {
                // Movie poster
                WebImage(url: URL(string: movie.poster_link))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 220)
                    .cornerRadius(25, corners: [.topLeft, .bottomLeft])
                    .shadow(color: Color.black.opacity(0.1), radius: 10, x: 7, y: 7)
                
                // Movie Info
                VStack (alignment: .leading, spacing: 15) {
                    Text(movie.name)
                    .font(.system(size: 25))
                    .fontWeight(.medium)
                    .foregroundColor(Color.white)
                    .lineLimit(1)
                    
                    Text("Вік: 13+\n" +
                         "Жанр: Test\n" +
                        "Imdb: \(movie.rating ?? 0.0)\n" +
                        "Тривалість: \(movie.duration ?? 0)\n" +
                         "Мова: Українська")
                        .font(.body)
                        .foregroundColor(Color.white)
                }.padding(10)
                Spacer()
            }
        }
    }
}

struct PosterView_Previews: PreviewProvider {
    static var testMovie = Movie(id: 1,
                                 genre_names: [],
                                 actors_names: [],
                                 studio_names: [],
                                 name: "Test",
                                 trailer_link: "http://image.tmdb.org/t/p/w600_and_h900_bestv2/h5E5kqVGH5DYic95C6EQMFqFbc6.jpg",
                                 poster_link: "http://image.tmdb.org/t/p/w600_and_h900_bestv2/h5E5kqVGH5DYic95C6EQMFqFbc6.jpg",
                                 age: false,
                                 rating: 1.1,
                                 duration: 10,
                                 release_date: "20.07.2001",
                                 country_production: "Ukraine", director: "Yaroslav Kukhar",
                                 description: "test")
    
    static var previews: some View {
        PosterView(movie: testMovie)
    }
}
