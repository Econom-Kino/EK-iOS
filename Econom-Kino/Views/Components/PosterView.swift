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
    @ObservedObject var posterVM = PosterViewModel()
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
                    
                    VStack (alignment: .leading, spacing: 5) {
                        Text("Вік: \(movie.age ?? false ? "18+" : "0+")")
                        Text("Жанр: \(posterVM.movieGenresToString(genres: movie.genre_names ?? []))")
                            .lineLimit(1)
                        Text("Imdb: \(String(format: "%.1f", movie.rating ?? 0.0))")
                        Text("Тривалість: \(movie.duration ?? 0)")
                        
                    }
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
                                 genre_names: [Genre(id: 1, name: "Жанр1", pseudo_id: 11),
                                               Genre(id: 2, name: "Genre2", pseudo_id: 22)],
                                 name: "Test",
                                 poster_link: "http://image.tmdb.org/t/p/w600_and_h900_bestv2/h5E5kqVGH5DYic95C6EQMFqFbc6.jpg",
                                 age: true,
                                 rating: 7.2,
                                 duration: 123)
    
    static var previews: some View {
        PosterView(movie: testMovie)
    }
}
